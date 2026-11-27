source_filename = "glass_foreground_sdf_lpf"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v29-apple-ios27.2.0"

%struct.GlassForegroundSdfUniforms.40 = type { %struct.SdfFragmentUniforms.15.1, %struct.GlassForegroundUniforms.39 }
%struct.SdfFragmentUniforms.15.1 = type { <4 x float>, <4 x float>, <4 x float> }
%struct.GlassForegroundUniforms.39 = type { <4 x float>, float, float, float, float, float, float, <2 x float>, float, float, float, float, <2 x float>, [8 x i8] }

@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer
@__air_sampler_state.4 = internal addrspace(2) constant [2 x i64] [i64 34901797601036873, i64 0], align 8

; Function Attrs: convergent mustprogress nounwind
define <4 x float> @glass_foreground_sdf_lpf(<4 x float> %0, <2 x float> %1, <2 x float> %2, ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) nocapture noundef readonly align 16 dereferenceable(128) "air-buffer-no-alias" %4, ptr addrspace(2) nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %5) local_unnamed_addr #0 {
  %7 = getelementptr inbounds %struct.GlassForegroundSdfUniforms.40, ptr addrspace(2) %4, i64 0, i32 0
  %8 = getelementptr inbounds %struct.GlassForegroundSdfUniforms.40, ptr addrspace(2) %4, i64 0, i32 0, i32 0
  %9 = load <4 x float>, ptr addrspace(2) %8, align 16, !alias.scope !29, !noalias !32
  %10 = extractelement <4 x float> %9, i64 2
  %11 = tail call fast float @air.fast_fabs.f32(float %10) #7
  %12 = tail call i32 @air.convert.s.i32.f.f32(float %11) #7
  %13 = tail call fast fastcc <4 x float> @_Z21compute_sdf_with_modeDv2_fiRU11MTLconstantK19SdfFragmentUniformsf(<2 x float> noundef %1, i32 noundef %12, ptr addrspace(2) noundef align 16 dereferenceable(48) %7, float undef) #8
  %14 = getelementptr inbounds %struct.GlassForegroundSdfUniforms.40, ptr addrspace(2) %4, i64 0, i32 1
  %15 = tail call fast fastcc <4 x float> @_Z21glass_foreground_baseDv2_fDv4_fN5metal9texture2dIfLNS1_6accessE0ELNS1_16memory_coherenceE0EvEERU11MTLconstantK23GlassForegroundUniformsRU11MTLconstantKf(<2 x float> noundef %2, <4 x float> noundef %13, ptr addrspace(1) %3, ptr addrspace(2) noundef align 16 dereferenceable(80) %14, ptr addrspace(2) noundef align 4 dereferenceable(4) %5) #9
  ret <4 x float> %15
}

; Function Attrs: convergent nounwind
define internal fastcc <4 x float> @_Z21glass_foreground_baseDv2_fDv4_fN5metal9texture2dIfLNS1_6accessE0ELNS1_16memory_coherenceE0EvEERU11MTLconstantK23GlassForegroundUniformsRU11MTLconstantKf(<2 x float> noundef %0, <4 x float> noundef %1, ptr addrspace(1) nocapture readonly %2, ptr addrspace(2) nocapture noundef readonly align 16 dereferenceable(80) %3, ptr addrspace(2) nocapture noundef readonly align 4 dereferenceable(4) %4) unnamed_addr #1 {
  %6 = extractelement <4 x float> %1, i64 0
  %7 = tail call fast float @air.fwidth.f32(float %6) #10
  %8 = extractelement <4 x float> %1, i64 3
  %9 = fcmp fast olt float %8, 0x3F50624DE0000000
  br i1 %9, label %200, label %10

10:                                               ; preds = %5
  %11 = tail call fast float @air.fast_fmax.f32(float %7, float 0x3F1A36E2E0000000) #7
  %12 = fdiv fast float %6, %11
  %13 = fsub fast float 5.000000e-01, %12
  %14 = tail call fast float @air.fast_saturate.f32(float %13) #7
  %15 = fneg fast float %6
  %16 = shufflevector <4 x float> %1, <4 x float> poison, <2 x i32> <i32 1, i32 2>
  %17 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 0
  %18 = load <4 x float>, ptr addrspace(2) %17, align 16
  %19 = shufflevector <4 x float> %18, <4 x float> poison, <2 x i32> <i32 0, i32 1>
  %20 = shufflevector <4 x float> %18, <4 x float> poison, <2 x i32> <i32 2, i32 3>
  %21 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 12
  %22 = load <2 x float>, ptr addrspace(2) %21, align 16
  %23 = tail call fast float @air.dot.v2f32(<2 x float> %19, <2 x float> %22) #7
  %24 = insertelement <2 x float> undef, float %23, i64 0
  %25 = extractelement <4 x float> %18, i64 1
  %26 = extractelement <2 x float> %22, i64 0
  %27 = fmul fast float %26, %25
  %28 = extractelement <4 x float> %18, i64 0
  %29 = extractelement <2 x float> %22, i64 1
  %30 = fmul fast float %29, %28
  %31 = fsub fast float %27, %30
  %32 = insertelement <2 x float> %24, float %31, i64 1
  %33 = tail call fast float @air.dot.v2f32(<2 x float> %20, <2 x float> %22) #7
  %34 = insertelement <2 x float> undef, float %33, i64 0
  %35 = extractelement <4 x float> %18, i64 3
  %36 = fmul fast float %26, %35
  %37 = extractelement <4 x float> %18, i64 2
  %38 = fmul fast float %29, %37
  %39 = fsub fast float %36, %38
  %40 = insertelement <2 x float> %34, float %39, i64 1
  %41 = tail call fast float @air.dot.v2f32(<2 x float> %32, <2 x float> %16) #7
  %42 = insertelement <2 x float> undef, float %41, i64 0
  %43 = tail call fast float @air.dot.v2f32(<2 x float> %40, <2 x float> %16) #7
  %44 = insertelement <2 x float> %42, float %43, i64 1
  %45 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 1
  %46 = load float, ptr addrspace(2) %45, align 16, !tbaa !35
  %47 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 2
  %48 = load float, ptr addrspace(2) %47, align 4, !tbaa !40
  %49 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 3
  %50 = load float, ptr addrspace(2) %49, align 8, !tbaa !41
  %51 = fsub fast float %15, %50
  %52 = fmul fast float %51, %48
  %53 = tail call fast float @air.fast_saturate.f32(float %52) #7
  %54 = fsub fast float 2.000000e+00, %53
  %55 = fmul fast float %54, %53
  %56 = tail call fast float @air.fast_sqrt.f32(float %55) #7
  %57 = tail call fast float @air.fast_saturate.f32(float %56) #7
  %58 = fmul fast float %57, %46
  %59 = fsub fast float %46, %58
  %60 = insertelement <2 x float> poison, float %59, i64 0
  %61 = shufflevector <2 x float> %60, <2 x float> poison, <2 x i32> zeroinitializer
  %62 = fmul fast <2 x float> %61, %44
  %63 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 7
  %64 = load <2 x float>, ptr addrspace(2) %63, align 8
  %65 = tail call fast float @air.dot.v2f32(<2 x float> %19, <2 x float> %64) #7
  %66 = insertelement <2 x float> undef, float %65, i64 0
  %67 = extractelement <2 x float> %64, i64 0
  %68 = fmul fast float %67, %25
  %69 = extractelement <2 x float> %64, i64 1
  %70 = fmul fast float %69, %28
  %71 = fsub fast float %68, %70
  %72 = insertelement <2 x float> %66, float %71, i64 1
  %73 = tail call fast float @air.dot.v2f32(<2 x float> %20, <2 x float> %64) #7
  %74 = insertelement <2 x float> undef, float %73, i64 0
  %75 = fmul fast float %67, %35
  %76 = fmul fast float %69, %37
  %77 = fsub fast float %75, %76
  %78 = insertelement <2 x float> %74, float %77, i64 1
  %79 = tail call fast float @air.dot.v2f32(<2 x float> %72, <2 x float> %16) #7
  %80 = insertelement <2 x float> undef, float %79, i64 1
  %81 = tail call fast float @air.dot.v2f32(<2 x float> %78, <2 x float> %16) #7
  %82 = insertelement <2 x float> %80, float %81, i64 0
  %83 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 4
  %84 = load float, ptr addrspace(2) %83, align 4, !tbaa !42
  %85 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 5
  %86 = load float, ptr addrspace(2) %85, align 16, !tbaa !43
  %87 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 6
  %88 = load float, ptr addrspace(2) %87, align 4, !tbaa !44
  %89 = fsub fast float %15, %88
  %90 = fmul fast float %89, %86
  %91 = tail call fast float @air.fast_saturate.f32(float %90) #7
  %92 = fsub fast float 2.000000e+00, %91
  %93 = fmul fast float %92, %91
  %94 = tail call fast float @air.fast_sqrt.f32(float %93) #7
  %95 = tail call fast float @air.fast_saturate.f32(float %94) #7
  %96 = fmul fast float %95, %84
  %97 = fsub fast float %84, %96
  %98 = insertelement <2 x float> poison, float %97, i64 0
  %99 = shufflevector <2 x float> %98, <2 x float> poison, <2 x i32> zeroinitializer
  %100 = fmul fast <2 x float> %99, %82
  %101 = fadd fast <2 x float> %62, %0
  br label %102

102:                                              ; preds = %102, %10
  %103 = phi <4 x float> [ zeroinitializer, %10 ], [ %131, %102 ]
  %104 = phi float [ 1.000000e+00, %10 ], [ %132, %102 ]
  %105 = phi i32 [ 0, %10 ], [ %133, %102 ]
  %106 = insertelement <2 x float> poison, float %104, i64 0
  %107 = shufflevector <2 x float> %106, <2 x float> poison, <2 x i32> zeroinitializer
  %108 = fmul fast <2 x float> %107, %100
  %109 = fadd fast <2 x float> %108, %101
  %110 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %2, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %109, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #11
  %111 = extractvalue { <4 x float>, i8 } %110, 0
  %112 = extractelement <4 x float> %111, i64 3
  %113 = tail call fast float @air.fast_fmax.f32(float %112, float 0x3EB0C6F7A0000000) #7
  %114 = insertelement <2 x float> poison, float %113, i64 0
  %115 = shufflevector <2 x float> %114, <2 x float> poison, <2 x i32> zeroinitializer
  %116 = shufflevector <4 x float> %111, <4 x float> poison, <2 x i32> <i32 0, i32 1>
  %117 = fdiv fast <2 x float> %116, %115
  %118 = extractelement <2 x float> %117, i64 0
  %119 = fmul fast float %118, %104
  %120 = extractelement <4 x float> %103, i64 0
  %121 = fadd fast float %119, %120
  %122 = insertelement <4 x float> %103, float %121, i64 0
  %123 = extractelement <2 x float> %117, i64 1
  %124 = fsub fast float 1.000000e+00, %104
  %125 = fmul fast float %123, %124
  %126 = extractelement <4 x float> %103, i64 1
  %127 = fadd fast float %125, %126
  %128 = insertelement <4 x float> %122, float %127, i64 1
  %129 = extractelement <4 x float> %103, i64 3
  %130 = fadd fast float %112, %129
  %131 = insertelement <4 x float> %128, float %130, i64 3
  %132 = fadd fast float %104, 0xBFD5555560000000
  %133 = add nuw nsw i32 %105, 1
  %134 = icmp eq i32 %133, 3
  br i1 %134, label %135, label %102, !llvm.loop !45

135:                                              ; preds = %135, %102
  %136 = phi <4 x float> [ %164, %135 ], [ %131, %102 ]
  %137 = phi float [ %165, %135 ], [ 0.000000e+00, %102 ]
  %138 = phi i32 [ %166, %135 ], [ 0, %102 ]
  %139 = insertelement <2 x float> poison, float %137, i64 0
  %140 = shufflevector <2 x float> %139, <2 x float> poison, <2 x i32> zeroinitializer
  %141 = fmul fast <2 x float> %140, %100
  %142 = fsub fast <2 x float> %101, %141
  %143 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %2, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %142, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #11
  %144 = extractvalue { <4 x float>, i8 } %143, 0
  %145 = extractelement <4 x float> %144, i64 3
  %146 = tail call fast float @air.fast_fmax.f32(float %145, float 0x3EB0C6F7A0000000) #7
  %147 = insertelement <2 x float> poison, float %146, i64 0
  %148 = shufflevector <2 x float> %147, <2 x float> poison, <2 x i32> zeroinitializer
  %149 = shufflevector <4 x float> %144, <4 x float> poison, <2 x i32> <i32 1, i32 2>
  %150 = fdiv fast <2 x float> %149, %148
  %151 = extractelement <2 x float> %150, i64 0
  %152 = fsub fast float 1.000000e+00, %137
  %153 = fmul fast float %151, %152
  %154 = extractelement <4 x float> %136, i64 1
  %155 = fadd fast float %153, %154
  %156 = insertelement <4 x float> %136, float %155, i64 1
  %157 = extractelement <2 x float> %150, i64 1
  %158 = fmul fast float %157, %137
  %159 = extractelement <4 x float> %136, i64 2
  %160 = fadd fast float %158, %159
  %161 = insertelement <4 x float> %156, float %160, i64 2
  %162 = extractelement <4 x float> %136, i64 3
  %163 = fadd fast float %145, %162
  %164 = insertelement <4 x float> %161, float %163, i64 3
  %165 = fadd fast float %137, 0x3FD5555560000000
  %166 = add nuw nsw i32 %138, 1
  %167 = icmp eq i32 %166, 4
  br i1 %167, label %168, label %135, !llvm.loop !47

168:                                              ; preds = %135
  %169 = shufflevector <4 x float> %161, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %170 = fmul fast <3 x float> %169, <float 5.000000e-01, float 0x3FD5555560000000, float 5.000000e-01>
  %171 = fmul fast float %8, 0x3FC24924A0000000
  %172 = fmul fast float %171, %14
  %173 = fmul fast float %172, %163
  %174 = load float, ptr addrspace(2) %4, align 4, !tbaa !48
  %175 = fmul fast float %173, %174
  %176 = insertelement <3 x float> poison, float %175, i64 0
  %177 = shufflevector <3 x float> %176, <3 x float> poison, <3 x i32> zeroinitializer
  %178 = fmul fast <3 x float> %170, %177
  %179 = shufflevector <3 x float> %178, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %180 = insertelement <4 x float> %179, float %173, i64 3
  %181 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 10
  %182 = load float, ptr addrspace(2) %181, align 8, !tbaa !49
  %183 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 11
  %184 = load float, ptr addrspace(2) %183, align 4, !tbaa !50
  %185 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 8
  %186 = load float, ptr addrspace(2) %185, align 16, !tbaa !51
  %187 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 9
  %188 = load float, ptr addrspace(2) %187, align 4, !tbaa !52
  %189 = fsub fast float %188, %186
  %190 = fdiv fast float 1.000000e+00, %189
  %191 = fneg fast float %186
  %192 = fdiv fast float %191, %189
  %193 = tail call fast float @air.fma.f32(float %6, float %190, float %192) #7
  %194 = tail call fast float @air.fast_saturate.f32(float %193) #7
  %195 = tail call fast float @air.mix.f32(float %182, float %184, float %194) #7
  %196 = fsub fast float 1.000000e+00, %195
  %197 = insertelement <4 x float> poison, float %196, i64 0
  %198 = shufflevector <4 x float> %197, <4 x float> poison, <4 x i32> zeroinitializer
  %199 = fmul fast <4 x float> %198, %180
  br label %200

200:                                              ; preds = %168, %5
  %201 = phi <4 x float> [ %199, %168 ], [ zeroinitializer, %5 ]
  ret <4 x float> %201
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.mix.f32(float, float, float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_saturate.f32(float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fma.f32(float, float, float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_fmax.f32(float, float) local_unnamed_addr #2

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(argmem: read)
declare { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly, ptr addrspace(2) nocapture readonly, <2 x float>, i1, <2 x i32>, i1, float, float, i32) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_sqrt.f32(float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.dot.v2f32(<2 x float>, <2 x float>) local_unnamed_addr #2

; Function Attrs: convergent mustprogress nounwind willreturn
declare float @air.fwidth.f32(float) local_unnamed_addr #4

; Function Attrs: mustprogress nounwind
define internal fastcc <4 x float> @_Z21compute_sdf_with_modeDv2_fiRU11MTLconstantK19SdfFragmentUniformsf(<2 x float> noundef %0, i32 noundef %1, ptr addrspace(2) nocapture noundef readonly align 16 dereferenceable(48) %2, float %3) unnamed_addr #5 {
  %5 = icmp slt i32 %1, 4
  br i1 %5, label %6, label %60

6:                                                ; preds = %4
  %7 = getelementptr inbounds %struct.SdfFragmentUniforms.15.1, ptr addrspace(2) %2, i64 0, i32 0
  %8 = load <4 x float>, ptr addrspace(2) %7, align 16, !tbaa !53
  %9 = getelementptr inbounds %struct.SdfFragmentUniforms.15.1, ptr addrspace(2) %2, i64 0, i32 1
  %10 = load <4 x float>, ptr addrspace(2) %9, align 16, !tbaa !53
  %11 = shufflevector <4 x float> %8, <4 x float> poison, <2 x i32> <i32 0, i32 1>
  %12 = tail call fast <2 x float> @air.fast_fabs.v2f32(<2 x float> %0) #7
  %13 = fsub fast <2 x float> %12, %11
  %14 = extractelement <2 x float> %13, i64 0
  %15 = extractelement <2 x float> %13, i64 1
  %16 = extractelement <2 x float> %0, i64 0
  %17 = fcmp fast oge float %16, 0.000000e+00
  %18 = select fast i1 %17, float 1.000000e+00, float -1.000000e+00
  %19 = extractelement <2 x float> %0, i64 1
  %20 = fcmp fast oge float %19, 0.000000e+00
  %21 = select fast i1 %20, float 1.000000e+00, float -1.000000e+00
  %22 = insertelement <2 x float> undef, float %18, i64 0
  %23 = insertelement <2 x float> %22, float %21, i64 1
  %24 = fcmp fast ogt float %14, %15
  %25 = select fast i1 %24, <2 x float> <float 1.000000e+00, float 0.000000e+00>, <2 x float> <float 0.000000e+00, float 1.000000e+00>
  %26 = tail call fast float @air.fast_fmax.f32(float %14, float %15) #7
  %27 = fmul fast <2 x float> %25, %23
  %28 = extractelement <4 x float> %8, i64 0
  %29 = extractelement <4 x float> %8, i64 1
  %30 = fmul fast float %28, %19
  %31 = fdiv fast float %30, %29
  %32 = insertelement <2 x float> %0, float %31, i64 1
  %33 = tail call fast float @air.dot.v2f32(<2 x float> %32, <2 x float> %32) #7
  %34 = tail call fast float @air.fast_rsqrt.f32(float %33) #7
  %35 = insertelement <2 x float> poison, float %34, i64 0
  %36 = shufflevector <2 x float> %35, <2 x float> poison, <2 x i32> zeroinitializer
  %37 = fmul fast <2 x float> %36, %32
  %38 = shufflevector <4 x float> %8, <4 x float> undef, <2 x i32> <i32 3, i32 3>
  %39 = tail call fast <2 x float> @air.mix.v2f32(<2 x float> %27, <2 x float> %37, <2 x float> %38) #7
  %40 = tail call fast float @air.dot.v2f32(<2 x float> %39, <2 x float> %39) #7
  %41 = tail call fast float @air.fast_rsqrt.f32(float %40) #7
  %42 = insertelement <2 x float> poison, float %41, i64 0
  %43 = shufflevector <2 x float> %42, <2 x float> poison, <2 x i32> zeroinitializer
  %44 = fmul fast <2 x float> %43, %39
  %45 = extractelement <2 x float> %44, i64 0
  %46 = extractelement <4 x float> %10, i64 0
  %47 = fmul fast float %45, %46
  %48 = extractelement <2 x float> %44, i64 1
  %49 = extractelement <4 x float> %10, i64 1
  %50 = fmul fast float %48, %49
  %51 = fadd fast float %47, %50
  %52 = extractelement <4 x float> %10, i64 2
  %53 = fmul fast float %45, %52
  %54 = extractelement <4 x float> %10, i64 3
  %55 = fmul fast float %48, %54
  %56 = fadd fast float %53, %55
  %57 = insertelement <4 x float> <float poison, float poison, float poison, float 1.000000e+00>, float %26, i64 0
  %58 = insertelement <4 x float> %57, float %51, i64 1
  %59 = insertelement <4 x float> %58, float %56, i64 2
  br label %206

60:                                               ; preds = %4
  %61 = icmp eq i32 %1, 4
  %62 = getelementptr inbounds %struct.SdfFragmentUniforms.15.1, ptr addrspace(2) %2, i64 0, i32 0
  %63 = load <4 x float>, ptr addrspace(2) %62, align 16, !tbaa !53
  %64 = getelementptr inbounds %struct.SdfFragmentUniforms.15.1, ptr addrspace(2) %2, i64 0, i32 1
  %65 = load <4 x float>, ptr addrspace(2) %64, align 16, !tbaa !53
  %66 = getelementptr inbounds %struct.SdfFragmentUniforms.15.1, ptr addrspace(2) %2, i64 0, i32 2
  %67 = load <4 x float>, ptr addrspace(2) %66, align 16, !tbaa !53
  %68 = shufflevector <4 x float> %63, <4 x float> poison, <2 x i32> <i32 0, i32 1>
  br i1 %61, label %69, label %117

69:                                               ; preds = %60
  %70 = tail call fast <2 x float> @air.fast_fabs.v2f32(<2 x float> %0) #7
  %71 = extractelement <4 x float> %67, i64 2
  %72 = shufflevector <4 x float> %67, <4 x float> poison, <2 x i32> <i32 0, i32 1>
  %73 = tail call fast fastcc <3 x float> @_ZN2CA3OGL5Metal12ShaderUtils_IfE15supercircle_sdfEDv2_fS4_fS4_(<2 x float> noundef %70, <2 x float> noundef %68, float noundef %71, <2 x float> noundef %72) #8
  %74 = extractelement <2 x float> %0, i64 0
  %75 = fcmp fast oge float %74, 0.000000e+00
  %76 = select fast i1 %75, float 1.000000e+00, float -1.000000e+00
  %77 = extractelement <2 x float> %0, i64 1
  %78 = fcmp fast oge float %77, 0.000000e+00
  %79 = select fast i1 %78, float 1.000000e+00, float -1.000000e+00
  %80 = insertelement <2 x float> undef, float %76, i64 0
  %81 = insertelement <2 x float> %80, float %79, i64 1
  %82 = shufflevector <3 x float> %73, <3 x float> poison, <2 x i32> <i32 1, i32 2>
  %83 = fmul fast <2 x float> %82, %81
  %84 = extractelement <3 x float> %73, i64 0
  %85 = extractelement <4 x float> %63, i64 0
  %86 = extractelement <4 x float> %63, i64 1
  %87 = fmul fast float %85, %77
  %88 = fdiv fast float %87, %86
  %89 = insertelement <2 x float> %0, float %88, i64 1
  %90 = tail call fast float @air.dot.v2f32(<2 x float> %89, <2 x float> %89) #7
  %91 = tail call fast float @air.fast_rsqrt.f32(float %90) #7
  %92 = insertelement <2 x float> poison, float %91, i64 0
  %93 = shufflevector <2 x float> %92, <2 x float> poison, <2 x i32> zeroinitializer
  %94 = fmul fast <2 x float> %93, %89
  %95 = shufflevector <4 x float> %63, <4 x float> undef, <2 x i32> <i32 3, i32 3>
  %96 = tail call fast <2 x float> @air.mix.v2f32(<2 x float> %83, <2 x float> %94, <2 x float> %95) #7
  %97 = tail call fast float @air.dot.v2f32(<2 x float> %96, <2 x float> %96) #7
  %98 = tail call fast float @air.fast_rsqrt.f32(float %97) #7
  %99 = insertelement <2 x float> poison, float %98, i64 0
  %100 = shufflevector <2 x float> %99, <2 x float> poison, <2 x i32> zeroinitializer
  %101 = fmul fast <2 x float> %100, %96
  %102 = extractelement <2 x float> %101, i64 0
  %103 = extractelement <4 x float> %65, i64 0
  %104 = fmul fast float %102, %103
  %105 = extractelement <2 x float> %101, i64 1
  %106 = extractelement <4 x float> %65, i64 1
  %107 = fmul fast float %105, %106
  %108 = fadd fast float %104, %107
  %109 = extractelement <4 x float> %65, i64 2
  %110 = fmul fast float %102, %109
  %111 = extractelement <4 x float> %65, i64 3
  %112 = fmul fast float %105, %111
  %113 = fadd fast float %110, %112
  %114 = insertelement <4 x float> <float poison, float poison, float poison, float 1.000000e+00>, float %84, i64 0
  %115 = insertelement <4 x float> %114, float %108, i64 1
  %116 = insertelement <4 x float> %115, float %113, i64 2
  br label %206

117:                                              ; preds = %60
  %118 = extractelement <4 x float> %67, i64 0
  %119 = extractelement <4 x float> %67, i64 3
  %120 = extractelement <4 x float> %67, i64 1
  %121 = shufflevector <4 x float> %67, <4 x float> undef, <4 x i32> <i32 0, i32 0, i32 3, i32 1>
  %122 = extractelement <4 x float> %67, i64 2
  %123 = shufflevector <4 x float> %67, <4 x float> undef, <4 x i32> <i32 1, i32 3, i32 2, i32 2>
  %124 = shufflevector <4 x float> %63, <4 x float> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %125 = fadd fast <4 x float> %121, %123
  %126 = fmul fast <4 x float> %125, splat (float 5.000000e-01)
  %127 = fdiv fast <4 x float> %124, %126
  %128 = fsub fast <4 x float> splat (float 0xBFF8756960000000), %127
  %129 = fmul fast <4 x float> %128, splat (float 0xBFFE43D180000000)
  %130 = tail call fast <4 x float> @air.fast_saturate.v4f32(<4 x float> %129) #7
  %131 = fcmp fast olt <4 x float> %126, zeroinitializer
  %132 = select reassoc nsz arcp contract afn <4 x i1> %131, <4 x float> %130, <4 x float> splat (float 1.000000e+00)
  %133 = extractelement <2 x float> %0, i64 0
  %134 = extractelement <2 x float> %0, i64 1
  %135 = shufflevector <2 x float> %0, <2 x float> undef, <2 x i32> <i32 0, i32 poison>
  %136 = shufflevector <4 x float> %132, <4 x float> poison, <2 x i32> <i32 0, i32 3>
  %137 = tail call fast fastcc <3 x float> @_ZN2CA3OGL5Metal12ShaderUtils_IfE15supercircle_sdfEDv2_fS4_fS4_(<2 x float> noundef %0, <2 x float> noundef %68, float noundef %120, <2 x float> noundef %136) #8
  %138 = fneg fast float %133
  %139 = insertelement <2 x float> undef, float %138, i64 0
  %140 = insertelement <2 x float> %0, float %138, i64 0
  %141 = shufflevector <4 x float> %132, <4 x float> poison, <2 x i32> <i32 0, i32 1>
  %142 = tail call fast fastcc <3 x float> @_ZN2CA3OGL5Metal12ShaderUtils_IfE15supercircle_sdfEDv2_fS4_fS4_(<2 x float> noundef %140, <2 x float> noundef %68, float noundef %118, <2 x float> noundef %141) #8
  %143 = extractelement <3 x float> %142, i64 0
  %144 = extractelement <3 x float> %137, i64 0
  %145 = fcmp fast ogt float %143, %144
  %146 = extractelement <3 x float> %142, i64 1
  %147 = fneg fast float %146
  %148 = insertelement <3 x float> %142, float %147, i64 1
  %149 = select i1 %145, <3 x float> %148, <3 x float> %137
  %150 = fneg fast float %134
  %151 = insertelement <2 x float> %135, float %150, i64 1
  %152 = shufflevector <4 x float> %132, <4 x float> poison, <2 x i32> <i32 2, i32 3>
  %153 = tail call fast fastcc <3 x float> @_ZN2CA3OGL5Metal12ShaderUtils_IfE15supercircle_sdfEDv2_fS4_fS4_(<2 x float> noundef %151, <2 x float> noundef %68, float noundef %122, <2 x float> noundef %152) #8
  %154 = extractelement <3 x float> %153, i64 0
  %155 = extractelement <3 x float> %149, i64 0
  %156 = fcmp fast ogt float %154, %155
  %157 = extractelement <3 x float> %153, i64 2
  %158 = fneg fast float %157
  %159 = insertelement <3 x float> %153, float %158, i64 2
  %160 = select i1 %156, <3 x float> %159, <3 x float> %149
  %161 = insertelement <2 x float> %139, float %150, i64 1
  %162 = shufflevector <4 x float> %132, <4 x float> poison, <2 x i32> <i32 2, i32 1>
  %163 = tail call fast fastcc <3 x float> @_ZN2CA3OGL5Metal12ShaderUtils_IfE15supercircle_sdfEDv2_fS4_fS4_(<2 x float> noundef %161, <2 x float> noundef %68, float noundef %119, <2 x float> noundef %162) #8
  %164 = extractelement <3 x float> %163, i64 0
  %165 = extractelement <3 x float> %160, i64 0
  %166 = fcmp fast ogt float %164, %165
  %167 = shufflevector <3 x float> %163, <3 x float> poison, <2 x i32> <i32 1, i32 2>
  %168 = fneg fast <2 x float> %167
  %169 = shufflevector <2 x float> %168, <2 x float> poison, <3 x i32> <i32 0, i32 1, i32 poison>
  %170 = shufflevector <3 x float> %163, <3 x float> %169, <3 x i32> <i32 0, i32 3, i32 4>
  %171 = select i1 %166, <3 x float> %170, <3 x float> %160
  %172 = extractelement <3 x float> %171, i64 0
  %173 = shufflevector <3 x float> %171, <3 x float> poison, <2 x i32> <i32 1, i32 2>
  %174 = extractelement <4 x float> %63, i64 0
  %175 = extractelement <4 x float> %63, i64 1
  %176 = fmul fast float %174, %134
  %177 = fdiv fast float %176, %175
  %178 = insertelement <2 x float> %135, float %177, i64 1
  %179 = tail call fast float @air.dot.v2f32(<2 x float> %178, <2 x float> %178) #7
  %180 = tail call fast float @air.fast_rsqrt.f32(float %179) #7
  %181 = insertelement <2 x float> poison, float %180, i64 0
  %182 = shufflevector <2 x float> %181, <2 x float> poison, <2 x i32> zeroinitializer
  %183 = fmul fast <2 x float> %182, %178
  %184 = shufflevector <4 x float> %63, <4 x float> undef, <2 x i32> <i32 3, i32 3>
  %185 = tail call fast <2 x float> @air.mix.v2f32(<2 x float> %173, <2 x float> %183, <2 x float> %184) #7
  %186 = tail call fast float @air.dot.v2f32(<2 x float> %185, <2 x float> %185) #7
  %187 = tail call fast float @air.fast_rsqrt.f32(float %186) #7
  %188 = insertelement <2 x float> poison, float %187, i64 0
  %189 = shufflevector <2 x float> %188, <2 x float> poison, <2 x i32> zeroinitializer
  %190 = fmul fast <2 x float> %189, %185
  %191 = extractelement <2 x float> %190, i64 0
  %192 = extractelement <4 x float> %65, i64 0
  %193 = fmul fast float %191, %192
  %194 = extractelement <2 x float> %190, i64 1
  %195 = extractelement <4 x float> %65, i64 1
  %196 = fmul fast float %194, %195
  %197 = fadd fast float %193, %196
  %198 = extractelement <4 x float> %65, i64 2
  %199 = fmul fast float %191, %198
  %200 = extractelement <4 x float> %65, i64 3
  %201 = fmul fast float %194, %200
  %202 = fadd fast float %199, %201
  %203 = insertelement <4 x float> <float poison, float poison, float poison, float 1.000000e+00>, float %172, i64 0
  %204 = insertelement <4 x float> %203, float %197, i64 1
  %205 = insertelement <4 x float> %204, float %202, i64 2
  br label %206

206:                                              ; preds = %117, %69, %6
  %207 = phi <4 x float> [ %59, %6 ], [ %116, %69 ], [ %205, %117 ]
  ret <4 x float> %207
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_rsqrt.f32(float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x float> @air.mix.v2f32(<2 x float>, <2 x float>, <2 x float>) local_unnamed_addr #2

; Function Attrs: inlinehint mustprogress nounwind
define internal fastcc <3 x float> @_ZN2CA3OGL5Metal12ShaderUtils_IfE15supercircle_sdfEDv2_fS4_fS4_(<2 x float> noundef %0, <2 x float> noundef %1, float noundef %2, <2 x float> noundef %3) unnamed_addr #6 align 2 {
  %5 = tail call fast float @air.fast_fabs.f32(float %2) #7
  %6 = fmul fast float %5, 0x3FF8756960000000
  %7 = extractelement <2 x float> %3, i64 0
  %8 = extractelement <2 x float> %3, i64 1
  %9 = tail call fast float @air.fast_fmax.f32(float %7, float %8) #7
  %10 = tail call fast float @air.mix.f32(float %6, float %5, float %9) #7
  %11 = fsub fast <2 x float> %0, %1
  %12 = insertelement <2 x float> poison, float %10, i64 0
  %13 = shufflevector <2 x float> %12, <2 x float> poison, <2 x i32> zeroinitializer
  %14 = fadd fast <2 x float> %13, %11
  %15 = extractelement <2 x float> %14, i64 0
  %16 = extractelement <2 x float> %14, i64 1
  %17 = insertelement <2 x float> poison, float %6, i64 0
  %18 = shufflevector <2 x float> %17, <2 x float> poison, <2 x i32> zeroinitializer
  %19 = fsub fast <2 x float> %0, %1
  %20 = fadd fast <2 x float> %19, %18
  %21 = fdiv fast <2 x float> %20, %18
  %22 = tail call fast <2 x float> @air.fast_fmax.v2f32(<2 x float> zeroinitializer, <2 x float> %21) #7
  %23 = tail call fast <2 x float> @air.fast_fabs.v2f32(<2 x float> %22) #7
  %24 = tail call fast float @air.dot.v2f32(<2 x float> %23, <2 x float> %23) #7
  %25 = tail call fast float @air.fast_sqrt.f32(float %24) #7
  %26 = extractelement <2 x float> %23, i64 0
  %27 = extractelement <2 x float> %23, i64 1
  %28 = tail call fast float @air.fast_fmax.f32(float %26, float %27) #7
  %29 = tail call fast float @air.fast_fmin.f32(float %26, float %27) #7
  %30 = fdiv fast float %29, %28
  %31 = tail call fast float @air.fast_saturate.f32(float %30) #7
  %32 = fcmp fast oeq float %28, 0.000000e+00
  %33 = select fast i1 %32, float 0.000000e+00, float %31
  %34 = fmul fast float %33, 0x3FEDA23C00000000
  %35 = fsub fast float 0x40093F8220000000, %34
  %36 = fmul fast float %35, %33
  %37 = fadd fast float %36, 0xC00D213800000000
  %38 = fmul fast float %37, %33
  %39 = fadd fast float %38, 0x3FF449D9E0000000
  %40 = fmul fast float %39, %33
  %41 = fadd fast float %40, 0x3FD12F9CA0000000
  %42 = fmul fast float %33, %33
  %43 = tail call fast float @air.fast_saturate.f32(float %25) #7
  %44 = fadd fast float %25, 1.000000e+00
  %45 = fmul fast float %42, %43
  %46 = fmul fast float %45, %41
  %47 = fsub fast float 1.000000e+00, %46
  %48 = fdiv fast float -1.000000e+00, %47
  %49 = fadd fast float %44, %48
  %50 = fmul fast <2 x float> %23, splat (float 0x3FF8756960000000)
  %51 = fadd fast <2 x float> %50, splat (float 0xBFE0EAD2E0000000)
  %52 = tail call fast <2 x float> @air.fast_fmax.v2f32(<2 x float> zeroinitializer, <2 x float> %51) #7
  %53 = tail call fast float @air.dot.v2f32(<2 x float> %52, <2 x float> %52) #7
  %54 = tail call fast float @air.fast_sqrt.f32(float %53) #7
  %55 = fmul fast float %54, 0x3FE4EEECA0000000
  %56 = fadd fast float %55, 0x3FD62226C0000000
  %57 = tail call fast float @air.mix.f32(float %49, float %56, float %7) #7
  %58 = tail call fast float @air.mix.f32(float %49, float %56, float %8) #7
  %59 = fcmp fast ogt float %27, %26
  %60 = select i1 %59, i32 1, i32 -1
  %61 = tail call fast float @air.convert.f.f32.s.i32(i32 %60) #7
  %62 = fmul fast float %61, %33
  %63 = fsub fast float 5.000000e-01, %61
  %64 = fadd fast float %63, %62
  %65 = tail call fast float @air.fast_saturate.f32(float %64) #7
  %66 = tail call fast float @air.mix.f32(float %57, float %58, float %65) #7
  %67 = fadd fast float %66, -1.000000e+00
  %68 = fptrunc float %67 to half
  %69 = tail call fast <2 x float> @air.fast_fmax.v2f32(<2 x float> zeroinitializer, <2 x float> %14) #7
  %70 = tail call fast float @air.dot.v2f32(<2 x float> %69, <2 x float> %69) #7
  %71 = tail call fast float @air.fast_rsqrt.f32(float %70) #7
  %72 = insertelement <2 x float> poison, float %71, i64 0
  %73 = shufflevector <2 x float> %72, <2 x float> poison, <2 x i32> zeroinitializer
  %74 = fmul fast <2 x float> %73, %69
  %75 = fcmp fast ogt float %15, %16
  %76 = select fast i1 %75, <2 x float> <float 1.000000e+00, float 0.000000e+00>, <2 x float> <float 0.000000e+00, float 1.000000e+00>
  %77 = fpext half %68 to float
  %78 = fmul fast float %6, %77
  %79 = tail call fast float @air.fast_fmax.f32(float %15, float %16) #7
  %80 = tail call fast float @air.fast_fmin.f32(float %79, float 0.000000e+00) #7
  %81 = extractelement <2 x float> %74, i64 0
  %82 = extractelement <2 x float> %74, i64 1
  %83 = fadd fast float %81, %82
  %84 = fcmp fast ogt float %83, 0.000000e+00
  %85 = select fast i1 %84, <2 x float> %74, <2 x float> %76
  %86 = fadd fast float %80, %78
  %87 = insertelement <3 x float> undef, float %86, i64 0
  %88 = shufflevector <2 x float> %85, <2 x float> poison, <3 x i32> <i32 0, i32 1, i32 poison>
  %89 = shufflevector <3 x float> %87, <3 x float> %88, <3 x i32> <i32 0, i32 3, i32 4>
  ret <3 x float> %89
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_fmin.f32(float, float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x float> @air.fast_fmax.v2f32(<2 x float>, <2 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.convert.f.f32.s.i32(i32) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x float> @air.fast_fabs.v2f32(<2 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_fabs.f32(float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <4 x float> @air.fast_saturate.v4f32(<4 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare i32 @air.convert.s.i32.f.f32(float) local_unnamed_addr #2

attributes #0 = { convergent mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { convergent nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #2 = { mustprogress nofree nosync nounwind willreturn memory(none) }
attributes #3 = { convergent mustprogress nofree nounwind willreturn memory(argmem: read) }
attributes #4 = { convergent mustprogress nounwind willreturn }
attributes #5 = { mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #6 = { inlinehint mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="96" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #7 = { nounwind willreturn memory(none) }
attributes #8 = { nobuiltin nounwind "no-builtins" }
attributes #9 = { convergent nobuiltin "no-builtins" }
attributes #10 = { convergent nounwind willreturn }
attributes #11 = { convergent nounwind willreturn memory(argmem: read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.fragment = !{!15}
!air.sampler_states = !{!28}

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
!15 = !{ptr @glass_foreground_sdf_lpf, !16, !18}
!16 = !{!17}
!17 = !{!"air.render_target", i32 0, i32 0, !"air.arg_type_name", !"float4"}
!18 = !{!19, !20, !21, !22, !23, !27}
!19 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"position", !"air.arg_unused"}
!20 = !{i32 1, !"air.fragment_input", !"generated(6sdf_uvDv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"sdf_uv"}
!21 = !{i32 2, !"air.fragment_input", !"generated(6src_uvDv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"src_uv"}
!22 = !{i32 3, !"air.texture", !"air.location_index", i32 3, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"source_texture"}
!23 = !{i32 4, !"air.buffer", !"air.buffer_size", i32 128, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.struct_type_info", !24, !"air.arg_type_size", i32 128, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"GlassForegroundSdfUniforms", !"air.arg_name", !"u"}
!24 = !{!"air.struct_type_info", !25, i32 0, i32 48, i32 0, !"SdfFragmentUniforms", !"sdf", !"air.struct_type_info", !26, i32 48, i32 80, i32 0, !"GlassForegroundUniforms", !"glass"}
!25 = !{i32 0, i32 16, i32 0, !"float4", !"arg", i32 16, i32 16, i32 0, !"float4", !"tr", i32 32, i32 16, i32 0, !"float4", !"arg2"}
!26 = !{i32 0, i32 16, i32 0, !"float4", !"displacement_mat", i32 16, i32 4, i32 0, !"float", !"refraction_amount", i32 20, i32 4, i32 0, !"float", !"inv_refraction_height", i32 24, i32 4, i32 0, !"float", !"refraction_offset", i32 28, i32 4, i32 0, !"float", !"aberration_amount", i32 32, i32 4, i32 0, !"float", !"inv_aberration_height", i32 36, i32 4, i32 0, !"float", !"aberration_offset", i32 40, i32 8, i32 0, !"float2", !"aberration_dir", i32 48, i32 4, i32 0, !"float", !"edge_start", i32 52, i32 4, i32 0, !"float", !"edge_end", i32 56, i32 4, i32 0, !"float", !"edge_opacity_start", i32 60, i32 4, i32 0, !"float", !"edge_opacity_end", i32 64, i32 8, i32 0, !"float2", !"refraction_dir"}
!27 = !{i32 5, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 6, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"edr_scale"}
!28 = !{!"air.sampler_state", ptr addrspace(2) @__air_sampler_state.4}
!29 = !{!30}
!30 = distinct !{!30, !31, !"air-alias-scope-arg(4)"}
!31 = distinct !{!31, !"air-alias-scopes(glass_foreground_sdf_lpf)"}
!32 = !{!33, !34}
!33 = distinct !{!33, !31, !"air-alias-scope-textures"}
!34 = distinct !{!34, !31, !"air-alias-scope-arg(5)"}
!35 = !{!36, !37, i64 16}
!36 = !{!"_ZTS23GlassForegroundUniforms", !37, i64 0, !37, i64 16, !37, i64 20, !37, i64 24, !37, i64 28, !37, i64 32, !37, i64 36, !37, i64 40, !37, i64 48, !37, i64 52, !37, i64 56, !37, i64 60, !37, i64 64}
!37 = !{!"float", !38, i64 0}
!38 = !{!"omnipotent char", !39, i64 0}
!39 = !{!"Simple C++ TBAA"}
!40 = !{!36, !37, i64 20}
!41 = !{!36, !37, i64 24}
!42 = !{!36, !37, i64 28}
!43 = !{!36, !37, i64 32}
!44 = !{!36, !37, i64 36}
!45 = distinct !{!45, !46}
!46 = !{!"llvm.loop.mustprogress"}
!47 = distinct !{!47, !46}
!48 = !{!37, !37, i64 0}
!49 = !{!36, !37, i64 56}
!50 = !{!36, !37, i64 60}
!51 = !{!36, !37, i64 48}
!52 = !{!36, !37, i64 52}
!53 = !{!38, !38, i64 0}
