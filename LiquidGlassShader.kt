package com.tyin.mypdf.ui.components

/**
 * AGSL fragment shader porting decoded Apple iOS 27.2.1 (24B156) QuartzCore Metal IR:
 * - Apple 6th-degree Horner supercircle squircle SDF (-0.926054..0.268531) for rounded rects
 * - Quarter-circle lens bevel profile: disp = amount * (1 - sqrt(t * (2 - t)))
 * - 7-tap spectral chromatic dispersion on active drag / 3-tap resting dispersion
 * - blur_fill 3-way min/max/normal adaptive contrast + Rec.709 hue-preserving luma roll-off
 * - Apple 5-term ERF Gaussian ring_shadow + key_fill_highlight with color_bias compression
 */
internal const val LIQUID_GLASS_AGSL = """
    uniform shader image;
    uniform float2 resolution;
    uniform float cornerRadius;
    uniform float refractionHeight;
    uniform float refractionAmount;
    uniform float dispersion;
    uniform float zoomScale;
    uniform float blurRadiusPx;
    uniform half4 tintColor;
    uniform float isDark;

    float sdRoundedBox(float2 p, float2 b, float r) {
        float2 q = abs(p) - b + r;
        if (q.x > 0.0 && q.y > 0.0 && r < min(b.x, b.y) - 0.5) {
            // Apple QuartzCore supercircleImage 6th-degree Horner squircle polynomial
            float2 u = q / max(r, 1.0);
            float dNorm = length(u);
            float denom = max(max(u.x, u.y), 1e-5);
            float t = clamp(min(u.x, u.y) / denom, 0.0, 1.0);
            float bezier = ((((-0.926054 * t + 3.15601) * t - 3.64122) * t + 1.26803) * t + 0.268531) * t * t;
            return (dNorm - (1.0 / max(1.0 - bezier, 1e-4))) * r;
        }
        return min(max(q.x, q.y), 0.0) + length(max(q, 0.0)) - r;
    }

    float2 sdfNormal(float2 p, float2 b, float r) {
        float2 gx = float2(1.0, 0.0);
        float2 gy = float2(0.0, 1.0);
        float dx = sdRoundedBox(p + gx, b, r) - sdRoundedBox(p - gx, b, r);
        float dy = sdRoundedBox(p + gy, b, r) - sdRoundedBox(p - gy, b, r);
        float2 g = float2(dx, dy);
        float len = length(g);
        return len > 1e-4 ? g / len : float2(0.0, 0.0);
    }

    half3 sampleClamped(float2 coord) {
        float2 safe = clamp(coord, float2(1.0), max(resolution - 1.0, float2(1.0)));
        return image.eval(safe).rgb;
    }

    // Apple 5-term Gaussian ERF approximation (glass_background_all_lpf.ll:215-224)
    float caErf(float x) {
        float u = clamp(x * 0.70710678 * 0.25 + 0.5, 0.0, 1.0) * 4.0 - 2.0;
        float u2 = u * u;
        return ((((-0.00083 * u2 + 0.015) * u2 - 0.14) * u2 + 0.78) * u + 0.5);
    }

    // Circular bevel profile: 1 - sqrt(t * (2 - t)) (exact QuartzCore lens curve)
    float circularBevel(float distIn, float invHeight) {
        float t = clamp(distIn * invHeight, 0.0, 1.0);
        return 1.0 - sqrt(max(t * (2.0 - t), 0.0));
    }

    half3 sampleSpectral(float2 baseCoord, float2 aberVec, float disp) {
        if (disp <= 0.30) {
            half rCh = sampleClamped(baseCoord + aberVec).r;
            half gCh = sampleClamped(baseCoord).g;
            half bCh = sampleClamped(baseCoord - aberVec).b;
            return half3(rCh, gCh, bCh);
        }
        // Apple 7-tap spectral integration (glass_foreground_lpf.ll:121-193)
        half rAcc = 0.0;
        half gAcc = 0.0;
        half bAcc = 0.0;
        for (int i = 0; i < 3; i++) {
            float t = 1.0 - float(i) * 0.3333333;
            half3 s = sampleClamped(baseCoord + aberVec * t);
            rAcc += s.r * half(t);
            gAcc += s.g * half(1.0 - t);
        }
        for (int j = 0; j < 4; j++) {
            float t = float(j) * 0.3333333;
            half3 s = sampleClamped(baseCoord - aberVec * t);
            gAcc += s.g * half(1.0 - t);
            bAcc += s.b * half(t);
        }
        return half3(rAcc * 0.5, gAcc * 0.3333333, bAcc * 0.5);
    }

    half4 main(float2 fragCoord) {
        float2 halfSize = resolution * 0.5;
        float r = clamp(cornerRadius, 1.0, min(halfSize.x, halfSize.y));
        float2 p = fragCoord - halfSize;
        float d = sdRoundedBox(p, halfSize, r);

        if (d > 0.5) {
            return half4(0.0);
        }

        float2 n = sdfNormal(p, halfSize, r);
        float distIn = max(-d, 0.0);
        float bevel = max(refractionHeight, 1.0);
        float invHeight = 1.0 / bevel;

        // Apple circular lens displacement + inner convex zoom
        float outerDisp = circularBevel(distIn, invHeight);
        float invZoom = 1.0 / max(zoomScale, 1.0);
        float2 innerCoord = halfSize + p * invZoom;
        float2 shift = n * (refractionAmount * outerDisp);
        float2 refracted = innerCoord + shift;

        // Per-pixel variable mipmap blur for small crystal pills; tall sheets/droplists use full hardware Gaussian.
        float varMip = smoothstep(bevel * 0.22, bevel * 1.30, distIn);
        float diskR = blurRadiusPx * varMip;
        half3 glassRgb = sampleSpectral(refracted, shift * dispersion, dispersion);
        if (diskR > 0.45 && blurRadiusPx < 28.0) {
            half3 vAcc = glassRgb;
            float2 d0 = float2(0.3535, 0.0000);
            float2 d1 = float2(-0.3698, 0.3388);
            float2 d2 = float2(0.0537, -0.6100);
            float2 d3 = float2(0.4534, 0.5416);
            float2 d4 = float2(-0.7795, -0.1558);
            float2 d5 = float2(0.6713, -0.5257);
            float2 d6 = float2(-0.1819, 0.9037);
            float2 d7 = float2(-0.5629, -0.8265);
            vAcc += sampleClamped(refracted + d0 * diskR);
            vAcc += sampleClamped(refracted + d1 * diskR);
            vAcc += sampleClamped(refracted + d2 * diskR);
            vAcc += sampleClamped(refracted + d3 * diskR);
            vAcc += sampleClamped(refracted + d4 * diskR);
            vAcc += sampleClamped(refracted + d5 * diskR);
            vAcc += sampleClamped(refracted + d6 * diskR);
            vAcc += sampleClamped(refracted + d7 * diskR);
            glassRgb = mix(glassRgb, vAcc * (1.0 / 9.0), varMip * 0.85);
        }

        // Apple blur_fill micro-adaptive contrast (keeps water refraction razor-sharp)
        half3 bfA = sampleClamped(refracted + float2(2.0, 2.0));
        half3 bfB = sampleClamped(refracted - float2(2.0, 2.0));
        half3 blurFill = (bfA + bfB) * 0.5;
        half3 dCol = min(glassRgb, blurFill);
        half3 lCol = max(glassRgb, blurFill);
        half dOp = 0.03;
        half lOp = isDark > 0.5 ? 0.04 : 0.03;
        half3 adaptive = dCol * dOp + lCol * lOp + glassRgb * (1.0 - dOp - lOp);
        adaptive = mix(adaptive, blurFill, 0.02);

        // Rec.709 hue-preserving luma compression + ultra-clear water tint mix
        float luma = dot(adaptive, half3(0.2126, 0.7152, 0.0722));
        float comp = clamp(1.0 - luma * (isDark > 0.5 ? 0.04 : 0.06), 0.0, 1.0);
        adaptive = mix(half3(luma * comp), adaptive * half(comp), 1.0 + (1.0 - comp) * 0.3);
        half3 tinted = mix(adaptive, tintColor.rgb, tintColor.a);

        // Apple 5-term ERF Gaussian ring_shadow hugging outer rim (zero center fog)
        float ring = clamp(caErf(distIn * 0.45) - caErf((distIn + 1.3) * 0.45), 0.0, 1.0);
        float ringDarken = isDark > 0.5 ? 0.026 : 0.028;
        tinted = max(tinted - half3(ring * ringDarken), half3(0.0));

        // Subtle curved water meniscus sheen (never milky on white)
        float vertNorm = clamp(-p.y / max(halfSize.y, 1.0), -1.0, 1.0);
        float domeSheen = smoothstep(-0.10, 0.95, vertNorm) * (isDark > 0.5 ? 0.022 : 0.028);

        // Apple key_fill_highlight directional specular with color_bias saturation compression
        float rimSharp = smoothstep(2.0, 0.0, distIn);
        float2 keyDir = normalize(float2(-0.35, -0.94));
        float keyRaw = clamp((dot(n, keyDir) - 0.15) / 0.85, 0.0, 1.0);
        float fillRaw = clamp((dot(n, -keyDir) - 0.20) / 0.80, 0.0, 1.0);
        float bias = 0.45;
        float keyHit = keyRaw / (1.0 + bias * (1.0 - keyRaw));
        float fillHit = fillRaw / (1.0 + bias * (1.0 - fillRaw));
        float specStrength = isDark > 0.5 ? 0.56 : 0.78;
        float rimSpec = rimSharp * (keyHit * specStrength + fillHit * (specStrength * 0.56) + 0.035);

        // Inner water caustic bounce along bottom curve
        float caustic = smoothstep(4.5, 0.8, distIn) * pow(clamp(n.y, 0.0, 1.0), 2.0) * (isDark > 0.5 ? 0.12 : 0.18);

        // Rainbow iridescence activated on high-dispersion drag lenses
        float prismMask = smoothstep(2.2, 0.0, distIn) * clamp((dispersion - 0.36) * 1.1, 0.0, 1.0) * abs(n.y);
        half3 prismGlow = half3(keyHit * 0.12, 0.09, clamp(n.y, 0.0, 1.0) * 0.18 + keyHit * 0.08) * prismMask;

        half3 outRgb = clamp(tinted + half3(domeSheen + rimSpec + caustic) + prismGlow, half3(0.0), half3(1.0));
        return half4(outRgb, 1.0);
    }
"""

/**
 * In-flow AGSL Liquid Glass card surface shader (no external backdrop texture required,
 * safe inside liquidBackdropSource trees): Apple supercircle SDF + directional key_fill_highlight
 * specular rim + caErf edge definition + subtle water meniscus sheen.
 */
internal const val LIQUID_GLASS_SURFACE_AGSL = """
    uniform float2 resolution;
    uniform float cornerRadius;
    uniform half4 tintColor;
    uniform float isDark;

    float sdRoundedBox(float2 p, float2 b, float r) {
        float2 q = abs(p) - b + r;
        if (q.x > 0.0 && q.y > 0.0 && r < min(b.x, b.y) - 0.5) {
            float2 u = q / max(r, 1.0);
            float dNorm = length(u);
            float denom = max(max(u.x, u.y), 1e-5);
            float t = clamp(min(u.x, u.y) / denom, 0.0, 1.0);
            float bezier = ((((-0.926054 * t + 3.15601) * t - 3.64122) * t + 1.26803) * t + 0.268531) * t * t;
            return (dNorm - (1.0 / max(1.0 - bezier, 1e-4))) * r;
        }
        return min(max(q.x, q.y), 0.0) + length(max(q, 0.0)) - r;
    }

    float2 sdfNormal(float2 p, float2 b, float r) {
        float2 gx = float2(1.0, 0.0);
        float2 gy = float2(0.0, 1.0);
        float dx = sdRoundedBox(p + gx, b, r) - sdRoundedBox(p - gx, b, r);
        float dy = sdRoundedBox(p + gy, b, r) - sdRoundedBox(p - gy, b, r);
        float2 g = float2(dx, dy);
        float len = length(g);
        return len > 1e-4 ? g / len : float2(0.0, 0.0);
    }

    float caErf(float x) {
        float u = clamp(x * 0.70710678 * 0.25 + 0.5, 0.0, 1.0) * 4.0 - 2.0;
        float u2 = u * u;
        return ((((-0.00083 * u2 + 0.015) * u2 - 0.14) * u2 + 0.78) * u + 0.5);
    }

    half4 main(float2 fragCoord) {
        float2 halfSize = resolution * 0.5;
        float r = clamp(cornerRadius, 1.0, min(halfSize.x, halfSize.y));
        float2 p = fragCoord - halfSize;
        float d = sdRoundedBox(p, halfSize, r);
        if (d > 0.5) return half4(0.0);

        float distIn = max(-d, 0.0);
        float2 n = sdfNormal(p, halfSize, r);

        // Subtle curved meniscus gradient across card face
        float vertNorm = clamp(-p.y / max(halfSize.y, 1.0), -1.0, 1.0);
        float diagNorm = clamp((-p.x * 0.35 - p.y * 0.94) / max(length(halfSize), 1.0), -1.0, 1.0);
        float meniscus = smoothstep(-0.2, 0.95, vertNorm) * (isDark > 0.5 ? 0.045 : 0.055)
                       + smoothstep(0.1, 1.0, diagNorm) * (isDark > 0.5 ? 0.025 : 0.035);

        // Apple 5-term ERF outer rim definition
        float ring = clamp(caErf(distIn * 0.45) - caErf((distIn + 1.3) * 0.45), 0.0, 1.0);
        float ringDark = isDark > 0.5 ? 0.04 : 0.025;

        // Apple key_fill_highlight directional rim specular
        float rimSharp = smoothstep(2.2, 0.0, distIn);
        float2 keyDir = normalize(float2(-0.35, -0.94));
        float keyRaw = clamp((dot(n, keyDir) - 0.15) / 0.85, 0.0, 1.0);
        float fillRaw = clamp((dot(n, -keyDir) - 0.20) / 0.80, 0.0, 1.0);
        float bias = 0.45;
        float keyHit = keyRaw / (1.0 + bias * (1.0 - keyRaw));
        float fillHit = fillRaw / (1.0 + bias * (1.0 - fillRaw));
        float specStrength = isDark > 0.5 ? 0.24 : 0.42;
        float rimSpec = rimSharp * (keyHit * specStrength + fillHit * (specStrength * 0.52) + 0.03);

        half3 baseRgb = tintColor.rgb;
        half3 outRgb = clamp(baseRgb - half3(ring * ringDark) + half3(meniscus + rimSpec), half3(0.0), half3(1.0));
        return half4(outRgb, tintColor.a);
    }
"""

