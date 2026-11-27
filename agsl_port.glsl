// Clean-room Android AGSL Port of iOS 27.2.1 (24B156) Liquid Glass
// 1. Backdrop Refraction Shader (floating pills, bars, dock, sheets)

uniform shader image;
uniform float2 resolution;
uniform float cornerRadius;
uniform float refractionHeight;
uniform float refractionAmount;
uniform float dispersion;
uniform float zoomScale;
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

half3 sampleClamped(float2 coord) {
    float2 safe = clamp(coord, float2(1.0), max(resolution - 1.0, float2(1.0)));
    return image.eval(safe).rgb;
}

float caErf(float x) {
    float u = clamp(x * 0.70710678 * 0.25 + 0.5, 0.0, 1.0) * 4.0 - 2.0;
    float u2 = u * u;
    return ((((-0.00083 * u2 + 0.015) * u2 - 0.14) * u2 + 0.78) * u + 0.5);
}

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
    half rAcc = 0.0, gAcc = 0.0, bAcc = 0.0;
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
    if (d > 0.5) return half4(0.0);

    float2 n = sdfNormal(p, halfSize, r);
    float distIn = max(-d, 0.0);
    float invHeight = 1.0 / max(refractionHeight, 1.0);
    float outerDisp = circularBevel(distIn, invHeight);
    float2 innerCoord = halfSize + p * (1.0 / max(zoomScale, 1.0));
    float2 shift = n * (refractionAmount * outerDisp);
    float2 refracted = innerCoord + shift;

    half3 glassRgb = sampleSpectral(refracted, shift * dispersion, dispersion);

    half3 bfA = sampleClamped(refracted + float2(2.0, 2.0));
    half3 bfB = sampleClamped(refracted - float2(2.0, 2.0));
    half3 blurFill = (bfA + bfB) * 0.5;
    half3 dCol = min(glassRgb, blurFill);
    half3 lCol = max(glassRgb, blurFill);
    half dOp = 0.03;
    half lOp = isDark > 0.5 ? 0.04 : 0.03;
    half3 adaptive = mix(dCol * dOp + lCol * lOp + glassRgb * (1.0 - dOp - lOp), blurFill, 0.02);

    float luma = dot(adaptive, half3(0.2126, 0.7152, 0.0722));
    float comp = clamp(1.0 - luma * (isDark > 0.5 ? 0.04 : 0.06), 0.0, 1.0);
    adaptive = mix(half3(luma * comp), adaptive * half(comp), 1.0 + (1.0 - comp) * 0.3);
    half3 tinted = mix(adaptive, tintColor.rgb, tintColor.a);

    float ring = clamp(caErf(distIn * 0.45) - caErf((distIn + 1.3) * 0.45), 0.0, 1.0);
    tinted = max(tinted - half3(ring * (isDark > 0.5 ? 0.026 : 0.028)), half3(0.0));

    float vertNorm = clamp(-p.y / max(halfSize.y, 1.0), -1.0, 1.0);
    float domeSheen = smoothstep(-0.10, 0.95, vertNorm) * (isDark > 0.5 ? 0.022 : 0.028);

    float rimSharp = smoothstep(2.0, 0.0, distIn);
    float2 keyDir = normalize(float2(-0.35, -0.94));
    float keyRaw = clamp((dot(n, keyDir) - 0.15) / 0.85, 0.0, 1.0);
    float fillRaw = clamp((dot(n, -keyDir) - 0.20) / 0.80, 0.0, 1.0);
    float keyHit = keyRaw / (1.0 + 0.45 * (1.0 - keyRaw));
    float fillHit = fillRaw / (1.0 + 0.45 * (1.0 - fillRaw));
    float specStrength = isDark > 0.5 ? 0.56 : 0.78;
    float rimSpec = rimSharp * (keyHit * specStrength + fillHit * (specStrength * 0.56) + 0.035);

    float caustic = smoothstep(4.5, 0.8, distIn) * pow(clamp(n.y, 0.0, 1.0), 2.0) * (isDark > 0.5 ? 0.12 : 0.18);
    float prismMask = smoothstep(2.2, 0.0, distIn) * clamp((dispersion - 0.36) * 1.1, 0.0, 1.0) * abs(n.y);
    half3 prismGlow = half3(keyHit * 0.12, 0.09, clamp(n.y, 0.0, 1.0) * 0.18 + keyHit * 0.08) * prismMask;

    return half4(clamp(tinted + half3(domeSheen + rimSpec + caustic) + prismGlow, half3(0.0), half3(1.0)), 1.0);
}
