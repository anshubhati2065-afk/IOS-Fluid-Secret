# Decoded Apple iOS 27.2.1 Liquid Glass Optical & SDF Equations

## 1. Supercircle Squircle SDF (`QuartzCore` `supercircleImage` @ `0x41ccea`)
In corner zones (`q.x > 0 && q.y > 0 && r < min(b.x, b.y) - 0.5`), Apple replaces a circular arc with a 6th-degree Horner polynomial:
```glsl
float2 u = q / max(r, 1.0);
float dNorm = length(u);
float denom = max(max(u.x, u.y), 1e-5);
float t = clamp(min(u.x, u.y) / denom, 0.0, 1.0);
float B = ((((-0.926054 * t + 3.15601) * t - 3.64122) * t + 1.26803) * t + 0.268531) * t * t;
float d = (dNorm - (1.0 / max(1.0 - B, 1e-4))) * r;
```

## 2. Quarter-Circle Lens Bevel (`glass_background_all_lpf.ll`)
Maps inward SDF distance `distIn = max(-d, 0.0)` over bevel height `1 / invHeight`:
```glsl
float t = clamp(distIn * invHeight, 0.0, 1.0);
float disp = amount * (1.0 - sqrt(max(t * (2.0 - t), 0.0)));
```

## 3. 7-Tap Spectral Chromatic Dispersion (`glass_foreground_lpf.ll:121-193`)
Active when `dispersion > 0.30`:
- **3 Forward taps** (`t = 1.0, 0.6667, 0.3333`) along `+aberVec`: accumulates `R * t` and `G * (1 - t)`
- **4 Backward taps** (`t = 0.0, 0.3333, 0.6667, 1.0`) along `-aberVec`: accumulates `G * (1 - t)` and `B * t`
- **Normalization**: `half3(rAcc * 0.5, gAcc * 0.3333333, bAcc * 0.5)`

## 4. `blur_fill` 3-Way Adaptive Contrast (`glass_background_all_lpf.ll`)
Blends sharp refracted RGB `C` with blurred fill `B`:
```glsl
half3 dCol = min(C, B);
half3 lCol = max(C, B);
half3 adaptive = dCol * dOp + lCol * lOp + C * (1.0 - dOp - lOp);
```
Typical light/dark micro-ops: `dOp = 0.03`, `lOp = 0.03` (Light) / `0.04` (Dark).

## 5. Rec.709 Hue-Preserving Luma Compression
```glsl
float luma = dot(adaptive, half3(0.2126, 0.7152, 0.0722));
float comp = clamp(1.0 - luma * (isDark > 0.5 ? 0.04 : 0.06), 0.0, 1.0);
adaptive = mix(half3(luma * comp), adaptive * half(comp), 1.0 + (1.0 - comp) * 0.3);
```

## 6. 5-Term ERF Gaussian `ring_shadow` (`glass_background_all_lpf.ll:215-224`)
```glsl
float caErf(float x) {
    float u = clamp(x * 0.70710678 * 0.25 + 0.5, 0.0, 1.0) * 4.0 - 2.0;
    float u2 = u * u;
    return ((((-0.00083 * u2 + 0.015) * u2 - 0.14) * u2 + 0.78) * u + 0.5);
}
float ring = clamp(caErf(distIn * 0.45) - caErf((distIn + 1.3) * 0.45), 0.0, 1.0);
```

## 7. `key_fill_highlight` with `color_bias` Compression
```glsl
float keyRaw = clamp((dot(n, keyDir) - 0.15) / 0.85, 0.0, 1.0);
float fillRaw = clamp((dot(n, -keyDir) - 0.20) / 0.80, 0.0, 1.0);
float bias = 0.45;
float keyHit = keyRaw / (1.0 + bias * (1.0 - keyRaw));
float fillHit = fillRaw / (1.0 + bias * (1.0 - fillRaw));
```

## 8. Jump-Flood Brim & Rim Outline (`brim_init`, `brim_jump`, `brim_outline`, `rim_outline`, `simple_rim`)
- `brim_init_lpf` + `brim_jump_lpf`: Jump-flood distance transform (`dist_surf: texture2d<uint>`) for arbitrary mask contours.
- `brim_outline_lpf` / `rim_outline_lpf`: Evaluates anti-aliased edge outline alpha (`outline_alpha`) with EDR scale (`edr_scale`).
- `simple_rim_lpf`: Calls `max_alpha_in_radius_circle` over `sampler` + `texture2d<float>` for fast circular rim highlight.
