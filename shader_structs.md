# QuartzCore `default.metallib` Uniform Structs (iOS 27.2.1 / 24B156)

Extracted directly from disassembled LLVM IR (`air64_v29-apple-ios27.2.0`).

## `GlassBackgroundUniforms` (`glass_background_all_lpf.ll`)
63-field struct (`%struct.GlassBackgroundUniforms.36`):
- `field 0`: `<4 x float>` (bounds / rect / tint vector)
- `fields 1..12`: `12 x float` (refraction, bevel height, curvature, blur/contrast weights)
- `field 13`: `<2 x float>`
- `fields 14..15`: `2 x float`
- `fields 16..24`: `9 x <4 x half>` (color stops, tint, specular/fill colors)
- `fields 25..38`: `14 x float`
- `field 39`: `<2 x float>`
- `fields 40..45`: `6 x float`
- `field 46`: `<2 x float>`
- `fields 47..50`: `4 x float`
- `field 51`: `<2 x float>`
- `fields 52..61`: `10 x float`
- `field 62`: `<2 x float>`

## `GlassBackgroundUniformsExt`
```llvm
%struct.GlassBackgroundUniformsExt.37 = type { float, float, float, float, float, i8, i8, i8, i8, i8 }
```

## `SdfFragmentUniforms`
```llvm
%struct.SdfFragmentUniforms.15 = type { <4 x float>, <4 x float>, <4 x float> }
```

## `GlassForegroundUniforms` (`glass_foreground_lpf.ll`)
```llvm
%struct.GlassForegroundUniforms.39 = type {
    <4 x float>, float, float, float, float, float, float,
    <2 x float>, float, float, float, float, <2 x float>, [8 x i8]
}
```

## `ChromaticAberrationUniforms` (`chromatic_aberration_lpf.ll`)
```llvm
%struct.ChromaticAberrationUniforms.21 = type {
    <2 x float>, <2 x float>, <2 x float>, <2 x float>, <2 x float>
}
```

## `DisplacementMapUniforms` (`chromatic_aberration_map_lpf.ll`)
```llvm
%struct.DisplacementMapUniforms.22 = type { <4 x float>, <2 x float>, <2 x float> }
```

## `BrimOutlineUniforms` / `RimOutlineUniforms` / `SimpleRimUniforms`
```llvm
%struct.BrimOutlineUniforms.32 = type { <4 x float>, <4 x float>, float, float, float, float, float, float, [8 x i8] }
%struct.RimOutlineUniforms.33  = type { <4 x float>, float, float, float, float }
%struct.SimpleRimUniforms.29   = type { <4 x float>, float, float, float }
%struct.BrimJumpUniforms.31    = type { float, float, float }
```
