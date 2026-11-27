source_filename = "glass_background_minimal_lpf"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v29-apple-ios27.2.0"

%struct.GlassBackgroundUniforms.36 = type { <4 x float>, float, float, float, float, float, float, float, float, float, float, float, float, <2 x float>, float, float, <4 x half>, <4 x half>, <4 x half>, <4 x half>, <4 x half>, <4 x half>, <4 x half>, <4 x half>, <4 x half>, float, float, float, float, float, float, float, float, float, float, float, float, float, float, <2 x float>, float, float, float, float, float, float, <2 x float>, float, float, float, float, <2 x float>, float, float, float, float, float, float, float, float, float, float, <2 x float> }
%struct.GlassBackgroundUniformsExt.37 = type { float, float, float, float, float, i8, i8, i8, i8, i8 }

@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer
@__air_sampler_state.4 = internal addrspace(2) constant [2 x i64] [i64 34901797601036873, i64 0], align 8
@__air_sampler_state.1 = internal addrspace(2) constant [2 x i64] [i64 34901797601028681, i64 0], align 8

; Function Attrs: convergent mustprogress nounwind
define <4 x float> @glass_background_minimal_lpf(<4 x float> %0, <2 x float> %1, <2 x float> %2, ptr addrspace(1) %3, ptr addrspace(1) %4, ptr addrspace(2) noundef align 16 dereferenceable(320) "air-buffer-no-alias" %5, ptr addrspace(2) noundef align 4 dereferenceable(28) "air-buffer-no-alias" %6, ptr addrspace(2) noundef align 4 dereferenceable(4) "air-buffer-no-alias" %7) local_unnamed_addr #0 {
  %9 = tail call fast fastcc <4 x float> @_Z25glass_background_base_texILb0ELb0ELb0EEDv4_fDv2_fS1_N5metal9texture2dIfLNS2_6accessE0ELNS2_16memory_coherenceE0EvEES6_RU11MTLconstantK23GlassBackgroundUniformsRU11MTLconstantK26GlassBackgroundUniformsExtRU11MTLconstantKf(<2 x float> noundef %1, <2 x float> noundef %2, ptr addrspace(1) %3, ptr addrspace(1) %4, ptr addrspace(2) noundef align 16 dereferenceable(320) %5, ptr addrspace(2) noundef align 4 dereferenceable(28) %6, ptr addrspace(2) noundef align 4 dereferenceable(4) %7) #6
  ret <4 x float> %9
}

; Function Attrs: convergent mustprogress nounwind
define internal fastcc <4 x float> @_Z25glass_background_base_texILb0ELb0ELb0EEDv4_fDv2_fS1_N5metal9texture2dIfLNS2_6accessE0ELNS2_16memory_coherenceE0EvEES6_RU11MTLconstantK23GlassBackgroundUniformsRU11MTLconstantK26GlassBackgroundUniformsExtRU11MTLconstantKf(<2 x float> noundef %0, <2 x float> noundef %1, ptr addrspace(1) %2, ptr addrspace(1) %3, ptr addrspace(2) noundef align 16 dereferenceable(320) %4, ptr addrspace(2) noundef align 4 dereferenceable(28) %5, ptr addrspace(2) noundef align 4 dereferenceable(4) %6) unnamed_addr #0 {
  %8 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) nocapture readonly @__air_sampler_state.1, <2 x float> %1, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #7
  %9 = extractvalue { <4 x float>, i8 } %8, 0
  %10 = extractelement <4 x float> %9, i64 0
  %11 = tail call fast float @air.fwidth.f32(float %10) #8
  %12 = tail call fast float @air.fast_fmax.f32(float %11, float 0x3F1A36E2E0000000) #9
  %13 = fdiv fast float %10, %12
  %14 = fsub fast float 5.000000e-01, %13
  %15 = tail call fast float @air.fast_saturate.f32(float %14) #9
  %16 = extractelement <4 x float> %9, i64 3
  %17 = fmul fast float %15, %16
  %18 = fcmp fast olt float %17, 1.000000e+00
  br i1 %18, label %19, label %26

19:                                               ; preds = %7
  %20 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %4, i64 0, i32 13
  %21 = load <2 x float>, ptr addrspace(2) %20, align 16, !tbaa !31
  %22 = fadd fast <2 x float> %21, %1
  %23 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) nocapture readonly @__air_sampler_state.1, <2 x float> %22, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #7
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
  %41 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) nocapture readonly @__air_sampler_state.1, <2 x float> %40, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #7
  %42 = extractvalue { <4 x float>, i8 } %41, 0
  %43 = shufflevector <4 x float> %42, <4 x float> poison, <2 x i32> <i32 0, i32 3>
  br label %44

44:                                               ; preds = %37, %33, %26
  %45 = phi <2 x float> [ %43, %37 ], [ zeroinitializer, %33 ], [ zeroinitializer, %26 ]
  %46 = shufflevector <4 x float> %9, <4 x float> poison, <2 x i32> <i32 1, i32 2>
  %47 = tail call fast fastcc <4 x float> @_Z21glass_background_baseILb0ELb0ELb0EEDv4_fDv2_fS1_S1_ffS1_ffN5metal9texture2dIfLNS2_6accessE0ELNS2_16memory_coherenceE0EvEERU11MTLconstantK23GlassBackgroundUniformsRU11MTLconstantK26GlassBackgroundUniformsExtRU11MTLconstantKf(<2 x float> noundef %0, <2 x float> noundef %27, <2 x float> noundef %45, float noundef %10, float noundef %12, <2 x float> noundef %46, float noundef %17, float noundef %16, ptr addrspace(1) %2, ptr addrspace(2) noundef align 16 dereferenceable(320) %4, ptr addrspace(2) noundef align 4 dereferenceable(28) %5, ptr addrspace(2) noundef align 4 dereferenceable(4) %6) #6
  ret <4 x float> %47
}

; Function Attrs: convergent nounwind
define internal fastcc <4 x float> @_Z21glass_background_baseILb0ELb0ELb0EEDv4_fDv2_fS1_S1_ffS1_ffN5metal9texture2dIfLNS2_6accessE0ELNS2_16memory_coherenceE0EvEERU11MTLconstantK23GlassBackgroundUniformsRU11MTLconstantK26GlassBackgroundUniformsExtRU11MTLconstantKf(<2 x float> noundef %0, <2 x float> noundef %1, <2 x float> noundef %2, float noundef %3, float noundef %4, <2 x float> noundef %5, float noundef %6, float noundef %7, ptr addrspace(1) %8, ptr addrspace(2) noundef align 16 dereferenceable(320) %9, ptr addrspace(2) noundef align 4 dereferenceable(28) %10, ptr addrspace(2) noundef align 4 dereferenceable(4) %11) unnamed_addr #1 {
  %13 = fcmp fast olt float %6, 1.000000e+00
  br i1 %13, label %14, label %62

14:                                               ; preds = %12
  %15 = extractelement <2 x float> %1, i64 0
  %16 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 15
  %17 = load float, ptr addrspace(2) %16, align 4, !tbaa !39
  %18 = fmul fast float %17, %15
  %19 = fptrunc float %18 to half
  %20 = fmul fast half %19, 0xH3400
  %21 = fadd fast half %20, 0xH3800
  %22 = tail call fast half @air.saturate.f16(half %21) #9
  %23 = fmul fast half %22, 0xH4400
  %24 = fadd fast half %23, 0xHC000
  %25 = fmul fast half %24, %24
  %26 = tail call fast half @air.fma.f16(half 0xH1A0D, half %25, half 0xHA869) #9
  %27 = tail call fast half @air.fma.f16(half %26, half %25, half 0xH3162) #9
  %28 = tail call fast half @air.fma.f16(half %27, half %25, half 0xHB87C) #9
  %29 = tail call fast half @air.fma.f16(half %28, half %24, half 0xH3800) #9
  %30 = fpext half %29 to float
  %31 = extractelement <2 x float> %1, i64 1
  %32 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 41
  %33 = load float, ptr addrspace(2) %32, align 4, !tbaa !40
  %34 = fmul fast float %33, %31
  %35 = fmul fast float %34, %30
  %36 = fcmp fast oeq float %6, 0.000000e+00
  %37 = fcmp fast olt float %35, 0x3EB0C6F7A0000000
  %38 = select i1 %36, i1 %37, i1 false
  br i1 %38, label %39, label %40

39:                                               ; preds = %14
  tail call void @air.discard_fragment() #10
  br label %40

40:                                               ; preds = %39, %14
  %41 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 22
  %42 = load <4 x half>, ptr addrspace(2) %41, align 16
  %43 = extractelement <4 x half> %42, i64 3
  %44 = fpext half %43 to float
  %45 = insertelement <4 x float> undef, float %44, i64 0
  %46 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 23
  %47 = load <4 x half>, ptr addrspace(2) %46, align 8
  %48 = extractelement <4 x half> %47, i64 3
  %49 = fpext half %48 to float
  %50 = insertelement <4 x float> %45, float %49, i64 1
  %51 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 24
  %52 = load <4 x half>, ptr addrspace(2) %51, align 16
  %53 = extractelement <4 x half> %52, i64 3
  %54 = fpext half %53 to float
  %55 = insertelement <4 x float> %50, float %54, i64 2
  %56 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 26
  %57 = load float, ptr addrspace(2) %56, align 4, !tbaa !41
  %58 = insertelement <4 x float> %55, float %57, i64 3
  %59 = insertelement <4 x float> poison, float %35, i64 0
  %60 = shufflevector <4 x float> %59, <4 x float> poison, <4 x i32> zeroinitializer
  %61 = fmul fast <4 x float> %58, %60
  br label %62

62:                                               ; preds = %40, %12
  %63 = phi <4 x float> [ %61, %40 ], [ zeroinitializer, %12 ]
  %64 = fcmp fast ogt float %6, 0.000000e+00
  br i1 %64, label %65, label %149

65:                                               ; preds = %62
  %66 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 7
  %67 = load float, ptr addrspace(2) %66, align 8, !tbaa !42
  %68 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 27
  %69 = load float, ptr addrspace(2) %68, align 16, !tbaa !43
  %70 = fmul fast float %69, %67
  %71 = fcmp fast olt float %70, 2.000000e+00
  %72 = fmul fast float %70, 5.000000e-01
  %73 = fadd fast float %72, 1.000000e+00
  %74 = select i1 %71, float %73, float %70
  %75 = tail call fast float @air.fast_log2.f32(float %74) #9
  %76 = tail call fast float @air.fast_fmax.f32(float 0.000000e+00, float %75) #9
  %77 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %8, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %0, i1 true, <2 x i32> zeroinitializer, i1 true, float %76, float 0.000000e+00, i32 0) #7
  %78 = extractvalue { <4 x float>, i8 } %77, 0
  %79 = shufflevector <4 x float> %78, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %80 = tail call fast <3 x float> @air.fast_fabs.v3f32(<3 x float> %79) #9
  %81 = fcmp fast olt <3 x float> %80, splat (float 0x3EB0C6F7A0000000)
  %82 = select reassoc nsz arcp contract afn <3 x i1> %81, <3 x float> zeroinitializer, <3 x float> %79
  %83 = extractelement <4 x float> %78, i64 3
  %84 = tail call fast float @air.fast_fmax.f32(float %83, float 0x3EB0C6F7A0000000) #9
  %85 = insertelement <3 x float> poison, float %84, i64 0
  %86 = shufflevector <3 x float> %85, <3 x float> poison, <3 x i32> zeroinitializer
  %87 = fdiv fast <3 x float> %82, %86
  %88 = shufflevector <3 x float> %87, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %89 = insertelement <4 x float> %88, float 1.000000e+00, i64 3
  %90 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 38
  %91 = load float, ptr addrspace(2) %90, align 4, !tbaa !44
  %92 = fcmp fast ogt float %91, 0.000000e+00
  br i1 %92, label %93, label %149

93:                                               ; preds = %65
  %94 = getelementptr inbounds %struct.GlassBackgroundUniformsExt.37, ptr addrspace(2) %10, i64 0, i32 4
  %95 = load float, ptr addrspace(2) %94, align 4, !tbaa !45
  %96 = fcmp fast ogt float %95, 0.000000e+00
  br i1 %96, label %97, label %114

97:                                               ; preds = %93
  %98 = tail call fast float @air.dot.v3f32(<3 x float> <float 0x3FCB367A00000000, float 0x3FE6E2EB20000000, float 0x3FB27BB300000000>, <3 x float> %87) #9
  %99 = fmul fast float %98, %95
  %100 = fsub fast float 1.000000e+00, %99
  %101 = tail call fast float @air.fast_saturate.f32(float %100) #9
  %102 = insertelement <3 x float> poison, float %101, i64 0
  %103 = shufflevector <3 x float> %102, <3 x float> poison, <3 x i32> zeroinitializer
  %104 = fmul fast <3 x float> %103, %87
  %105 = fsub fast float 1.000000e+00, %101
  %106 = fmul fast float %105, 0x3FD3333340000000
  %107 = fadd fast float %106, 1.000000e+00
  %108 = fmul fast float %101, %98
  %109 = insertelement <3 x float> poison, float %108, i64 0
  %110 = shufflevector <3 x float> %109, <3 x float> poison, <3 x i32> zeroinitializer
  %111 = insertelement <3 x float> poison, float %107, i64 0
  %112 = shufflevector <3 x float> %111, <3 x float> poison, <3 x i32> zeroinitializer
  %113 = tail call fast <3 x float> @air.mix.v3f32(<3 x float> %110, <3 x float> %104, <3 x float> %112) #9
  br label %114

114:                                              ; preds = %97, %93
  %115 = phi <3 x float> [ %113, %97 ], [ %87, %93 ]
  %116 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 16
  %117 = load <4 x half>, ptr addrspace(2) %116, align 16
  %118 = shufflevector <4 x half> %117, <4 x half> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %119 = tail call fast <3 x float> @air.convert.f.v3f32.f.v3f16(<3 x half> %118) #9
  %120 = tail call fast float @air.dot.v3f32(<3 x float> %115, <3 x float> %119) #9
  %121 = insertelement <3 x float> undef, float %120, i64 0
  %122 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 17
  %123 = load <4 x half>, ptr addrspace(2) %122, align 8
  %124 = shufflevector <4 x half> %123, <4 x half> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %125 = tail call fast <3 x float> @air.convert.f.v3f32.f.v3f16(<3 x half> %124) #9
  %126 = tail call fast float @air.dot.v3f32(<3 x float> %115, <3 x float> %125) #9
  %127 = insertelement <3 x float> %121, float %126, i64 1
  %128 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 18
  %129 = load <4 x half>, ptr addrspace(2) %128, align 16
  %130 = shufflevector <4 x half> %129, <4 x half> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %131 = tail call fast <3 x float> @air.convert.f.v3f32.f.v3f16(<3 x half> %130) #9
  %132 = tail call fast float @air.dot.v3f32(<3 x float> %115, <3 x float> %131) #9
  %133 = insertelement <3 x float> %127, float %132, i64 2
  %134 = extractelement <4 x half> %117, i64 3
  %135 = fpext half %134 to float
  %136 = insertelement <3 x float> undef, float %135, i64 0
  %137 = extractelement <4 x half> %123, i64 3
  %138 = fpext half %137 to float
  %139 = insertelement <3 x float> %136, float %138, i64 1
  %140 = extractelement <4 x half> %129, i64 3
  %141 = fpext half %140 to float
  %142 = insertelement <3 x float> %139, float %141, i64 2
  %143 = fadd fast <3 x float> %133, %142
  %144 = insertelement <3 x float> poison, float %91, i64 0
  %145 = shufflevector <3 x float> %144, <3 x float> poison, <3 x i32> zeroinitializer
  %146 = tail call fast <3 x float> @air.mix.v3f32(<3 x float> %87, <3 x float> %143, <3 x float> %145) #9
  %147 = shufflevector <3 x float> %146, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %148 = insertelement <4 x float> %147, float 1.000000e+00, i64 3
  br label %149

149:                                              ; preds = %114, %65, %62
  %150 = phi <4 x float> [ %148, %114 ], [ %89, %65 ], [ zeroinitializer, %62 ]
  %151 = insertelement <4 x float> poison, float %6, i64 0
  %152 = shufflevector <4 x float> %151, <4 x float> poison, <4 x i32> zeroinitializer
  %153 = tail call fast <4 x float> @air.mix.v4f32(<4 x float> %63, <4 x float> %150, <4 x float> %152) #9
  %154 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 43
  %155 = load float, ptr addrspace(2) %154, align 4, !tbaa !48
  %156 = fcmp fast ogt float %155, 0.000000e+00
  br i1 %156, label %157, label %187

157:                                              ; preds = %149
  %158 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 44
  %159 = load float, ptr addrspace(2) %158, align 8, !tbaa !49
  %160 = fsub fast float %3, %159
  %161 = getelementptr inbounds %struct.GlassBackgroundUniforms.36, ptr addrspace(2) %9, i64 0, i32 45
  %162 = load float, ptr addrspace(2) %161, align 4, !tbaa !50
  %163 = fmul fast float %160, %162
  %164 = tail call fast float @air.fast_saturate.f32(float %163) #9
  %165 = fsub fast float 1.000000e+00, %164
  %166 = getelementptr inbounds %struct.GlassBackgroundUniformsExt.37, ptr addrspace(2) %10, i64 0, i32 2
  %167 = load float, ptr addrspace(2) %166, align 4, !tbaa !51
  %168 = extractelement <4 x float> %153, i64 3
  %169 = tail call fast float @air.fast_fmax.f32(float %168, float 0x3EB0C6F7A0000000) #9
  %170 = insertelement <3 x float> poison, float %169, i64 0
  %171 = shufflevector <3 x float> %170, <3 x float> poison, <3 x i32> zeroinitializer
  %172 = shufflevector <4 x float> %153, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %173 = insertelement <3 x float> poison, float %167, i64 0
  %174 = shufflevector <3 x float> %173, <3 x float> poison, <3 x i32> zeroinitializer
  %175 = fmul fast <3 x float> %174, %172
  %176 = tail call fast float @air.fast_saturate.f32(float %168) #9
  %177 = insertelement <3 x float> poison, float %176, i64 0
  %178 = shufflevector <3 x float> %177, <3 x float> poison, <3 x i32> zeroinitializer
  %179 = fmul fast <3 x float> %175, %178
  %180 = fdiv fast <3 x float> %179, %171
  %181 = shufflevector <3 x float> %180, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %182 = insertelement <4 x float> %181, float %176, i64 3
  %183 = fmul fast float %165, %155
  %184 = insertelement <4 x float> poison, float %183, i64 0
  %185 = shufflevector <4 x float> %184, <4 x float> poison, <4 x i32> zeroinitializer
  %186 = tail call fast <4 x float> @air.mix.v4f32(<4 x float> %153, <4 x float> %182, <4 x float> %185) #9
  br label %187

187:                                              ; preds = %157, %149
  %188 = phi <4 x float> [ %186, %157 ], [ %153, %149 ]
  %189 = getelementptr inbounds %struct.GlassBackgroundUniformsExt.37, ptr addrspace(2) %10, i64 0, i32 3
  %190 = load float, ptr addrspace(2) %189, align 4, !tbaa !52
  %191 = fcmp fast ogt float %190, 0.000000e+00
  br i1 %191, label %192, label %239

192:                                              ; preds = %187
  %193 = getelementptr inbounds %struct.GlassBackgroundUniformsExt.37, ptr addrspace(2) %10, i64 0, i32 5
  %194 = load i8, ptr addrspace(2) %193, align 4, !tbaa !53, !range !54
  %195 = icmp eq i8 %194, 0
  br i1 %195, label %225, label %196

196:                                              ; preds = %192
  %197 = shufflevector <4 x float> %188, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %198 = extractelement <4 x float> %188, i64 3
  %199 = tail call fast float @air.fast_fmax.f32(float %198, float 0x3EB0C6F7A0000000) #9
  %200 = insertelement <3 x float> poison, float %199, i64 0
  %201 = shufflevector <3 x float> %200, <3 x float> poison, <3 x i32> zeroinitializer
  %202 = fdiv fast <3 x float> %197, %201
  %203 = shufflevector <3 x float> %202, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %204 = shufflevector <4 x float> %203, <4 x float> %188, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %205 = extractelement <3 x float> %202, i64 0
  %206 = extractelement <3 x float> %202, i64 1
  %207 = tail call fast float @air.fast_fmax.f32(float %205, float %206) #9
  %208 = extractelement <3 x float> %202, i64 2
  %209 = tail call fast float @air.fast_fmax.f32(float %207, float %208) #9
  %210 = fcmp fast ogt float %209, %190
  br i1 %210, label %211, label %218

211:                                              ; preds = %196
  %212 = fdiv fast float %190, %209
  %213 = insertelement <3 x float> poison, float %212, i64 0
  %214 = shufflevector <3 x float> %213, <3 x float> poison, <3 x i32> zeroinitializer
  %215 = fmul fast <3 x float> %214, %202
  %216 = shufflevector <3 x float> %215, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %217 = shufflevector <4 x float> %216, <4 x float> %204, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  br label %218

218:                                              ; preds = %211, %196
  %219 = phi <4 x float> [ %217, %211 ], [ %204, %196 ]
  %220 = shufflevector <4 x float> %188, <4 x float> undef, <3 x i32> <i32 3, i32 3, i32 3>
  %221 = shufflevector <4 x float> %219, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %222 = fmul fast <3 x float> %221, %220
  %223 = shufflevector <3 x float> %222, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %224 = shufflevector <4 x float> %223, <4 x float> %219, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  br label %239

225:                                              ; preds = %192
  %226 = extractelement <4 x float> %188, i64 3
  %227 = tail call fast float @air.fast_fmax.f32(float %226, float 0x3EB0C6F7A0000000) #9
  %228 = insertelement <3 x float> poison, float %227, i64 0
  %229 = shufflevector <3 x float> %228, <3 x float> poison, <3 x i32> zeroinitializer
  %230 = shufflevector <4 x float> %188, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %231 = fdiv fast <3 x float> %230, %229
  %232 = insertelement <3 x float> poison, float %190, i64 0
  %233 = shufflevector <3 x float> %232, <3 x float> poison, <3 x i32> zeroinitializer
  %234 = tail call fast <3 x float> @air.fast_clamp.v3f32(<3 x float> %231, <3 x float> splat (float -7.500000e-01), <3 x float> %233) #9
  %235 = shufflevector <4 x float> %188, <4 x float> undef, <3 x i32> <i32 3, i32 3, i32 3>
  %236 = fmul fast <3 x float> %234, %235
  %237 = shufflevector <3 x float> %236, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %238 = shufflevector <4 x float> %237, <4 x float> %188, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  br label %239

239:                                              ; preds = %225, %218, %187
  %240 = phi <4 x float> [ %224, %218 ], [ %238, %225 ], [ %188, %187 ]
  %241 = load float, ptr addrspace(2) %11, align 4, !tbaa !55
  %242 = insertelement <3 x float> poison, float %241, i64 0
  %243 = shufflevector <3 x float> %242, <3 x float> poison, <3 x i32> zeroinitializer
  %244 = shufflevector <4 x float> %240, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %245 = fmul fast <3 x float> %243, %244
  %246 = shufflevector <3 x float> %245, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %247 = shufflevector <4 x float> %246, <4 x float> %240, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  ret <4 x float> %247
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
declare <3 x float> @air.mix.v3f32(<3 x float>, <3 x float>, <3 x float>) local_unnamed_addr #2

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

; Function Attrs: mustprogress nounwind willreturn
declare void @air.discard_fragment() local_unnamed_addr #4

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare half @air.fma.f16(half, half, half) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare half @air.saturate.f16(half) local_unnamed_addr #2

; Function Attrs: convergent mustprogress nounwind willreturn
declare float @air.fwidth.f32(float) local_unnamed_addr #5

attributes #0 = { convergent mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { convergent nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #2 = { mustprogress nofree nosync nounwind willreturn memory(none) }
attributes #3 = { convergent mustprogress nofree nounwind willreturn memory(argmem: read) }
attributes #4 = { mustprogress nounwind willreturn }
attributes #5 = { convergent mustprogress nounwind willreturn }
attributes #6 = { convergent nobuiltin "no-builtins" }
attributes #7 = { convergent nounwind willreturn memory(argmem: read) }
attributes #8 = { convergent nounwind willreturn }
attributes #9 = { nounwind willreturn memory(none) }
attributes #10 = { nounwind willreturn }

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
!15 = !{ptr @glass_background_minimal_lpf, !16, !18}
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
!39 = !{!35, !36, i64 76}
!40 = !{!35, !36, i64 220}
!41 = !{!35, !36, i64 156}
!42 = !{!35, !36, i64 40}
!43 = !{!35, !36, i64 160}
!44 = !{!35, !36, i64 204}
!45 = !{!46, !36, i64 16}
!46 = !{!"_ZTS26GlassBackgroundUniformsExt", !36, i64 0, !36, i64 4, !36, i64 8, !36, i64 12, !36, i64 16, !47, i64 20, !47, i64 21, !47, i64 22, !47, i64 23, !47, i64 24}
!47 = !{!"bool", !32, i64 0}
!48 = !{!35, !36, i64 228}
!49 = !{!35, !36, i64 232}
!50 = !{!35, !36, i64 236}
!51 = !{!46, !36, i64 8}
!52 = !{!46, !36, i64 12}
!53 = !{!46, !47, i64 20}
!54 = !{i8 0, i8 2}
!55 = !{!36, !36, i64 0}
