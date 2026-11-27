# IOS Fluid Secret — iOS 27.2.1 (24B156) Liquid Glass ("Solarium") RE Reference

Reverse-engineered from **iOS 27.2.1 (Build `24B156`, `iPhone17,1`)** system frameworks:
- `QuartzCore.framework/default.metallib` (target triple `air64_v29-apple-ios27.2.0`, 249 functions, 16 key `.ll` modules disassembled)
- `QuartzCore` Mach-O (`20,414` symbols)
- `UIKitCore` Mach-O (`251,360` symbols)
- `CoreMaterial` Mach-O (`platformContentGlass*` recipes)

## Pipeline Architecture
1. **Material Recipe (`CoreMaterial`)**:
   - `_MTCoreMaterialRecipePlatformContentGlass`
   - `_MTCoreMaterialRecipePlatformContentGlassLighter`
   - `_MTCoreMaterialRecipePlatformContentGlassDarker`
   - `_MTCoreMaterialRecipePlatformContentGlassUltraDarker`
2. **UIKit Surface & Spring Spec (`UIKitCore`)**:
   - `_UIViewGlass`: `smoothness`, `tintColor`, `contentLensing`, `highlightsDisplayAngle`, `excludingPlatter`, `flexible`, `intelligence`
   - `_UILiquidLensViewVariantSpec`: `liftSpring` (`dampingRatio = 0.625`, `stiffness = 540`)
3. **SDF & Glass Passes (`QuartzCore` Metal AIR)**:
   - **SDF Generation**: `sdf_gen_field_lpf`, `sdf_gen_gradients_lpf`, `sdf_filter_vert_lpf`
   - **Jump-Flood Brim / Rim**: `brim_init_lpf`, `brim_jump_lpf`, `brim_outline_lpf`, `rim_outline_lpf`, `simple_rim_lpf`
   - **Background Refraction & Adaptive Contrast**: `glass_background_all_lpf`, `glass_background_sdf_all_lpf`, `glass_background_minimal_lpf`, `glass_background_sdf_minimal_lpf`
   - **Foreground Spectral Dispersion & Specular**: `glass_foreground_lpf`, `glass_foreground_sdf_lpf`, `chromatic_aberration_lpf`, `chromatic_aberration_map_lpf`

## Files in This Bundle
- `equations.md` — Exact decoded optical, SDF, and dispersion equations
- `shader_structs.md` — Exact LLVM IR uniform structs from `default.metallib`
- `spring_physics.md` — UIKitCore & QuartzCore default constants
- `agsl_port.glsl` — Clean-room Android AGSL port (backdrop + surface shaders)
