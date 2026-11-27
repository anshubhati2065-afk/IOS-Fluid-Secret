source_filename = "glass_background_all_lpf"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v29-apple-ios27.2.0"

%struct.GlassBackgroundUniforms.36 = type { <4 x float>, float, float, float, float, float, float, float, float, float, float, float, float, <2 x float>, float, float, <4 x half>, <4 x half>, <4 x half>, <4 x half>, <4 x half>, <4 x half>, <4 x half>, <4 x half>, <4 x half>, float, float, float, float, float, float, float, float, float, float, float, float, float, float, <2 x float>, float, float, float, float, float, float, <2 x float>, float, float, float, float, <2 x float>, float, float, float, float, float, float, float, float, float, float, <2 x float> }
%struct.GlassBackgroundUniformsExt.37 = type { float, float, float, float, float, i8, i8, i8, i8, i8 }

@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer
@__air_sampler_state.4 = internal addrspace(2) constant [2 x i64] [i64 34901797601036873, i64 0], align 8
@__air_sampler_state.1 = internal addrspace(2) constant [2 x i64] [i64 34901797601028681, i64 0], align 8

; Function Attrs: convergent mustprogress nounwind
define <4 x float> @glass_background_all_lpf(<4 x float> %0, <2 x float> %1, <2 x float> %2, ptr addrspace(1) %3, ptr addrspace(1) %4, ptr addrspace(2) noundef align 16 dereferenceable(320) "air-buffer-no-alias" %5, ptr addrspace(2) noundef align 4 dereferenceable(28) "air-buffer-no-alias" %6, ptr addrspace(2) noundef align 4 dereferenceable(4) "air-buffer-no-alias" %7) local_unnamed_addr #0 {
  %9 = tail call fast fastcc <4 x float> @_Z25glass_background_base_texILb1ELb1ELb1EEDv4_fDv2_fS1_N5metal9texture2dIfLNS2_6accessE0ELNS2_16memory_coherenceE0EvEES6_RU11MTLconstantK23GlassBackgroundUniformsRU11MTLconstantK26GlassBackgroundUniformsExtRU11MTLconstantKf(<2 x float> noundef %1, <2 x float> noundef %2, ptr addrspace(1) %3, ptr addrspace(1) %4, ptr addrspace(2) noundef align 16 dereferenceable(320) %5, ptr addrspace(2) noundef align 4 dereferenceable(28) %6, ptr addrspace(2) noundef align 4 dereferenceable(4) %7) #8
  ret <4 x float> %9
}

; Function Attrs: convergent mustprogress nounwind
define internal fastcc <4 x float> @_Z25glass_background_base_texILb1ELb1ELb1EEDv4_fDv2_fS1_N5metal9texture2dIfLNS2_6accessE0ELNS2_16memory_coherenceE0EvEES6_RU11MTLconstantK23GlassBackgroundUniformsRU11MTLconstantK26GlassBackgroundUniformsExtRU11MTLconstantKf(<2 x float> noundef %0, <2 x float> noundef %1, ptr addrspace(1) %2, ptr addrspace(1) %3, ptr addrspace(2) noundef align 16 dereferenceable(320) %4, ptr addrspace(2) noundef align 4 dereferenceable(28) %5, ptr addrspace(2) noundef align 4 dereferenceable(4) %6) unnamed_addr #0 {
  %8 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) nocapture readonly @__air_sampler_state.1, <2 x float> %1, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #9
  %9 = extractvalue { <4 x float>, i8 } %8, 0
  %10 = extractelement <4 x float> %9, i64 0
  %11 = tail call fast float @air.fwidth.f32(float %10) #10
  %12 = tail call fast float @air.fast_fmax.f32(float %11, float 0x3F1A36E2E0000000) #11
  %13 = fdiv fast float %10, %12
  %14 = fsub fast float 5.000000e-01, %13
  %15 = tail call fast float @air.fast_saturate.f32(float %14) #11
  %16 = extractelement <4 x float> %9, i64 3
  %17 = fmul fast float %15, %16
  %18 = fcmp fast olt float %17, 1.000000e+00
  br i1 %18, label %19, label %26

19:                                               ; preds = %7
  %20 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %4, i64 0, i32 13
  %21 = load <2 x float>, ptr addrspace(2) %20, align 16, !tbaa !31
  %22 = fadd fast <2 x float> %21, %1
  %23 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) nocapture readonly @__air_sampler_state.1, <2 x float> %22, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #9
  %24 = extractvalue { <4 x float>, i8 } %23, 0
  %25 = shufflevector <4 x float> %24, <4 x float> poison, <2 x i32> <i32 0, i32 3>
  br label %26

26:                                               ; preds = %19, %7
  %27 = phi <2 x float> [ %25, %19 ], [ zeroinitializer, %7 ]
  %28 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %4, i64 0, i32 49
  %29 = load float, ptr addrspace(2) %28, align 16, !tbaa !34
  %30 = fcmp fast ogt float %29, 0.000000e+00
  br i1 %30, label %31, label %44

31:                                               ; preds = %26
  %32 = fcmp fast ogt float %17, 0.000000e+00
  br i1 %32, label %37, label %33

33:                                               ; preds = %31
  %34 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %4, i64 0, i32 50
  %35 = load float, ptr addrspace(2) %34, align 4, !tbaa !38
  %36 = fcmp fast olt float %35, 1.000000e+00
  br i1 %36, label %37, label %44

37:                                               ; preds = %33, %31
  %38 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %4, i64 0, i32 46
  %39 = load <2 x float>, ptr addrspace(2) %38, align 16, !tbaa !31
  %40 = fadd fast <2 x float> %39, %1
  %41 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) nocapture readonly @__air_sampler_state.1, <2 x float> %40, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #9
  %42 = extractvalue { <4 x float>, i8 } %41, 0
  %43 = shufflevector <4 x float> %42, <4 x float> poison, <2 x i32> <i32 0, i32 3>
  br label %44

44:                                               ; preds = %37, %33, %26
  %45 = phi <2 x float> [ %43, %37 ], [ zeroinitializer, %33 ], [ zeroinitializer, %26 ]
  %46 = shufflevector <4 x float> %9, <4 x float> poison, <2 x i32> <i32 1, i32 2>
  %47 = tail call fast fastcc <4 x float> @_Z21glass_background_baseILb1ELb1ELb1EEDv4_fDv2_fS1_S1_ffS1_ffN5metal9texture2dIfLNS2_6accessE0ELNS2_16memory_coherenceE0EvEERU11MTLconstantK23GlassBackgroundUniformsRU11MTLconstantK26GlassBackgroundUniformsExtRU11MTLconstantKf(<2 x float> noundef %0, <2 x float> noundef %27, <2 x float> noundef %45, float noundef %10, float noundef %12, <2 x float> noundef %46, float noundef %17, float noundef %16, ptr addrspace(1) %2, ptr addrspace(2) noundef align 16 dereferenceable(320) %4, ptr addrspace(2) noundef align 4 dereferenceable(28) %5, ptr addrspace(2) noundef align 4 dereferenceable(4) %6) #8
  ret <4 x float> %47
}

; Function Attrs: convergent nounwind
define internal fastcc <4 x float> @_Z21glass_background_baseILb1ELb1ELb1EEDv4_fDv2_fS1_S1_ffS1_ffN5metal9texture2dIfLNS2_6accessE0ELNS2_16memory_coherenceE0EvEERU11MTLconstantK23GlassBackgroundUniformsRU11MTLconstantK26GlassBackgroundUniformsExtRU11MTLconstantKf(<2 x float> noundef %0, <2 x float> noundef %1, <2 x float> noundef %2, float noundef %3, float noundef %4, <2 x float> noundef %5, float noundef %6, float noundef %7, ptr addrspace(1) %8, ptr addrspace(2) noundef align 16 dereferenceable(320) %9, ptr addrspace(2) noundef align 4 dereferenceable(28) %10, ptr addrspace(2) noundef align 4 dereferenceable(4) %11) unnamed_addr #1 {
  %13 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 0
  %14 = load <4 x float>, ptr addrspace(2) %13, align 16
  %15 = shufflevector <4 x float> %14, <4 x float> poison, <2 x i32> <i32 0, i32 1>
  %16 = tail call fast float @air.dot.v2f32(<2 x float> %5, <2 x float> %15) #11
  %17 = insertelement <2 x float> undef, float %16, i64 0
  %18 = shufflevector <4 x float> %14, <4 x float> poison, <2 x i32> <i32 2, i32 3>
  %19 = tail call fast float @air.dot.v2f32(<2 x float> %5, <2 x float> %18) #11
  %20 = insertelement <2 x float> %17, float %19, i64 1
  %21 = tail call i32 @air.get_width_texture_2d(ptr addrspace(1) nocapture readonly %8, i32 0) #12
  %22 = tail call fast float @air.convert.f.f32.u.i32(i32 %21) #11
  %23 = insertelement <2 x float> undef, float %22, i64 0
  %24 = tail call i32 @air.get_height_texture_2d(ptr addrspace(1) nocapture readonly %8, i32 0) #12
  %25 = tail call fast float @air.convert.f.f32.u.i32(i32 %24) #11
  %26 = insertelement <2 x float> %23, float %25, i64 1
  %27 = fdiv fast <2 x float> splat (float 2.500000e-01), %26
  %28 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 52
  %29 = load float, ptr addrspace(2) %28, align 16, !tbaa !39
  %30 = fcmp fast ogt float %29, 0.000000e+00
  br i1 %30, label %31, label %105

31:                                               ; preds = %12
  %32 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 55
  %33 = load float, ptr addrspace(2) %32, align 4, !tbaa !40
  %34 = fadd fast float %33, %3
  %35 = fneg fast float %34
  %36 = fmul fast float %4, 5.000000e-01
  %37 = getelementptr inbounds %struct.GlassBackgroundUniformsExt.37, ptr addrspace(2) %10, i64 0, i32 7
  %38 = load i8, ptr addrspace(2) %37, align 2, !tbaa !41, !range !44
  %39 = icmp eq i8 %38, 0
  %40 = fcmp fast uge float %6, 1.000000e+00
  %41 = fadd fast float %29, %36
  %42 = fcmp fast ule float %41, %35
  %43 = select i1 %39, i1 %42, i1 %40
  %44 = fcmp fast uge float %34, %36
  %45 = select i1 %44, i1 true, i1 %43
  br i1 %45, label %105, label %46

46:                                               ; preds = %31
  %47 = tail call i1 @air.convert.u.i1.f.f32(float %7) #11
  br i1 %47, label %48, label %105

48:                                               ; preds = %46
  %49 = fdiv fast float 1.000000e+00, %4
  br i1 %39, label %50, label %57

50:                                               ; preds = %48
  %51 = fdiv fast float %35, %29
  %52 = tail call fast float @air.fast_saturate.f32(float %51) #11
  %53 = fsub fast float 1.000000e+00, %52
  %54 = tail call i1 @air.convert.u.i1.f.f32(float %53) #11
  %55 = select fast i1 %54, float 1.000000e+00, float 0.000000e+00
  %56 = tail call fast float @air.mix.f32(float %55, float %53, float 7.500000e-01) #11
  br label %57

57:                                               ; preds = %50, %48
  %58 = phi fast float [ %56, %50 ], [ 1.000000e+00, %48 ]
  br i1 %39, label %61, label %59

59:                                               ; preds = %57
  %60 = fsub fast float 1.000000e+00, %6
  br label %65

61:                                               ; preds = %57
  %62 = fadd fast float %34, %29
  %63 = tail call fast float @air.fma.f32(float %62, float %49, float 5.000000e-01) #11
  %64 = tail call fast float @air.fast_saturate.f32(float %63) #11
  br label %65

65:                                               ; preds = %61, %59
  %66 = phi fast float [ %60, %59 ], [ %64, %61 ]
  %67 = fmul fast float %58, %7
  %68 = tail call fast float @air.fma.f32(float %35, float %49, float 5.000000e-01) #11
  %69 = tail call fast float @air.fast_saturate.f32(float %68) #11
  %70 = fmul fast float %67, %66
  %71 = fmul fast float %70, %69
  %72 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 53
  %73 = load float, ptr addrspace(2) %72, align 4, !tbaa !45
  %74 = fsub fast float 1.000000e+00, %73
  %75 = tail call fast float @air.fast_fmax.f32(float %74, float 0x3EB0C6F7A0000000) #11
  %76 = fdiv fast float 1.000000e+00, %75
  %77 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 51
  %78 = load <2 x float>, ptr addrspace(2) %77, align 8, !tbaa !31
  %79 = tail call fast float @air.dot.v2f32(<2 x float> %78, <2 x float> %5) #11
  %80 = insertelement <2 x float> poison, float %71, i64 0
  %81 = shufflevector <2 x float> %80, <2 x float> poison, <2 x i32> zeroinitializer
  %82 = insertelement <2 x float> undef, float %79, i64 0
  %83 = fneg fast float %79
  %84 = insertelement <2 x float> %82, float %83, i64 1
  %85 = insertelement <2 x float> poison, float %73, i64 0
  %86 = shufflevector <2 x float> %85, <2 x float> poison, <2 x i32> zeroinitializer
  %87 = fsub fast <2 x float> %84, %86
  %88 = insertelement <2 x float> poison, float %76, i64 0
  %89 = shufflevector <2 x float> %88, <2 x float> poison, <2 x i32> zeroinitializer
  %90 = fmul fast <2 x float> %87, %89
  %91 = tail call fast <2 x float> @air.fast_saturate.v2f32(<2 x float> %90) #11
  %92 = fmul fast <2 x float> %91, %81
  %93 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 54
  %94 = load float, ptr addrspace(2) %93, align 8, !tbaa !46
  %95 = insertelement <2 x float> poison, float %94, i64 0
  %96 = shufflevector <2 x float> %95, <2 x float> poison, <2 x i32> zeroinitializer
  %97 = fsub fast <2 x float> splat (float 1.000000e+00), %92
  %98 = fmul fast <2 x float> %96, %97
  %99 = fadd fast <2 x float> %98, splat (float 1.000000e+00)
  %100 = tail call fast <2 x float> @air.fast_fmax.v2f32(<2 x float> %99, <2 x float> splat (float 0x3EB0C6F7A0000000)) #11
  %101 = fdiv fast <2 x float> %92, %100
  %102 = extractelement <2 x float> %101, i64 0
  %103 = extractelement <2 x float> %101, i64 1
  %104 = fadd fast float %102, %103
  br label %105

105:                                              ; preds = %65, %46, %31, %12
  %106 = phi float [ 0.000000e+00, %12 ], [ %104, %65 ], [ 0.000000e+00, %46 ], [ 0.000000e+00, %31 ]
  %107 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 49
  %108 = load float, ptr addrspace(2) %107, align 16, !tbaa !34
  %109 = fcmp fast ogt float %108, 0.000000e+00
  br i1 %109, label %110, label %159

110:                                              ; preds = %105
  %111 = fcmp fast ogt float %6, 0.000000e+00
  %112 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 50
  %113 = load float, ptr addrspace(2) %112, align 4, !tbaa !38
  %114 = fcmp fast olt float %113, 1.000000e+00
  %115 = select i1 %111, i1 true, i1 %114
  br i1 %115, label %116, label %159

116:                                              ; preds = %110
  %117 = extractelement <2 x float> %2, i64 0
  %118 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 48
  %119 = load float, ptr addrspace(2) %118, align 4, !tbaa !47
  %120 = tail call fast float @air.fast_fmax.f32(float %119, float 0x3EB0C6F7A0000000) #11
  %121 = fdiv fast float 1.000000e+00, %120
  %122 = fmul fast float %121, %117
  %123 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 47
  %124 = load float, ptr addrspace(2) %123, align 8, !tbaa !48
  %125 = fmul fast float %124, %121
  %126 = fadd fast float %122, %125
  %127 = fmul fast float %122, 0x3FE6A09020000000
  %128 = fptrunc float %127 to half
  %129 = fmul fast half %128, 0xH3400
  %130 = fadd fast half %129, 0xH3800
  %131 = tail call fast half @air.saturate.f16(half %130) #11
  %132 = fmul fast half %131, 0xH4400
  %133 = fadd fast half %132, 0xHC000
  %134 = fmul fast half %133, %133
  %135 = tail call fast half @air.fma.f16(half 0xH1A0D, half %134, half 0xHA869) #11
  %136 = tail call fast half @air.fma.f16(half %135, half %134, half 0xH3162) #11
  %137 = tail call fast half @air.fma.f16(half %136, half %134, half 0xHB87C) #11
  %138 = tail call fast half @air.fma.f16(half %137, half %133, half 0xH3800) #11
  %139 = fmul fast float %126, 0x3FE6A09020000000
  %140 = fptrunc float %139 to half
  %141 = fmul fast half %140, 0xH3400
  %142 = fadd fast half %141, 0xH3800
  %143 = tail call fast half @air.saturate.f16(half %142) #11
  %144 = fmul fast half %143, 0xH4400
  %145 = fadd fast half %144, 0xHC000
  %146 = fmul fast half %145, %145
  %147 = tail call fast half @air.fma.f16(half 0xH1A0D, half %146, half 0xHA869) #11
  %148 = tail call fast half @air.fma.f16(half %147, half %146, half 0xH3162) #11
  %149 = tail call fast half @air.fma.f16(half %148, half %146, half 0xHB87C) #11
  %150 = tail call fast half @air.fma.f16(half %149, half %145, half 0xH3800) #11
  %151 = fsub fast half %138, %150
  %152 = tail call fast half @air.saturate.f16(half %151) #11
  %153 = fpext half %152 to float
  %154 = tail call fast float @air.mix.f32(float 1.000000e+00, float %6, float %113) #11
  %155 = extractelement <2 x float> %2, i64 1
  %156 = fmul fast float %108, %155
  %157 = fmul fast float %156, %153
  %158 = fmul fast float %157, %154
  br label %159

159:                                              ; preds = %116, %110, %105
  %160 = phi float [ %158, %116 ], [ 0.000000e+00, %105 ], [ 0.000000e+00, %110 ]
  %161 = fcmp fast olt float %6, 1.000000e+00
  br i1 %161, label %162, label %296

162:                                              ; preds = %159
  %163 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 40
  %164 = load float, ptr addrspace(2) %163, align 8, !tbaa !49
  %165 = fadd fast float %164, %3
  %166 = fneg fast float %165
  %167 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 12
  %168 = load float, ptr addrspace(2) %167, align 4, !tbaa !50
  %169 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 11
  %170 = load float, ptr addrspace(2) %169, align 8, !tbaa !51
  %171 = fmul fast float %168, %166
  %172 = tail call fast float @air.fast_saturate.f32(float %171) #11
  %173 = fsub fast float 2.000000e+00, %172
  %174 = fmul fast float %173, %172
  %175 = tail call fast float @air.fast_sqrt.f32(float %174) #11
  %176 = tail call fast float @air.fast_saturate.f32(float %175) #11
  %177 = fmul fast float %176, %170
  %178 = fsub fast float %170, %177
  %179 = insertelement <2 x float> poison, float %178, i64 0
  %180 = shufflevector <2 x float> %179, <2 x float> poison, <2 x i32> zeroinitializer
  %181 = fmul fast <2 x float> %180, %20
  %182 = fadd fast <2 x float> %181, %0
  %183 = extractelement <2 x float> %1, i64 0
  %184 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 15
  %185 = load float, ptr addrspace(2) %184, align 4, !tbaa !52
  %186 = fmul fast float %185, %183
  %187 = fptrunc float %186 to half
  %188 = fmul fast half %187, 0xH3400
  %189 = fadd fast half %188, 0xH3800
  %190 = tail call fast half @air.saturate.f16(half %189) #11
  %191 = fmul fast half %190, 0xH4400
  %192 = fadd fast half %191, 0xHC000
  %193 = fmul fast half %192, %192
  %194 = tail call fast half @air.fma.f16(half 0xH1A0D, half %193, half 0xHA869) #11
  %195 = tail call fast half @air.fma.f16(half %194, half %193, half 0xH3162) #11
  %196 = tail call fast half @air.fma.f16(half %195, half %193, half 0xHB87C) #11
  %197 = tail call fast half @air.fma.f16(half %196, half %192, half 0xH3800) #11
  %198 = fpext half %197 to float
  %199 = extractelement <2 x float> %1, i64 1
  %200 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 41
  %201 = load float, ptr addrspace(2) %200, align 4, !tbaa !53
  %202 = fmul fast float %201, %199
  %203 = fmul fast float %202, %198
  %204 = fcmp fast oeq float %6, 0.000000e+00
  %205 = fcmp fast olt float %203, 0x3EB0C6F7A0000000
  %206 = select i1 %204, i1 %205, i1 false
  %207 = fcmp fast olt float %106, 0x3EB0C6F7A0000000
  %208 = select i1 %206, i1 %207, i1 false
  %209 = fcmp fast olt float %160, 0x3EB0C6F7A0000000
  %210 = select i1 %208, i1 %209, i1 false
  br i1 %210, label %211, label %212

211:                                              ; preds = %162
  tail call void @air.discard_fragment() #13
  br label %212

212:                                              ; preds = %211, %162
  %213 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 25
  %214 = load float, ptr addrspace(2) %213, align 8, !tbaa !54
  %215 = fcmp fast ogt float %214, 0x3EB0C6F7A0000000
  br i1 %215, label %216, label %272

216:                                              ; preds = %212
  %217 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 14
  %218 = load float, ptr addrspace(2) %217, align 8, !tbaa !55
  %219 = fcmp fast olt float %218, 2.000000e+00
  %220 = fmul fast float %218, 5.000000e-01
  %221 = fadd fast float %220, 1.000000e+00
  %222 = select i1 %219, float %221, float %218
  %223 = tail call fast float @air.fast_log2.f32(float %222) #11
  %224 = tail call fast float @air.fast_fmax.f32(float 0.000000e+00, float %223) #11
  %225 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %8, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %182, i1 true, <2 x i32> zeroinitializer, i1 true, float %224, float 0.000000e+00, i32 0) #9
  %226 = extractvalue { <4 x float>, i8 } %225, 0
  %227 = extractelement <4 x float> %226, i64 3
  %228 = tail call fast float @air.fast_fmax.f32(float %227, float 0x3EB0C6F7A0000000) #11
  %229 = insertelement <3 x float> poison, float %228, i64 0
  %230 = shufflevector <3 x float> %229, <3 x float> poison, <3 x i32> zeroinitializer
  %231 = shufflevector <4 x float> %226, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %232 = fdiv fast <3 x float> %231, %230
  %233 = tail call fast <3 x float> @air.fast_fabs.v3f32(<3 x float> %232) #11
  %234 = fcmp fast olt <3 x float> %233, splat (float 0x3EB0C6F7A0000000)
  %235 = select reassoc nsz arcp contract afn <3 x i1> %234, <3 x float> zeroinitializer, <3 x float> %232
  %236 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 22
  %237 = load <4 x half>, ptr addrspace(2) %236, align 16
  %238 = shufflevector <4 x half> %237, <4 x half> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %239 = tail call fast <3 x float> @air.convert.f.v3f32.f.v3f16(<3 x half> %238) #11
  %240 = tail call fast float @air.dot.v3f32(<3 x float> %235, <3 x float> %239) #11
  %241 = insertelement <3 x float> undef, float %240, i64 0
  %242 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 23
  %243 = load <4 x half>, ptr addrspace(2) %242, align 8
  %244 = shufflevector <4 x half> %243, <4 x half> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %245 = tail call fast <3 x float> @air.convert.f.v3f32.f.v3f16(<3 x half> %244) #11
  %246 = tail call fast float @air.dot.v3f32(<3 x float> %235, <3 x float> %245) #11
  %247 = insertelement <3 x float> %241, float %246, i64 1
  %248 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 24
  %249 = load <4 x half>, ptr addrspace(2) %248, align 16
  %250 = shufflevector <4 x half> %249, <4 x half> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %251 = tail call fast <3 x float> @air.convert.f.v3f32.f.v3f16(<3 x half> %250) #11
  %252 = tail call fast float @air.dot.v3f32(<3 x float> %235, <3 x float> %251) #11
  %253 = insertelement <3 x float> %247, float %252, i64 2
  %254 = insertelement <3 x float> poison, float %214, i64 0
  %255 = shufflevector <3 x float> %254, <3 x float> poison, <3 x i32> zeroinitializer
  %256 = fmul fast <3 x float> %253, %255
  %257 = extractelement <4 x half> %237, i64 3
  %258 = fpext half %257 to float
  %259 = insertelement <3 x float> undef, float %258, i64 0
  %260 = extractelement <4 x half> %243, i64 3
  %261 = fpext half %260 to float
  %262 = insertelement <3 x float> %259, float %261, i64 1
  %263 = extractelement <4 x half> %249, i64 3
  %264 = fpext half %263 to float
  %265 = insertelement <3 x float> %262, float %264, i64 2
  %266 = fadd fast <3 x float> %256, %265
  %267 = shufflevector <3 x float> %266, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %268 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 26
  %269 = load float, ptr addrspace(2) %268, align 4, !tbaa !56
  %270 = tail call fast float @air.mix.f32(float %269, float 1.000000e+00, float %214) #11
  %271 = insertelement <4 x float> %267, float %270, i64 3
  br label %291

272:                                              ; preds = %212
  %273 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 22
  %274 = load <4 x half>, ptr addrspace(2) %273, align 16
  %275 = extractelement <4 x half> %274, i64 3
  %276 = fpext half %275 to float
  %277 = insertelement <4 x float> undef, float %276, i64 0
  %278 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 23
  %279 = load <4 x half>, ptr addrspace(2) %278, align 8
  %280 = extractelement <4 x half> %279, i64 3
  %281 = fpext half %280 to float
  %282 = insertelement <4 x float> %277, float %281, i64 1
  %283 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 24
  %284 = load <4 x half>, ptr addrspace(2) %283, align 16
  %285 = extractelement <4 x half> %284, i64 3
  %286 = fpext half %285 to float
  %287 = insertelement <4 x float> %282, float %286, i64 2
  %288 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 26
  %289 = load float, ptr addrspace(2) %288, align 4, !tbaa !56
  %290 = insertelement <4 x float> %287, float %289, i64 3
  br label %291

291:                                              ; preds = %272, %216
  %292 = phi <4 x float> [ %271, %216 ], [ %290, %272 ]
  %293 = insertelement <4 x float> poison, float %203, i64 0
  %294 = shufflevector <4 x float> %293, <4 x float> poison, <4 x i32> zeroinitializer
  %295 = fmul fast <4 x float> %292, %294
  br label %296

296:                                              ; preds = %291, %159
  %297 = phi <4 x float> [ %295, %291 ], [ zeroinitializer, %159 ]
  %298 = fcmp fast ogt float %6, 0.000000e+00
  br i1 %298, label %299, label %715

299:                                              ; preds = %296
  %300 = fneg fast float %3
  %301 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 2
  %302 = load float, ptr addrspace(2) %301, align 4, !tbaa !57
  %303 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 1
  %304 = load float, ptr addrspace(2) %303, align 16, !tbaa !58
  %305 = fmul fast float %302, %300
  %306 = tail call fast float @air.fast_saturate.f32(float %305) #11
  %307 = fsub fast float 2.000000e+00, %306
  %308 = fmul fast float %307, %306
  %309 = tail call fast float @air.fast_sqrt.f32(float %308) #11
  %310 = tail call fast float @air.fast_saturate.f32(float %309) #11
  %311 = fmul fast float %310, %304
  %312 = fsub fast float %304, %311
  %313 = fadd fast float %312, %3
  %314 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 31
  %315 = load float, ptr addrspace(2) %314, align 16, !tbaa !59
  %316 = insertelement <3 x float> undef, float %315, i64 0
  %317 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 32
  %318 = load float, ptr addrspace(2) %317, align 4, !tbaa !60
  %319 = insertelement <3 x float> %316, float %318, i64 1
  %320 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 33
  %321 = load float, ptr addrspace(2) %320, align 8, !tbaa !61
  %322 = insertelement <3 x float> %319, float %321, i64 2
  %323 = insertelement <3 x float> undef, float %318, i64 0
  %324 = insertelement <3 x float> %323, float %321, i64 1
  %325 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 34
  %326 = load float, ptr addrspace(2) %325, align 4, !tbaa !62
  %327 = insertelement <3 x float> %324, float %326, i64 2
  %328 = insertelement <3 x float> poison, float %313, i64 0
  %329 = shufflevector <3 x float> %328, <3 x float> poison, <3 x i32> zeroinitializer
  %330 = fsub fast <3 x float> %327, %322
  %331 = fdiv fast <3 x float> splat (float 1.000000e+00), %330
  %332 = fneg fast <3 x float> %322
  %333 = fdiv fast <3 x float> %332, %330
  %334 = tail call fast <3 x float> @air.fma.v3f32(<3 x float> %329, <3 x float> %331, <3 x float> %333) #11
  %335 = tail call fast <3 x float> @air.fast_saturate.v3f32(<3 x float> %334) #11
  %336 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 28
  %337 = load float, ptr addrspace(2) %336, align 4, !tbaa !63
  %338 = insertelement <3 x float> undef, float %337, i64 0
  %339 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 29
  %340 = load float, ptr addrspace(2) %339, align 8, !tbaa !64
  %341 = insertelement <3 x float> %338, float %340, i64 1
  %342 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 30
  %343 = load float, ptr addrspace(2) %342, align 4, !tbaa !65
  %344 = insertelement <3 x float> %341, float %343, i64 2
  %345 = fmul fast <3 x float> %344, %335
  %346 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 27
  %347 = load float, ptr addrspace(2) %346, align 16, !tbaa !66
  %348 = extractelement <3 x float> %345, i64 0
  %349 = extractelement <3 x float> %345, i64 1
  %350 = extractelement <3 x float> %345, i64 2
  %351 = fadd fast float %348, %349
  %352 = fadd fast float %351, %350
  %353 = fsub fast float %347, %352
  %354 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 7
  %355 = load float, ptr addrspace(2) %354, align 8, !tbaa !67
  %356 = fmul fast float %353, %355
  %357 = insertelement <2 x float> poison, float %312, i64 0
  %358 = shufflevector <2 x float> %357, <2 x float> poison, <2 x i32> zeroinitializer
  %359 = fmul fast <2 x float> %358, %20
  %360 = fadd fast <2 x float> %359, %0
  %361 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 61
  %362 = load float, ptr addrspace(2) %361, align 4, !tbaa !68
  %363 = tail call i1 @air.convert.u.i1.f.f32(float %362) #11
  br i1 %363, label %379, label %364

364:                                              ; preds = %299
  %365 = fcmp fast olt float %356, 2.000000e+00
  %366 = fmul fast float %356, 5.000000e-01
  %367 = fadd fast float %366, 1.000000e+00
  %368 = select i1 %365, float %367, float %356
  %369 = tail call fast float @air.fast_log2.f32(float %368) #11
  %370 = tail call fast float @air.fast_fmax.f32(float 0.000000e+00, float %369) #11
  %371 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %8, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %360, i1 true, <2 x i32> zeroinitializer, i1 true, float %370, float 0.000000e+00, i32 0) #9
  %372 = extractvalue { <4 x float>, i8 } %371, 0
  %373 = shufflevector <4 x float> %372, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %374 = tail call fast <3 x float> @air.fast_fabs.v3f32(<3 x float> %373) #11
  %375 = fcmp fast olt <3 x float> %374, splat (float 0x3EB0C6F7A0000000)
  %376 = select reassoc nsz arcp contract afn <3 x i1> %375, <3 x float> zeroinitializer, <3 x float> %373
  %377 = shufflevector <3 x float> %376, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %378 = shufflevector <4 x float> %377, <4 x float> %372, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  br label %421

379:                                              ; preds = %299
  %380 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 62
  %381 = load <2 x float>, ptr addrspace(2) %380, align 8, !tbaa !31
  %382 = tail call fast float @air.dot.v2f32(<2 x float> %15, <2 x float> %381) #11
  %383 = insertelement <2 x float> undef, float %382, i64 0
  %384 = extractelement <4 x float> %14, i64 1
  %385 = extractelement <2 x float> %381, i64 0
  %386 = fmul fast float %385, %384
  %387 = extractelement <4 x float> %14, i64 0
  %388 = extractelement <2 x float> %381, i64 1
  %389 = fmul fast float %388, %387
  %390 = fsub fast float %386, %389
  %391 = insertelement <2 x float> %383, float %390, i64 1
  %392 = tail call fast float @air.dot.v2f32(<2 x float> %18, <2 x float> %381) #11
  %393 = insertelement <2 x float> undef, float %392, i64 0
  %394 = extractelement <4 x float> %14, i64 3
  %395 = fmul fast float %385, %394
  %396 = extractelement <4 x float> %14, i64 2
  %397 = fmul fast float %388, %396
  %398 = fsub fast float %395, %397
  %399 = insertelement <2 x float> %393, float %398, i64 1
  %400 = tail call fast float @air.dot.v2f32(<2 x float> %391, <2 x float> %5) #11
  %401 = insertelement <2 x float> undef, float %400, i64 1
  %402 = tail call fast float @air.dot.v2f32(<2 x float> %399, <2 x float> %5) #11
  %403 = insertelement <2 x float> %401, float %402, i64 0
  %404 = getelementptr inbounds %struct.GlassBackgroundUniformsExt.37, ptr addrspace(2) %10, i64 0, i32 1
  %405 = load float, ptr addrspace(2) %404, align 4, !tbaa !69
  %406 = fsub fast float %300, %405
  %407 = getelementptr inbounds %struct.GlassBackgroundUniformsExt.37, ptr addrspace(2) %10, i64 0, i32 0
  %408 = load float, ptr addrspace(2) %407, align 4, !tbaa !70
  %409 = fmul fast float %408, %406
  %410 = tail call fast float @air.fast_saturate.f32(float %409) #11
  %411 = fsub fast float 2.000000e+00, %410
  %412 = fmul fast float %411, %410
  %413 = tail call fast float @air.fast_sqrt.f32(float %412) #11
  %414 = tail call fast float @air.fast_saturate.f32(float %413) #11
  %415 = fmul fast float %414, %362
  %416 = fsub fast float %362, %415
  %417 = insertelement <2 x float> poison, float %416, i64 0
  %418 = shufflevector <2 x float> %417, <2 x float> poison, <2 x i32> zeroinitializer
  %419 = fmul fast <2 x float> %418, %403
  %420 = tail call fast fastcc <4 x float> @_Z16aberrate_textureN5metal9texture2dIfLNS_6accessE0ELNS_16memory_coherenceE0EvEEDv2_fS4_bbfS4_(ptr addrspace(1) %8, <2 x float> noundef %360, <2 x float> noundef %419, i1 noundef zeroext true, i1 noundef zeroext true, float noundef %356, <2 x float> noundef %27) #8
  br label %421

421:                                              ; preds = %379, %364
  %422 = phi <4 x float> [ %420, %379 ], [ %378, %364 ]
  %423 = extractelement <4 x float> %422, i64 3
  %424 = tail call fast float @air.fast_fmax.f32(float %423, float 0x3EB0C6F7A0000000) #11
  %425 = insertelement <3 x float> poison, float %424, i64 0
  %426 = shufflevector <3 x float> %425, <3 x float> poison, <3 x i32> zeroinitializer
  %427 = shufflevector <4 x float> %422, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %428 = fdiv fast <3 x float> %427, %426
  %429 = shufflevector <3 x float> %428, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %430 = insertelement <4 x float> %429, float 1.000000e+00, i64 3
  %431 = getelementptr inbounds %struct.GlassBackgroundUniformsExt.37, ptr addrspace(2) %10, i64 0, i32 6
  %432 = load i8, ptr addrspace(2) %431, align 1, !tbaa !71, !range !44
  %433 = icmp eq i8 %432, 0
  br i1 %433, label %495, label %434

434:                                              ; preds = %421
  %435 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 57
  %436 = load float, ptr addrspace(2) %435, align 4, !tbaa !72
  %437 = fcmp fast olt float %436, 2.000000e+00
  %438 = fmul fast float %436, 5.000000e-01
  %439 = fadd fast float %438, 1.000000e+00
  %440 = select i1 %437, float %439, float %436
  %441 = tail call fast float @air.fast_log2.f32(float %440) #11
  %442 = tail call fast float @air.fast_fmax.f32(float 0.000000e+00, float %441) #11
  %443 = insertelement <2 x float> poison, float %442, i64 0
  %444 = shufflevector <2 x float> %443, <2 x float> poison, <2 x i32> zeroinitializer
  %445 = fmul fast <2 x float> %444, %27
  %446 = extractelement <2 x float> %445, i64 0
  %447 = extractelement <2 x float> %445, i64 1
  %448 = fadd fast <2 x float> %445, %0
  %449 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %8, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %448, i1 true, <2 x i32> zeroinitializer, i1 true, float %442, float 0.000000e+00, i32 0) #9
  %450 = extractvalue { <4 x float>, i8 } %449, 0
  %451 = fneg fast float %446
  %452 = insertelement <2 x float> undef, float %451, i64 0
  %453 = fneg fast float %447
  %454 = insertelement <2 x float> %452, float %453, i64 1
  %455 = fadd fast <2 x float> %454, %0
  %456 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %8, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %455, i1 true, <2 x i32> zeroinitializer, i1 true, float %442, float 0.000000e+00, i32 0) #9
  %457 = extractvalue { <4 x float>, i8 } %456, 0
  %458 = fadd fast <4 x float> %457, %450
  %459 = fmul fast <4 x float> %458, splat (float 5.000000e-01)
  %460 = extractelement <4 x float> %459, i64 3
  %461 = tail call fast float @air.fast_fmax.f32(float %460, float 0x3EB0C6F7A0000000) #11
  %462 = insertelement <3 x float> poison, float %461, i64 0
  %463 = shufflevector <3 x float> %462, <3 x float> poison, <3 x i32> zeroinitializer
  %464 = shufflevector <4 x float> %459, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %465 = fdiv fast <3 x float> %464, %463
  %466 = tail call fast <3 x float> @air.fast_fabs.v3f32(<3 x float> %465) #11
  %467 = fcmp fast olt <3 x float> %466, splat (float 0x3EB0C6F7A0000000)
  %468 = select reassoc nsz arcp contract afn <3 x i1> %467, <3 x float> zeroinitializer, <3 x float> %465
  %469 = tail call fast <3 x float> @air.fast_fmin.v3f32(<3 x float> %428, <3 x float> %468) #11
  %470 = tail call fast <3 x float> @air.fast_fmax.v3f32(<3 x float> %428, <3 x float> %468) #11
  %471 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 59
  %472 = load float, ptr addrspace(2) %471, align 4, !tbaa !73
  %473 = insertelement <3 x float> poison, float %472, i64 0
  %474 = shufflevector <3 x float> %473, <3 x float> poison, <3 x i32> zeroinitializer
  %475 = fmul fast <3 x float> %474, %469
  %476 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 58
  %477 = load float, ptr addrspace(2) %476, align 8, !tbaa !74
  %478 = insertelement <3 x float> poison, float %477, i64 0
  %479 = shufflevector <3 x float> %478, <3 x float> poison, <3 x i32> zeroinitializer
  %480 = fmul fast <3 x float> %479, %470
  %481 = fadd fast <3 x float> %480, %475
  %482 = fadd fast float %472, %477
  %483 = fsub fast float 1.000000e+00, %482
  %484 = insertelement <3 x float> poison, float %483, i64 0
  %485 = shufflevector <3 x float> %484, <3 x float> poison, <3 x i32> zeroinitializer
  %486 = fmul fast <3 x float> %485, %428
  %487 = fadd fast <3 x float> %481, %486
  %488 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 60
  %489 = load float, ptr addrspace(2) %488, align 16, !tbaa !75
  %490 = insertelement <3 x float> poison, float %489, i64 0
  %491 = shufflevector <3 x float> %490, <3 x float> poison, <3 x i32> zeroinitializer
  %492 = tail call fast <3 x float> @air.mix.v3f32(<3 x float> %487, <3 x float> %468, <3 x float> %491) #11
  %493 = shufflevector <3 x float> %492, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %494 = insertelement <4 x float> %493, float 1.000000e+00, i64 3
  br label %495

495:                                              ; preds = %434, %421
  %496 = phi <4 x float> [ %494, %434 ], [ %430, %421 ]
  %497 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 42
  %498 = load float, ptr addrspace(2) %497, align 16, !tbaa !76
  %499 = fcmp fast ogt float %498, 0.000000e+00
  br i1 %499, label %500, label %558

500:                                              ; preds = %495
  %501 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 4
  %502 = load float, ptr addrspace(2) %501, align 4, !tbaa !77
  %503 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 3
  %504 = load float, ptr addrspace(2) %503, align 8, !tbaa !78
  %505 = fmul fast float %502, %300
  %506 = tail call fast float @air.fast_saturate.f32(float %505) #11
  %507 = fsub fast float 2.000000e+00, %506
  %508 = fmul fast float %507, %506
  %509 = tail call fast float @air.fast_sqrt.f32(float %508) #11
  %510 = tail call fast float @air.fast_saturate.f32(float %509) #11
  %511 = fmul fast float %510, %504
  %512 = fsub fast float %504, %511
  %513 = fadd fast float %512, %3
  %514 = insertelement <3 x float> poison, float %513, i64 0
  %515 = shufflevector <3 x float> %514, <3 x float> poison, <3 x i32> zeroinitializer
  %516 = tail call fast <3 x float> @air.fma.v3f32(<3 x float> %515, <3 x float> %331, <3 x float> %333) #11
  %517 = tail call fast <3 x float> @air.fast_saturate.v3f32(<3 x float> %516) #11
  %518 = fmul fast <3 x float> %517, %344
  %519 = extractelement <3 x float> %518, i64 0
  %520 = extractelement <3 x float> %518, i64 1
  %521 = extractelement <3 x float> %518, i64 2
  %522 = fadd fast float %519, %520
  %523 = fadd fast float %522, %521
  %524 = fsub fast float %347, %523
  %525 = fmul fast float %524, %355
  %526 = insertelement <2 x float> poison, float %512, i64 0
  %527 = shufflevector <2 x float> %526, <2 x float> poison, <2 x i32> zeroinitializer
  %528 = fmul fast <2 x float> %527, %20
  %529 = fadd fast <2 x float> %528, %0
  %530 = fcmp fast olt float %525, 2.000000e+00
  %531 = fmul fast float %525, 5.000000e-01
  %532 = fadd fast float %531, 1.000000e+00
  %533 = select i1 %530, float %532, float %525
  %534 = tail call fast float @air.fast_log2.f32(float %533) #11
  %535 = tail call fast float @air.fast_fmax.f32(float 0.000000e+00, float %534) #11
  %536 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %8, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %529, i1 true, <2 x i32> zeroinitializer, i1 true, float %535, float 0.000000e+00, i32 0) #9
  %537 = extractvalue { <4 x float>, i8 } %536, 0
  %538 = shufflevector <4 x float> %537, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %539 = tail call fast <3 x float> @air.fast_fabs.v3f32(<3 x float> %538) #11
  %540 = fcmp fast olt <3 x float> %539, splat (float 0x3EB0C6F7A0000000)
  %541 = select reassoc nsz arcp contract afn <3 x i1> %540, <3 x float> zeroinitializer, <3 x float> %538
  %542 = shufflevector <3 x float> %541, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %543 = shufflevector <4 x float> %542, <4 x float> %537, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %544 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 5
  %545 = load float, ptr addrspace(2) %544, align 16, !tbaa !79
  %546 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 6
  %547 = load float, ptr addrspace(2) %546, align 4, !tbaa !80
  %548 = fsub fast float %547, %545
  %549 = fdiv fast float 1.000000e+00, %548
  %550 = fneg fast float %545
  %551 = fdiv fast float %550, %548
  %552 = tail call fast float @air.fma.f32(float %3, float %549, float %551) #11
  %553 = tail call fast float @air.fast_saturate.f32(float %552) #11
  %554 = fmul fast float %553, %498
  %555 = insertelement <4 x float> poison, float %554, i64 0
  %556 = shufflevector <4 x float> %555, <4 x float> poison, <4 x i32> zeroinitializer
  %557 = tail call fast <4 x float> @air.mix.v4f32(<4 x float> %496, <4 x float> %543, <4 x float> %556) #11
  br label %558

558:                                              ; preds = %500, %495
  %559 = phi <4 x float> [ %557, %500 ], [ %496, %495 ]
  %560 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 38
  %561 = load float, ptr addrspace(2) %560, align 4, !tbaa !81
  %562 = fcmp fast ogt float %561, 0.000000e+00
  br i1 %562, label %563, label %620

563:                                              ; preds = %558
  %564 = shufflevector <4 x float> %559, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %565 = getelementptr inbounds %struct.GlassBackgroundUniformsExt.37, ptr addrspace(2) %10, i64 0, i32 4
  %566 = load float, ptr addrspace(2) %565, align 4, !tbaa !82
  %567 = fcmp fast ogt float %566, 0.000000e+00
  br i1 %567, label %568, label %585

568:                                              ; preds = %563
  %569 = tail call fast float @air.dot.v3f32(<3 x float> <float 0x3FCB367A00000000, float 0x3FE6E2EB20000000, float 0x3FB27BB300000000>, <3 x float> %564) #11
  %570 = fmul fast float %569, %566
  %571 = fsub fast float 1.000000e+00, %570
  %572 = tail call fast float @air.fast_saturate.f32(float %571) #11
  %573 = insertelement <3 x float> poison, float %572, i64 0
  %574 = shufflevector <3 x float> %573, <3 x float> poison, <3 x i32> zeroinitializer
  %575 = fmul fast <3 x float> %574, %564
  %576 = fsub fast float 1.000000e+00, %572
  %577 = fmul fast float %576, 0x3FD3333340000000
  %578 = fadd fast float %577, 1.000000e+00
  %579 = fmul fast float %572, %569
  %580 = insertelement <3 x float> poison, float %579, i64 0
  %581 = shufflevector <3 x float> %580, <3 x float> poison, <3 x i32> zeroinitializer
  %582 = insertelement <3 x float> poison, float %578, i64 0
  %583 = shufflevector <3 x float> %582, <3 x float> poison, <3 x i32> zeroinitializer
  %584 = tail call fast <3 x float> @air.mix.v3f32(<3 x float> %581, <3 x float> %575, <3 x float> %583) #11
  br label %585

585:                                              ; preds = %568, %563
  %586 = phi <3 x float> [ %584, %568 ], [ %564, %563 ]
  %587 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 16
  %588 = load <4 x half>, ptr addrspace(2) %587, align 16
  %589 = shufflevector <4 x half> %588, <4 x half> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %590 = tail call fast <3 x float> @air.convert.f.v3f32.f.v3f16(<3 x half> %589) #11
  %591 = tail call fast float @air.dot.v3f32(<3 x float> %586, <3 x float> %590) #11
  %592 = insertelement <3 x float> undef, float %591, i64 0
  %593 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 17
  %594 = load <4 x half>, ptr addrspace(2) %593, align 8
  %595 = shufflevector <4 x half> %594, <4 x half> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %596 = tail call fast <3 x float> @air.convert.f.v3f32.f.v3f16(<3 x half> %595) #11
  %597 = tail call fast float @air.dot.v3f32(<3 x float> %586, <3 x float> %596) #11
  %598 = insertelement <3 x float> %592, float %597, i64 1
  %599 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 18
  %600 = load <4 x half>, ptr addrspace(2) %599, align 16
  %601 = shufflevector <4 x half> %600, <4 x half> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %602 = tail call fast <3 x float> @air.convert.f.v3f32.f.v3f16(<3 x half> %601) #11
  %603 = tail call fast float @air.dot.v3f32(<3 x float> %586, <3 x float> %602) #11
  %604 = insertelement <3 x float> %598, float %603, i64 2
  %605 = extractelement <4 x half> %588, i64 3
  %606 = fpext half %605 to float
  %607 = insertelement <3 x float> undef, float %606, i64 0
  %608 = extractelement <4 x half> %594, i64 3
  %609 = fpext half %608 to float
  %610 = insertelement <3 x float> %607, float %609, i64 1
  %611 = extractelement <4 x half> %600, i64 3
  %612 = fpext half %611 to float
  %613 = insertelement <3 x float> %610, float %612, i64 2
  %614 = fadd fast <3 x float> %604, %613
  %615 = insertelement <3 x float> poison, float %561, i64 0
  %616 = shufflevector <3 x float> %615, <3 x float> poison, <3 x i32> zeroinitializer
  %617 = tail call fast <3 x float> @air.mix.v3f32(<3 x float> %564, <3 x float> %614, <3 x float> %616) #11
  %618 = shufflevector <3 x float> %617, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %619 = shufflevector <4 x float> %618, <4 x float> %559, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  br label %620

620:                                              ; preds = %585, %558
  %621 = phi <4 x float> [ %619, %585 ], [ %559, %558 ]
  %622 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 10
  %623 = load float, ptr addrspace(2) %622, align 4, !tbaa !83
  %624 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 9
  %625 = load float, ptr addrspace(2) %624, align 16, !tbaa !84
  %626 = fmul fast float %623, %300
  %627 = tail call fast float @air.fast_saturate.f32(float %626) #11
  %628 = fsub fast float 2.000000e+00, %627
  %629 = fmul fast float %628, %627
  %630 = tail call fast float @air.fast_sqrt.f32(float %629) #11
  %631 = tail call fast float @air.fast_saturate.f32(float %630) #11
  %632 = fmul fast float %631, %625
  %633 = fsub fast float %625, %632
  %634 = insertelement <2 x float> poison, float %633, i64 0
  %635 = shufflevector <2 x float> %634, <2 x float> poison, <2 x i32> zeroinitializer
  %636 = fmul fast <2 x float> %635, %20
  %637 = fadd fast <2 x float> %636, %0
  %638 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 8
  %639 = load float, ptr addrspace(2) %638, align 4, !tbaa !85
  %640 = fcmp fast olt float %639, 2.000000e+00
  %641 = fmul fast float %639, 5.000000e-01
  %642 = fadd fast float %641, 1.000000e+00
  %643 = select i1 %640, float %642, float %639
  %644 = tail call fast float @air.fast_log2.f32(float %643) #11
  %645 = tail call fast float @air.fast_fmax.f32(float 0.000000e+00, float %644) #11
  %646 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %8, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %637, i1 true, <2 x i32> zeroinitializer, i1 true, float %645, float 0.000000e+00, i32 0) #9
  %647 = extractvalue { <4 x float>, i8 } %646, 0
  %648 = extractelement <4 x float> %647, i64 3
  %649 = tail call fast float @air.fast_fmax.f32(float %648, float 0x3EB0C6F7A0000000) #11
  %650 = insertelement <3 x float> poison, float %649, i64 0
  %651 = shufflevector <3 x float> %650, <3 x float> poison, <3 x i32> zeroinitializer
  %652 = shufflevector <4 x float> %647, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %653 = fdiv fast <3 x float> %652, %651
  %654 = tail call fast <3 x float> @air.fast_fabs.v3f32(<3 x float> %653) #11
  %655 = fcmp fast olt <3 x float> %654, splat (float 0x3EB0C6F7A0000000)
  %656 = select reassoc nsz arcp contract afn <3 x i1> %655, <3 x float> zeroinitializer, <3 x float> %653
  %657 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 19
  %658 = load <4 x half>, ptr addrspace(2) %657, align 8
  %659 = shufflevector <4 x half> %658, <4 x half> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %660 = tail call fast <3 x float> @air.convert.f.v3f32.f.v3f16(<3 x half> %659) #11
  %661 = tail call fast float @air.dot.v3f32(<3 x float> %656, <3 x float> %660) #11
  %662 = insertelement <3 x float> undef, float %661, i64 0
  %663 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 20
  %664 = load <4 x half>, ptr addrspace(2) %663, align 16
  %665 = shufflevector <4 x half> %664, <4 x half> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %666 = tail call fast <3 x float> @air.convert.f.v3f32.f.v3f16(<3 x half> %665) #11
  %667 = tail call fast float @air.dot.v3f32(<3 x float> %656, <3 x float> %666) #11
  %668 = insertelement <3 x float> %662, float %667, i64 1
  %669 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 21
  %670 = load <4 x half>, ptr addrspace(2) %669, align 8
  %671 = shufflevector <4 x half> %670, <4 x half> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %672 = tail call fast <3 x float> @air.convert.f.v3f32.f.v3f16(<3 x half> %671) #11
  %673 = tail call fast float @air.dot.v3f32(<3 x float> %656, <3 x float> %672) #11
  %674 = insertelement <3 x float> %668, float %673, i64 2
  %675 = extractelement <4 x half> %658, i64 3
  %676 = fpext half %675 to float
  %677 = insertelement <3 x float> undef, float %676, i64 0
  %678 = extractelement <4 x half> %664, i64 3
  %679 = fpext half %678 to float
  %680 = insertelement <3 x float> %677, float %679, i64 1
  %681 = extractelement <4 x half> %670, i64 3
  %682 = fpext half %681 to float
  %683 = insertelement <3 x float> %680, float %682, i64 2
  %684 = fadd fast <3 x float> %674, %683
  %685 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 35
  %686 = load float, ptr addrspace(2) %685, align 16, !tbaa !86
  %687 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 36
  %688 = load float, ptr addrspace(2) %687, align 4, !tbaa !87
  %689 = fsub fast float %688, %686
  %690 = fdiv fast float 1.000000e+00, %689
  %691 = fneg fast float %686
  %692 = fdiv fast float %691, %689
  %693 = tail call fast float @air.fma.f32(float %3, float %690, float %692) #11
  %694 = tail call fast float @air.fast_saturate.f32(float %693) #11
  %695 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 37
  %696 = load float, ptr addrspace(2) %695, align 8, !tbaa !88
  %697 = shufflevector <4 x float> %621, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %698 = tail call fast float @air.dot.v3f32(<3 x float> %697, <3 x float> <float 0x3FCB333340000000, float 0x3FE6E48E80000000, float 0x3FB2752540000000>) #11
  %699 = tail call fast float @air.fast_saturate.f32(float %698) #11
  %700 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 39
  %701 = load <2 x float>, ptr addrspace(2) %700, align 16
  %702 = extractelement <2 x float> %701, i64 0
  %703 = fmul fast float %702, %699
  %704 = extractelement <2 x float> %701, i64 1
  %705 = fadd fast float %703, %704
  %706 = fmul fast float %705, %705
  %707 = fmul fast float %706, %694
  %708 = fmul fast float %707, %707
  %709 = fmul fast float %708, %696
  %710 = insertelement <3 x float> poison, float %709, i64 0
  %711 = shufflevector <3 x float> %710, <3 x float> poison, <3 x i32> zeroinitializer
  %712 = tail call fast <3 x float> @air.mix.v3f32(<3 x float> %697, <3 x float> %684, <3 x float> %711) #11
  %713 = shufflevector <3 x float> %712, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %714 = shufflevector <4 x float> %713, <4 x float> %621, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  br label %715

715:                                              ; preds = %620, %296
  %716 = phi <4 x float> [ %714, %620 ], [ zeroinitializer, %296 ]
  %717 = insertelement <4 x float> poison, float %6, i64 0
  %718 = shufflevector <4 x float> %717, <4 x float> poison, <4 x i32> zeroinitializer
  %719 = tail call fast <4 x float> @air.mix.v4f32(<4 x float> %297, <4 x float> %716, <4 x float> %718) #11
  %720 = insertelement <4 x float> <float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float poison>, float %160, i64 3
  %721 = fsub fast float 1.000000e+00, %160
  %722 = insertelement <4 x float> poison, float %721, i64 0
  %723 = shufflevector <4 x float> %722, <4 x float> poison, <4 x i32> zeroinitializer
  %724 = fmul fast <4 x float> %719, %723
  %725 = fadd fast <4 x float> %724, %720
  %726 = fcmp fast ogt float %106, 0x3EB0C6F7A0000000
  br i1 %726, label %727, label %854

727:                                              ; preds = %715
  %728 = shufflevector <4 x float> %725, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %729 = extractelement <4 x float> %725, i64 3
  %730 = fcmp fast olt float %729, 1.000000e+00
  br i1 %730, label %733, label %731

731:                                              ; preds = %727
  %732 = fsub fast float 1.000000e+00, %729
  br label %827

733:                                              ; preds = %727
  %734 = tail call fast float @air.fast_log2.f32(float 1.000000e+00) #11
  %735 = tail call fast float @air.fast_fmax.f32(float 0.000000e+00, float %734) #11
  %736 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %8, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %0, i1 true, <2 x i32> zeroinitializer, i1 true, float %735, float 0.000000e+00, i32 0) #9
  %737 = extractvalue { <4 x float>, i8 } %736, 0
  %738 = extractelement <4 x float> %737, i64 3
  %739 = tail call fast float @air.fast_fmax.f32(float %738, float 0x3EB0C6F7A0000000) #11
  %740 = insertelement <3 x float> poison, float %739, i64 0
  %741 = shufflevector <3 x float> %740, <3 x float> poison, <3 x i32> zeroinitializer
  %742 = shufflevector <4 x float> %737, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %743 = fdiv fast <3 x float> %742, %741
  %744 = tail call fast <3 x float> @air.fast_fabs.v3f32(<3 x float> %743) #11
  %745 = fcmp fast olt <3 x float> %744, splat (float 0x3EB0C6F7A0000000)
  %746 = select reassoc nsz arcp contract afn <3 x i1> %745, <3 x float> zeroinitializer, <3 x float> %743
  %747 = shufflevector <3 x float> %746, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %748 = insertelement <4 x float> %747, float 1.000000e+00, i64 3
  %749 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 38
  %750 = load float, ptr addrspace(2) %749, align 4, !tbaa !81
  %751 = fcmp fast ogt float %750, 0.000000e+00
  br i1 %751, label %752, label %820

752:                                              ; preds = %733
  %753 = getelementptr inbounds %struct.GlassBackgroundUniformsExt.37, ptr addrspace(2) %10, i64 0, i32 4
  %754 = load float, ptr addrspace(2) %753, align 4, !tbaa !82
  %755 = fcmp fast ogt float %754, 0.000000e+00
  br i1 %755, label %756, label %773

756:                                              ; preds = %752
  %757 = tail call fast float @air.dot.v3f32(<3 x float> <float 0x3FCB367A00000000, float 0x3FE6E2EB20000000, float 0x3FB27BB300000000>, <3 x float> %746) #11
  %758 = fmul fast float %757, %754
  %759 = fsub fast float 1.000000e+00, %758
  %760 = tail call fast float @air.fast_saturate.f32(float %759) #11
  %761 = insertelement <3 x float> poison, float %760, i64 0
  %762 = shufflevector <3 x float> %761, <3 x float> poison, <3 x i32> zeroinitializer
  %763 = fmul fast <3 x float> %762, %746
  %764 = fsub fast float 1.000000e+00, %760
  %765 = fmul fast float %764, 0x3FD3333340000000
  %766 = fadd fast float %765, 1.000000e+00
  %767 = fmul fast float %760, %757
  %768 = insertelement <3 x float> poison, float %767, i64 0
  %769 = shufflevector <3 x float> %768, <3 x float> poison, <3 x i32> zeroinitializer
  %770 = insertelement <3 x float> poison, float %766, i64 0
  %771 = shufflevector <3 x float> %770, <3 x float> poison, <3 x i32> zeroinitializer
  %772 = tail call fast <3 x float> @air.mix.v3f32(<3 x float> %769, <3 x float> %763, <3 x float> %771) #11
  br label %773

773:                                              ; preds = %756, %752
  %774 = phi <3 x float> [ %772, %756 ], [ %746, %752 ]
  %775 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 16
  %776 = load <4 x half>, ptr addrspace(2) %775, align 16
  %777 = shufflevector <4 x half> %776, <4 x half> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %778 = tail call fast <3 x float> @air.convert.f.v3f32.f.v3f16(<3 x half> %777) #11
  %779 = tail call fast float @air.dot.v3f32(<3 x float> %774, <3 x float> %778) #11
  %780 = insertelement <3 x float> undef, float %779, i64 0
  %781 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 17
  %782 = load <4 x half>, ptr addrspace(2) %781, align 8
  %783 = shufflevector <4 x half> %782, <4 x half> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %784 = tail call fast <3 x float> @air.convert.f.v3f32.f.v3f16(<3 x half> %783) #11
  %785 = tail call fast float @air.dot.v3f32(<3 x float> %774, <3 x float> %784) #11
  %786 = insertelement <3 x float> %780, float %785, i64 1
  %787 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 18
  %788 = load <4 x half>, ptr addrspace(2) %787, align 16
  %789 = shufflevector <4 x half> %788, <4 x half> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %790 = tail call fast <3 x float> @air.convert.f.v3f32.f.v3f16(<3 x half> %789) #11
  %791 = tail call fast float @air.dot.v3f32(<3 x float> %774, <3 x float> %790) #11
  %792 = insertelement <3 x float> %786, float %791, i64 2
  %793 = extractelement <4 x half> %776, i64 3
  %794 = fpext half %793 to float
  %795 = insertelement <3 x float> undef, float %794, i64 0
  %796 = extractelement <4 x half> %782, i64 3
  %797 = fpext half %796 to float
  %798 = insertelement <3 x float> %795, float %797, i64 1
  %799 = extractelement <4 x half> %788, i64 3
  %800 = fpext half %799 to float
  %801 = insertelement <3 x float> %798, float %800, i64 2
  %802 = fadd fast <3 x float> %792, %801
  %803 = getelementptr inbounds %struct.GlassBackgroundUniformsExt.37, ptr addrspace(2) %10, i64 0, i32 9
  %804 = load i8, ptr addrspace(2) %803, align 4, !tbaa !89, !range !44
  %805 = icmp eq i8 %804, 0
  br i1 %805, label %814, label %806

806:                                              ; preds = %773
  %807 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 56
  %808 = load float, ptr addrspace(2) %807, align 16, !tbaa !90
  %809 = fcmp fast olt float %808, 0.000000e+00
  br i1 %809, label %810, label %812

810:                                              ; preds = %806
  %811 = tail call fast <3 x float> @air.fast_fmin.v3f32(<3 x float> %802, <3 x float> %746) #11
  br label %814

812:                                              ; preds = %806
  %813 = tail call fast <3 x float> @air.fast_fmax.v3f32(<3 x float> %802, <3 x float> %746) #11
  br label %814

814:                                              ; preds = %812, %810, %773
  %815 = phi <3 x float> [ %802, %773 ], [ %811, %810 ], [ %813, %812 ]
  %816 = fmul fast float %750, %106
  %817 = insertelement <3 x float> poison, float %816, i64 0
  %818 = shufflevector <3 x float> %817, <3 x float> poison, <3 x i32> zeroinitializer
  %819 = tail call fast <3 x float> @air.mix.v3f32(<3 x float> %746, <3 x float> %815, <3 x float> %818) #11
  br label %820

820:                                              ; preds = %814, %733
  %821 = phi <3 x float> [ %819, %814 ], [ %746, %733 ]
  %822 = fsub fast float 1.000000e+00, %729
  %823 = insertelement <3 x float> poison, float %822, i64 0
  %824 = shufflevector <3 x float> %823, <3 x float> poison, <3 x i32> zeroinitializer
  %825 = fmul fast <3 x float> %821, %824
  %826 = fadd fast <3 x float> %825, %728
  br label %827

827:                                              ; preds = %820, %731
  %828 = phi float [ %732, %731 ], [ %822, %820 ]
  %829 = phi <4 x float> [ zeroinitializer, %731 ], [ %748, %820 ]
  %830 = phi <3 x float> [ %728, %731 ], [ %826, %820 ]
  %831 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 56
  %832 = load float, ptr addrspace(2) %831, align 16, !tbaa !90
  %833 = fmul fast float %832, %106
  %834 = insertelement <3 x float> poison, float %833, i64 0
  %835 = shufflevector <3 x float> %834, <3 x float> poison, <3 x i32> zeroinitializer
  %836 = tail call fast <3 x float> @air.fma.v3f32(<3 x float> splat (float -2.000000e+00), <3 x float> %830, <3 x float> splat (float 3.000000e+00)) #11
  %837 = tail call fast <3 x float> @air.fma.v3f32(<3 x float> %835, <3 x float> %836, <3 x float> splat (float 1.000000e+00)) #11
  %838 = fmul fast <3 x float> %837, %830
  %839 = getelementptr inbounds %struct.GlassBackgroundUniformsExt.37, ptr addrspace(2) %10, i64 0, i32 8
  %840 = load i8, ptr addrspace(2) %839, align 1, !tbaa !91, !range !44
  %841 = zext i8 %840 to i32
  %842 = tail call fast float @air.convert.f.f32.s.i32(i32 %841) #11
  %843 = fmul fast float %828, %106
  %844 = fmul fast float %843, %842
  %845 = fadd fast float %844, %729
  %846 = shufflevector <4 x float> %829, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %847 = fsub fast float 1.000000e+00, %845
  %848 = insertelement <3 x float> poison, float %847, i64 0
  %849 = shufflevector <3 x float> %848, <3 x float> poison, <3 x i32> zeroinitializer
  %850 = fmul fast <3 x float> %849, %846
  %851 = fsub fast <3 x float> %838, %850
  %852 = shufflevector <3 x float> %851, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %853 = insertelement <4 x float> %852, float %845, i64 3
  br label %854

854:                                              ; preds = %827, %715
  %855 = phi <4 x float> [ %853, %827 ], [ %725, %715 ]
  %856 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 43
  %857 = load float, ptr addrspace(2) %856, align 4, !tbaa !92
  %858 = fcmp fast ogt float %857, 0.000000e+00
  br i1 %858, label %859, label %889

859:                                              ; preds = %854
  %860 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 44
  %861 = load float, ptr addrspace(2) %860, align 8, !tbaa !93
  %862 = fsub fast float %3, %861
  %863 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 45
  %864 = load float, ptr addrspace(2) %863, align 4, !tbaa !94
  %865 = fmul fast float %862, %864
  %866 = tail call fast float @air.fast_saturate.f32(float %865) #11
  %867 = fsub fast float 1.000000e+00, %866
  %868 = getelementptr inbounds %struct.GlassBackgroundUniformsExt.37, ptr addrspace(2) %10, i64 0, i32 2
  %869 = load float, ptr addrspace(2) %868, align 4, !tbaa !95
  %870 = extractelement <4 x float> %855, i64 3
  %871 = tail call fast float @air.fast_fmax.f32(float %870, float 0x3EB0C6F7A0000000) #11
  %872 = insertelement <3 x float> poison, float %871, i64 0
  %873 = shufflevector <3 x float> %872, <3 x float> poison, <3 x i32> zeroinitializer
  %874 = shufflevector <4 x float> %855, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %875 = insertelement <3 x float> poison, float %869, i64 0
  %876 = shufflevector <3 x float> %875, <3 x float> poison, <3 x i32> zeroinitializer
  %877 = fmul fast <3 x float> %876, %874
  %878 = tail call fast float @air.fast_saturate.f32(float %870) #11
  %879 = insertelement <3 x float> poison, float %878, i64 0
  %880 = shufflevector <3 x float> %879, <3 x float> poison, <3 x i32> zeroinitializer
  %881 = fmul fast <3 x float> %877, %880
  %882 = fdiv fast <3 x float> %881, %873
  %883 = shufflevector <3 x float> %882, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %884 = insertelement <4 x float> %883, float %878, i64 3
  %885 = fmul fast float %867, %857
  %886 = insertelement <4 x float> poison, float %885, i64 0
  %887 = shufflevector <4 x float> %886, <4 x float> poison, <4 x i32> zeroinitializer
  %888 = tail call fast <4 x float> @air.mix.v4f32(<4 x float> %855, <4 x float> %884, <4 x float> %887) #11
  br label %889

889:                                              ; preds = %859, %854
  %890 = phi <4 x float> [ %888, %859 ], [ %855, %854 ]
  %891 = getelementptr inbounds %struct.GlassBackgroundUniformsExt.37, ptr addrspace(2) %10, i64 0, i32 3
  %892 = load float, ptr addrspace(2) %891, align 4, !tbaa !96
  %893 = fcmp fast ogt float %892, 0.000000e+00
  br i1 %893, label %894, label %941

894:                                              ; preds = %889
  %895 = getelementptr inbounds %struct.GlassBackgroundUniformsExt.37, ptr addrspace(2) %10, i64 0, i32 5
  %896 = load i8, ptr addrspace(2) %895, align 4, !tbaa !97, !range !44
  %897 = icmp eq i8 %896, 0
  br i1 %897, label %927, label %898

898:                                              ; preds = %894
  %899 = shufflevector <4 x float> %890, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %900 = extractelement <4 x float> %890, i64 3
  %901 = tail call fast float @air.fast_fmax.f32(float %900, float 0x3EB0C6F7A0000000) #11
  %902 = insertelement <3 x float> poison, float %901, i64 0
  %903 = shufflevector <3 x float> %902, <3 x float> poison, <3 x i32> zeroinitializer
  %904 = fdiv fast <3 x float> %899, %903
  %905 = shufflevector <3 x float> %904, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %906 = shufflevector <4 x float> %905, <4 x float> %890, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %907 = extractelement <3 x float> %904, i64 0
  %908 = extractelement <3 x float> %904, i64 1
  %909 = tail call fast float @air.fast_fmax.f32(float %907, float %908) #11
  %910 = extractelement <3 x float> %904, i64 2
  %911 = tail call fast float @air.fast_fmax.f32(float %909, float %910) #11
  %912 = fcmp fast ogt float %911, %892
  br i1 %912, label %913, label %920

913:                                              ; preds = %898
  %914 = fdiv fast float %892, %911
  %915 = insertelement <3 x float> poison, float %914, i64 0
  %916 = shufflevector <3 x float> %915, <3 x float> poison, <3 x i32> zeroinitializer
  %917 = fmul fast <3 x float> %916, %904
  %918 = shufflevector <3 x float> %917, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %919 = shufflevector <4 x float> %918, <4 x float> %906, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  br label %920

920:                                              ; preds = %913, %898
  %921 = phi <4 x float> [ %919, %913 ], [ %906, %898 ]
  %922 = shufflevector <4 x float> %890, <4 x float> undef, <3 x i32> <i32 3, i32 3, i32 3>
  %923 = shufflevector <4 x float> %921, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %924 = fmul fast <3 x float> %923, %922
  %925 = shufflevector <3 x float> %924, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %926 = shufflevector <4 x float> %925, <4 x float> %921, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  br label %941

927:                                              ; preds = %894
  %928 = extractelement <4 x float> %890, i64 3
  %929 = tail call fast float @air.fast_fmax.f32(float %928, float 0x3EB0C6F7A0000000) #11
  %930 = insertelement <3 x float> poison, float %929, i64 0
  %931 = shufflevector <3 x float> %930, <3 x float> poison, <3 x i32> zeroinitializer
  %932 = shufflevector <4 x float> %890, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %933 = fdiv fast <3 x float> %932, %931
  %934 = insertelement <3 x float> poison, float %892, i64 0
  %935 = shufflevector <3 x float> %934, <3 x float> poison, <3 x i32> zeroinitializer
  %936 = tail call fast <3 x float> @air.fast_clamp.v3f32(<3 x float> %933, <3 x float> splat (float -7.500000e-01), <3 x float> %935) #11
  %937 = shufflevector <4 x float> %890, <4 x float> undef, <3 x i32> <i32 3, i32 3, i32 3>
  %938 = fmul fast <3 x float> %936, %937
  %939 = shufflevector <3 x float> %938, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %940 = shufflevector <4 x float> %939, <4 x float> %890, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  br label %941

941:                                              ; preds = %927, %920, %889
  %942 = phi <4 x float> [ %926, %920 ], [ %940, %927 ], [ %890, %889 ]
  %943 = load float, ptr addrspace(2) %11, align 4, !tbaa !98
  %944 = insertelement <3 x float> poison, float %943, i64 0
  %945 = shufflevector <3 x float> %944, <3 x float> poison, <3 x i32> zeroinitializer
  %946 = shufflevector <4 x float> %942, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %947 = fmul fast <3 x float> %945, %946
  %948 = shufflevector <3 x float> %947, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %949 = shufflevector <4 x float> %948, <4 x float> %942, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  ret <4 x float> %949
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <3 x float> @air.fast_clamp.v3f32(<3 x float>, <3 x float>, <3 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_fmax.f32(float, float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <4 x float> @air.mix.v4f32(<4 x float>, <4 x float>, <4 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_saturate.f32(float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.convert.f.f32.s.i32(i32) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <3 x float> @air.fma.v3f32(<3 x float>, <3 x float>, <3 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <3 x float> @air.mix.v3f32(<3 x float>, <3 x float>, <3 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <3 x float> @air.fast_fmax.v3f32(<3 x float>, <3 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <3 x float> @air.fast_fmin.v3f32(<3 x float>, <3 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.dot.v3f32(<3 x float>, <3 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <3 x float> @air.convert.f.v3f32.f.v3f16(<3 x half>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <3 x float> @air.fast_fabs.v3f32(<3 x float>) local_unnamed_addr #2

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(argmem: read)
declare { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly, ptr addrspace(2) nocapture readonly, <2 x float>, i1, <2 x i32>, i1, float, float, i32) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_log2.f32(float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fma.f32(float, float, float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_sqrt.f32(float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <3 x float> @air.fast_saturate.v3f32(<3 x float>) local_unnamed_addr #2

; Function Attrs: convergent nofree nounwind memory(read)
define internal fastcc <4 x float> @_Z16aberrate_textureN5metal9texture2dIfLNS_6accessE0ELNS_16memory_coherenceE0EvEEDv2_fS4_bbfS4_(ptr addrspace(1) %0, <2 x float> noundef %1, <2 x float> noundef %2, i1 noundef zeroext %3, i1 noundef zeroext %4, float noundef %5, <2 x float> noundef %6) unnamed_addr #4 {
  %8 = fcmp fast olt float %5, 2.000000e+00
  %9 = fmul fast float %5, 5.000000e-01
  %10 = fadd fast float %9, 1.000000e+00
  %11 = select i1 %8, float %10, float %5
  br label %12

12:                                               ; preds = %61, %7
  %13 = phi <4 x float> [ zeroinitializer, %7 ], [ %82, %61 ]
  %14 = phi float [ 1.000000e+00, %7 ], [ %83, %61 ]
  %15 = phi i32 [ 0, %7 ], [ %84, %61 ]
  %16 = insertelement <2 x float> poison, float %14, i64 0
  %17 = shufflevector <2 x float> %16, <2 x float> poison, <2 x i32> zeroinitializer
  %18 = fmul fast <2 x float> %17, %2
  %19 = fadd fast <2 x float> %18, %1
  br i1 %4, label %20, label %57

20:                                               ; preds = %12
  %21 = tail call fast float @air.fast_log2.f32(float %11) #11
  %22 = tail call fast float @air.fast_fmax.f32(float 0.000000e+00, float %21) #11
  %23 = insertelement <2 x float> poison, float %22, i64 0
  %24 = shufflevector <2 x float> %23, <2 x float> poison, <2 x i32> zeroinitializer
  %25 = fmul fast <2 x float> %24, %6
  %26 = extractelement <2 x float> %25, i64 0
  %27 = extractelement <2 x float> %25, i64 1
  %28 = fadd fast <2 x float> %25, %19
  %29 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %0, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %28, i1 true, <2 x i32> zeroinitializer, i1 true, float %22, float 0.000000e+00, i32 0) #9
  %30 = extractvalue { <4 x float>, i8 } %29, 0
  %31 = fneg fast float %27
  %32 = insertelement <2 x float> %25, float %31, i64 1
  %33 = fadd fast <2 x float> %32, %19
  %34 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %0, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %33, i1 true, <2 x i32> zeroinitializer, i1 true, float %22, float 0.000000e+00, i32 0) #9
  %35 = extractvalue { <4 x float>, i8 } %34, 0
  %36 = fadd fast <4 x float> %35, %30
  %37 = fneg fast float %26
  %38 = insertelement <2 x float> undef, float %37, i64 0
  %39 = insertelement <2 x float> %25, float %37, i64 0
  %40 = fadd fast <2 x float> %39, %19
  %41 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %0, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %40, i1 true, <2 x i32> zeroinitializer, i1 true, float %22, float 0.000000e+00, i32 0) #9
  %42 = extractvalue { <4 x float>, i8 } %41, 0
  %43 = fadd fast <4 x float> %36, %42
  %44 = insertelement <2 x float> %38, float %31, i64 1
  %45 = fadd fast <2 x float> %44, %19
  %46 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %0, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %45, i1 true, <2 x i32> zeroinitializer, i1 true, float %22, float 0.000000e+00, i32 0) #9
  %47 = extractvalue { <4 x float>, i8 } %46, 0
  %48 = fadd fast <4 x float> %43, %47
  %49 = fmul fast <4 x float> %48, splat (float 2.500000e-01)
  %50 = shufflevector <4 x float> %49, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %51 = tail call fast <3 x float> @air.fast_fabs.v3f32(<3 x float> %50) #11
  %52 = fcmp fast olt <3 x float> %51, splat (float 0x3EB0C6F7A0000000)
  %53 = select reassoc nsz arcp contract afn <3 x i1> %52, <3 x float> <float 0.000000e+00, float 0.000000e+00, float poison>, <3 x float> %50
  %54 = shufflevector <3 x float> %53, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %55 = shufflevector <4 x float> %54, <4 x float> %49, <4 x i32> <i32 0, i32 1, i32 poison, i32 7>
  %56 = shufflevector <4 x float> %55, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 3>
  br label %61

57:                                               ; preds = %12
  %58 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %0, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %19, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #9
  %59 = extractvalue { <4 x float>, i8 } %58, 0
  %60 = shufflevector <4 x float> %59, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 3>
  br label %61

61:                                               ; preds = %57, %20
  %62 = phi <3 x float> [ %56, %20 ], [ %60, %57 ]
  %63 = extractelement <3 x float> %62, i64 2
  %64 = tail call fast float @air.fast_fmax.f32(float %63, float 0x3EB0C6F7A0000000) #11
  %65 = insertelement <2 x float> poison, float %64, i64 0
  %66 = shufflevector <2 x float> %65, <2 x float> poison, <2 x i32> zeroinitializer
  %67 = shufflevector <3 x float> %62, <3 x float> poison, <2 x i32> <i32 0, i32 1>
  %68 = fdiv fast <2 x float> %67, %66
  %69 = extractelement <2 x float> %68, i64 0
  %70 = fmul fast float %69, %14
  %71 = extractelement <4 x float> %13, i64 0
  %72 = fadd fast float %70, %71
  %73 = insertelement <4 x float> %13, float %72, i64 0
  %74 = extractelement <2 x float> %68, i64 1
  %75 = fsub fast float 1.000000e+00, %14
  %76 = fmul fast float %74, %75
  %77 = extractelement <4 x float> %13, i64 1
  %78 = fadd fast float %76, %77
  %79 = insertelement <4 x float> %73, float %78, i64 1
  %80 = extractelement <4 x float> %13, i64 3
  %81 = fadd fast float %63, %80
  %82 = insertelement <4 x float> %79, float %81, i64 3
  %83 = fadd fast float %14, 0xBFD5555560000000
  %84 = add nuw nsw i32 %15, 1
  %85 = icmp eq i32 %84, 3
  br i1 %85, label %99, label %12, !llvm.loop !99

86:                                               ; preds = %148
  %87 = fmul fast float %168, 0x3FC24924A0000000
  %88 = shufflevector <4 x float> %166, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %89 = fmul fast <3 x float> %88, <float 5.000000e-01, float 0x3FD5555560000000, float 5.000000e-01>
  %90 = shufflevector <3 x float> %89, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %91 = insertelement <4 x float> %90, float %87, i64 3
  %92 = insertelement <3 x float> poison, float %87, i64 0
  %93 = shufflevector <3 x float> %92, <3 x float> poison, <3 x i32> zeroinitializer
  %94 = shufflevector <4 x float> %91, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 3>
  %95 = fmul fast <3 x float> %94, %93
  %96 = shufflevector <3 x float> %95, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %97 = shufflevector <4 x float> %90, <4 x float> %96, <4 x i32> <i32 4, i32 5, i32 2, i32 6>
  %98 = select i1 %3, <4 x float> %97, <4 x float> %91
  ret <4 x float> %98

99:                                               ; preds = %148, %61
  %100 = phi <4 x float> [ %169, %148 ], [ %82, %61 ]
  %101 = phi float [ %170, %148 ], [ 0.000000e+00, %61 ]
  %102 = phi i32 [ %171, %148 ], [ 0, %61 ]
  %103 = insertelement <2 x float> poison, float %101, i64 0
  %104 = shufflevector <2 x float> %103, <2 x float> poison, <2 x i32> zeroinitializer
  %105 = fmul fast <2 x float> %104, %2
  %106 = fsub fast <2 x float> %1, %105
  br i1 %4, label %107, label %144

107:                                              ; preds = %99
  %108 = tail call fast float @air.fast_log2.f32(float %11) #11
  %109 = tail call fast float @air.fast_fmax.f32(float 0.000000e+00, float %108) #11
  %110 = insertelement <2 x float> poison, float %109, i64 0
  %111 = shufflevector <2 x float> %110, <2 x float> poison, <2 x i32> zeroinitializer
  %112 = fmul fast <2 x float> %111, %6
  %113 = extractelement <2 x float> %112, i64 0
  %114 = extractelement <2 x float> %112, i64 1
  %115 = fadd fast <2 x float> %112, %106
  %116 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %0, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %115, i1 true, <2 x i32> zeroinitializer, i1 true, float %109, float 0.000000e+00, i32 0) #9
  %117 = extractvalue { <4 x float>, i8 } %116, 0
  %118 = fneg fast float %114
  %119 = insertelement <2 x float> %112, float %118, i64 1
  %120 = fadd fast <2 x float> %119, %106
  %121 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %0, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %120, i1 true, <2 x i32> zeroinitializer, i1 true, float %109, float 0.000000e+00, i32 0) #9
  %122 = extractvalue { <4 x float>, i8 } %121, 0
  %123 = fadd fast <4 x float> %122, %117
  %124 = fneg fast float %113
  %125 = insertelement <2 x float> undef, float %124, i64 0
  %126 = insertelement <2 x float> %112, float %124, i64 0
  %127 = fadd fast <2 x float> %126, %106
  %128 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %0, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %127, i1 true, <2 x i32> zeroinitializer, i1 true, float %109, float 0.000000e+00, i32 0) #9
  %129 = extractvalue { <4 x float>, i8 } %128, 0
  %130 = fadd fast <4 x float> %123, %129
  %131 = insertelement <2 x float> %125, float %118, i64 1
  %132 = fadd fast <2 x float> %131, %106
  %133 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %0, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %132, i1 true, <2 x i32> zeroinitializer, i1 true, float %109, float 0.000000e+00, i32 0) #9
  %134 = extractvalue { <4 x float>, i8 } %133, 0
  %135 = fadd fast <4 x float> %130, %134
  %136 = fmul fast <4 x float> %135, splat (float 2.500000e-01)
  %137 = shufflevector <4 x float> %136, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %138 = tail call fast <3 x float> @air.fast_fabs.v3f32(<3 x float> %137) #11
  %139 = fcmp fast olt <3 x float> %138, splat (float 0x3EB0C6F7A0000000)
  %140 = select reassoc nsz arcp contract afn <3 x i1> %139, <3 x float> <float poison, float 0.000000e+00, float 0.000000e+00>, <3 x float> %137
  %141 = shufflevector <3 x float> %140, <3 x float> poison, <4 x i32> <i32 poison, i32 1, i32 2, i32 poison>
  %142 = shufflevector <4 x float> %141, <4 x float> %136, <4 x i32> <i32 poison, i32 1, i32 2, i32 7>
  %143 = shufflevector <4 x float> %142, <4 x float> poison, <3 x i32> <i32 1, i32 2, i32 3>
  br label %148

144:                                              ; preds = %99
  %145 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %0, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %106, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #9
  %146 = extractvalue { <4 x float>, i8 } %145, 0
  %147 = shufflevector <4 x float> %146, <4 x float> poison, <3 x i32> <i32 1, i32 2, i32 3>
  br label %148

148:                                              ; preds = %144, %107
  %149 = phi <3 x float> [ %143, %107 ], [ %147, %144 ]
  %150 = extractelement <3 x float> %149, i64 2
  %151 = tail call fast float @air.fast_fmax.f32(float %150, float 0x3EB0C6F7A0000000) #11
  %152 = insertelement <2 x float> poison, float %151, i64 0
  %153 = shufflevector <2 x float> %152, <2 x float> poison, <2 x i32> zeroinitializer
  %154 = shufflevector <3 x float> %149, <3 x float> poison, <2 x i32> <i32 0, i32 1>
  %155 = fdiv fast <2 x float> %154, %153
  %156 = extractelement <2 x float> %155, i64 0
  %157 = fsub fast float 1.000000e+00, %101
  %158 = fmul fast float %156, %157
  %159 = extractelement <4 x float> %100, i64 1
  %160 = fadd fast float %158, %159
  %161 = insertelement <4 x float> %100, float %160, i64 1
  %162 = extractelement <2 x float> %155, i64 1
  %163 = fmul fast float %162, %101
  %164 = extractelement <4 x float> %100, i64 2
  %165 = fadd fast float %163, %164
  %166 = insertelement <4 x float> %161, float %165, i64 2
  %167 = extractelement <4 x float> %100, i64 3
  %168 = fadd fast float %150, %167
  %169 = insertelement <4 x float> %166, float %168, i64 3
  %170 = fadd fast float %101, 0x3FD5555560000000
  %171 = add nuw nsw i32 %102, 1
  %172 = icmp eq i32 %171, 4
  br i1 %172, label %86, label %99, !llvm.loop !101
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.dot.v2f32(<2 x float>, <2 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare i1 @air.convert.u.i1.f.f32(float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.mix.f32(float, float, float) local_unnamed_addr #2

; Function Attrs: mustprogress nounwind willreturn
declare void @air.discard_fragment() local_unnamed_addr #5

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare half @air.fma.f16(half, half, half) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare half @air.saturate.f16(half) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x float> @air.fast_fmax.v2f32(<2 x float>, <2 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x float> @air.fast_saturate.v2f32(<2 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.convert.f.f32.u.i32(i32) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare i32 @air.get_height_texture_2d(ptr addrspace(1) nocapture readonly, i32) local_unnamed_addr #6

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare i32 @air.get_width_texture_2d(ptr addrspace(1) nocapture readonly, i32) local_unnamed_addr #6

; Function Attrs: convergent mustprogress nounwind willreturn
declare float @air.fwidth.f32(float) local_unnamed_addr #7

attributes #0 = { convergent mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { convergent nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #2 = { mustprogress nofree nosync nounwind willreturn memory(none) }
attributes #3 = { convergent mustprogress nofree nounwind willreturn memory(argmem: read) }
attributes #4 = { convergent nofree nounwind memory(read) "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #5 = { mustprogress nounwind willreturn }
attributes #6 = { mustprogress nofree nounwind willreturn memory(argmem: read) }
attributes #7 = { convergent mustprogress nounwind willreturn }
attributes #8 = { convergent nobuiltin "no-builtins" }
attributes #9 = { convergent nounwind willreturn memory(argmem: read) }
attributes #10 = { convergent nounwind willreturn }
attributes #11 = { nounwind willreturn memory(none) }
attributes #12 = { nounwind willreturn memory(argmem: read) }
attributes #13 = { nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.fragment = !{!15}
!air.sampler_states = !{!29, !30}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 27, i32 2]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{i32 7, !"air.max_device_buffers", i32 31}
!4 = !{i32 7, !"air.max_constant_buffers", i32 31}
!5 = !{i32 7, !"air.max_threadgroup_buffers", i32 31}
!6 = !{i32 7, !"air.max_textures", i32 128}
!7 = !{i32 7, !"air.max_read_write_textures", i32 8}
!8 = !{i32 7, !"air.max_samplers", i32 16}
!9 = !{!"Apple metal version 32023.922 (metalfe-32023.922.4)"}
!10 = !{i32 2, i32 9, i32 0}
!11 = !{!"Metal", i32 4, i32 1, i32 0}
!12 = !{!"air.compile.denorms_disable"}
!13 = !{!"air.compile.fast_math_enable"}
!14 = !{!"air.compile.framebuffer_fetch_enable"}
!15 = !{ptr @glass_background_all_lpf, !16, !18}
!16 = !{!17}
!17 = !{!"air.render_target", i32 0, i32 0, !"air.arg_type_name", !"float4"}
!18 = !{!19, !20, !21, !22, !23, !24, !26, !28}
!19 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"position", !"air.arg_unused"}
!20 = !{i32 1, !"air.fragment_input", !"generated(9texcoord0Dv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"texcoord0"}
!21 = !{i32 2, !"air.fragment_input", !"generated(9texcoord1Dv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"texcoord1"}
!22 = !{i32 3, !"air.texture", !"air.location_index", i32 3, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"source_texture"}
!23 = !{i32 4, !"air.texture", !"air.location_index", i32 4, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"sdf_texture"}
!24 = !{i32 5, !"air.buffer", !"air.buffer_size", i32 320, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.struct_type_info", !25, !"air.arg_type_size", i32 320, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"GlassBackgroundUniforms", !"air.arg_name", !"u"}
!25 = !{i32 0, i32 16, i32 0, !"float4", !"displacement_mat", i32 16, i32 4, i32 0, !"float", !"inner_refraction_amount", i32 20, i32 4, i32 0, !"float", !"inner_refraction_inv_height", i32 24, i32 4, i32 0, !"float", !"outer_refraction_amount", i32 28, i32 4, i32 0, !"float", !"outer_refraction_inv_height", i32 32, i32 4, i32 0, !"float", !"refraction_threshold0", i32 36, i32 4, i32 0, !"float", !"refraction_threshold1", i32 40, i32 4, i32 0, !"float", !"blur_radius", i32 44, i32 4, i32 0, !"float", !"edge_bleed_blur_radius", i32 48, i32 4, i32 0, !"float", !"edge_bleed_amount", i32 52, i32 4, i32 0, !"float", !"edge_bleed_inv_height", i32 56, i32 4, i32 0, !"float", !"shadow_amount", i32 60, i32 4, i32 0, !"float", !"shadow_inv_height", i32 64, i32 8, i32 0, !"float2", !"shadow_offset", i32 72, i32 4, i32 0, !"float", !"shadow_blur_radius", i32 76, i32 4, i32 0, !"float", !"shadow_inv_radius", i32 80, i32 8, i32 0, !"half4", !"face_cm0", i32 88, i32 8, i32 0, !"half4", !"face_cm1", i32 96, i32 8, i32 0, !"half4", !"face_cm2", i32 104, i32 8, i32 0, !"half4", !"bleed_cm0", i32 112, i32 8, i32 0, !"half4", !"bleed_cm1", i32 120, i32 8, i32 0, !"half4", !"bleed_cm2", i32 128, i32 8, i32 0, !"half4", !"shadow_cm0", i32 136, i32 8, i32 0, !"half4", !"shadow_cm1", i32 144, i32 8, i32 0, !"half4", !"shadow_cm2", i32 152, i32 4, i32 0, !"float", !"shadow_contribution", i32 156, i32 4, i32 0, !"float", !"shadow_face_opacity", i32 160, i32 4, i32 0, !"float", !"blur_alpha0", i32 164, i32 4, i32 0, !"float", !"blur_alpha1", i32 168, i32 4, i32 0, !"float", !"blur_alpha2", i32 172, i32 4, i32 0, !"float", !"blur_alpha3", i32 176, i32 4, i32 0, !"float", !"blur_dist0", i32 180, i32 4, i32 0, !"float", !"blur_dist1", i32 184, i32 4, i32 0, !"float", !"blur_dist2", i32 188, i32 4, i32 0, !"float", !"blur_dist3", i32 192, i32 4, i32 0, !"float", !"edge_bleed_dist0", i32 196, i32 4, i32 0, !"float", !"edge_bleed_dist1", i32 200, i32 4, i32 0, !"float", !"edge_bleed_opacity", i32 204, i32 4, i32 0, !"float", !"face_opacity", i32 208, i32 8, i32 0, !"float2", !"bleed_darken", i32 216, i32 4, i32 0, !"float", !"shadow_dist_offset", i32 220, i32 4, i32 0, !"float", !"shadow_opacity", i32 224, i32 4, i32 0, !"float", !"refraction_opacity", i32 228, i32 4, i32 0, !"float", !"holding_tone_opacity", i32 232, i32 4, i32 0, !"float", !"sdr_shadow_dist0", i32 236, i32 4, i32 0, !"float", !"sdr_shadow_inv", i32 240, i32 8, i32 0, !"float2", !"ring_shadow_offset", i32 248, i32 4, i32 0, !"float", !"ring_shadow_stroke_width", i32 252, i32 4, i32 0, !"float", !"ring_shadow_radius", i32 256, i32 4, i32 0, !"float", !"ring_shadow_opacity", i32 260, i32 4, i32 0, !"float", !"ring_shadow_mask", i32 264, i32 8, i32 0, !"float2", !"key_fill_highlight_dir", i32 272, i32 4, i32 0, !"float", !"key_fill_highlight_height", i32 276, i32 4, i32 0, !"float", !"key_fill_highlight_spread", i32 280, i32 4, i32 0, !"float", !"key_fill_highlight_amount", i32 284, i32 4, i32 0, !"float", !"key_fill_highlight_effect_offset", i32 288, i32 4, i32 0, !"float", !"key_fill_highlight_color_bias", i32 292, i32 4, i32 0, !"float", !"blur_fill_blur_radius", i32 296, i32 4, i32 0, !"float", !"blur_fill_lighten_opacity", i32 300, i32 4, i32 0, !"float", !"blur_fill_darken_opacity", i32 304, i32 4, i32 0, !"float", !"blur_fill_normal_opacity", i32 308, i32 4, i32 0, !"float", !"aberration_amount", i32 312, i32 8, i32 0, !"float2", !"aberration_dir"}
!26 = !{i32 6, !"air.buffer", !"air.buffer_size", i32 28, !"air.location_index", i32 9, i32 1, !"air.read", !"air.address_space", i32 2, !"air.struct_type_info", !27, !"air.arg_type_size", i32 28, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"GlassBackgroundUniformsExt", !"air.arg_name", !"u_ext"}
!27 = !{i32 0, i32 4, i32 0, !"float", !"inv_aberration_height", i32 4, i32 4, i32 0, !"float", !"aberration_offset", i32 8, i32 4, i32 0, !"float", !"sdr_white_value", i32 12, i32 4, i32 0, !"float", !"clamp_limit", i32 16, i32 4, i32 0, !"float", !"face_color_matrix_max_luma_complement", i32 20, i32 1, i32 0, !"bool", !"preserve_hue", i32 21, i32 1, i32 0, !"bool", !"blur_fill_enabled", i32 22, i32 1, i32 0, !"bool", !"stroke_mode", i32 23, i32 1, i32 0, !"bool", !"highlight_extension", i32 24, i32 1, i32 0, !"bool", !"wants_highlight_bias_correction"}
!28 = !{i32 7, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 6, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"edr_scale"}
!29 = !{!"air.sampler_state", ptr addrspace(2) @__air_sampler_state.4}
!30 = !{!"air.sampler_state", ptr addrspace(2) @__air_sampler_state.1}
!31 = !{!32, !32, i64 0}
!32 = !{!"omnipotent char", !33, i64 0}
!33 = !{!"Simple C++ TBAA"}
!34 = !{!35, !36, i64 256}
!35 = !{!"_ZTS23GlassBackgroundUniforms", !36, i64 0, !36, i64 16, !36, i64 20, !36, i64 24, !36, i64 28, !36, i64 32, !36, i64 36, !36, i64 40, !36, i64 44, !36, i64 48, !36, i64 52, !36, i64 56, !36, i64 60, !36, i64 64, !36, i64 72, !36, i64 76, !37, i64 80, !37, i64 88, !37, i64 96, !37, i64 104, !37, i64 112, !37, i64 120, !37, i64 128, !37, i64 136, !37, i64 144, !36, i64 152, !36, i64 156, !36, i64 160, !36, i64 164, !36, i64 168, !36, i64 172, !36, i64 176, !36, i64 180, !36, i64 184, !36, i64 188, !36, i64 192, !36, i64 196, !36, i64 200, !36, i64 204, !36, i64 208, !36, i64 216, !36, i64 220, !36, i64 224, !36, i64 228, !36, i64 232, !36, i64 236, !36, i64 240, !36, i64 248, !36, i64 252, !36, i64 256, !36, i64 260, !36, i64 264, !36, i64 272, !36, i64 276, !36, i64 280, !36, i64 284, !36, i64 288, !36, i64 292, !36, i64 296, !36, i64 300, !36, i64 304, !36, i64 308, !36, i64 312}
!36 = !{!"float", !32, i64 0}
!37 = !{!"half", !32, i64 0}
!38 = !{!35, !36, i64 260}
!39 = !{!35, !36, i64 272}
!40 = !{!35, !36, i64 284}
!41 = !{!42, !43, i64 22}
!42 = !{!"_ZTS26GlassBackgroundUniformsExt", !36, i64 0, !36, i64 4, !36, i64 8, !36, i64 12, !36, i64 16, !43, i64 20, !43, i64 21, !43, i64 22, !43, i64 23, !43, i64 24}
!43 = !{!"bool", !32, i64 0}
!44 = !{i8 0, i8 2}
!45 = !{!35, !36, i64 276}
!46 = !{!35, !36, i64 280}
!47 = !{!35, !36, i64 252}
!48 = !{!35, !36, i64 248}
!49 = !{!35, !36, i64 216}
!50 = !{!35, !36, i64 60}
!51 = !{!35, !36, i64 56}
!52 = !{!35, !36, i64 76}
!53 = !{!35, !36, i64 220}
!54 = !{!35, !36, i64 152}
!55 = !{!35, !36, i64 72}
!56 = !{!35, !36, i64 156}
!57 = !{!35, !36, i64 20}
!58 = !{!35, !36, i64 16}
!59 = !{!35, !36, i64 176}
!60 = !{!35, !36, i64 180}
!61 = !{!35, !36, i64 184}
!62 = !{!35, !36, i64 188}
!63 = !{!35, !36, i64 164}
!64 = !{!35, !36, i64 168}
!65 = !{!35, !36, i64 172}
!66 = !{!35, !36, i64 160}
!67 = !{!35, !36, i64 40}
!68 = !{!35, !36, i64 308}
!69 = !{!42, !36, i64 4}
!70 = !{!42, !36, i64 0}
!71 = !{!42, !43, i64 21}
!72 = !{!35, !36, i64 292}
!73 = !{!35, !36, i64 300}
!74 = !{!35, !36, i64 296}
!75 = !{!35, !36, i64 304}
!76 = !{!35, !36, i64 224}
!77 = !{!35, !36, i64 28}
!78 = !{!35, !36, i64 24}
!79 = !{!35, !36, i64 32}
!80 = !{!35, !36, i64 36}
!81 = !{!35, !36, i64 204}
!82 = !{!42, !36, i64 16}
!83 = !{!35, !36, i64 52}
!84 = !{!35, !36, i64 48}
!85 = !{!35, !36, i64 44}
!86 = !{!35, !36, i64 192}
!87 = !{!35, !36, i64 196}
!88 = !{!35, !36, i64 200}
!89 = !{!42, !43, i64 24}
!90 = !{!35, !36, i64 288}
!91 = !{!42, !43, i64 23}
!92 = !{!35, !36, i64 228}
!93 = !{!35, !36, i64 232}
!94 = !{!35, !36, i64 236}
!95 = !{!42, !36, i64 8}
!96 = !{!42, !36, i64 12}
!97 = !{!42, !43, i64 20}
!98 = !{!36, !36, i64 0}
!99 = distinct !{!99, !100}
!100 = !{!"llvm.loop.mustprogress"}
!101 = distinct !{!101, !100}
