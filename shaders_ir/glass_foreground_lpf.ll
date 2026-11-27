source_filename = "glass_foreground_lpf"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v29-apple-ios27.2.0"

%struct.GlassForegroundUniforms.39 = type { <4 x float>, float, float, float, float, float, float, <2 x float>, float, float, float, float, <2 x float>, [8 x i8] }

@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer
@__air_sampler_state.4 = internal addrspace(2) constant [2 x i64] [i64 34901797601036873, i64 0], align 8
@__air_sampler_state.1 = internal addrspace(2) constant [2 x i64] [i64 34901797601028681, i64 0], align 8

; Function Attrs: convergent mustprogress nounwind
define <4 x float> @glass_foreground_lpf(<4 x float> %0, <2 x float> %1, <2 x float> %2, ptr addrspace(1) nocapture readonly %3, ptr addrspace(1) nocapture readonly %4, ptr addrspace(2) nocapture noundef readonly align 16 dereferenceable(80) "air-buffer-no-alias" %5, ptr addrspace(2) nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %6) local_unnamed_addr #0 {
  %8 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %4, ptr addrspace(2) nocapture readonly @__air_sampler_state.1, <2 x float> %2, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #5
  %9 = extractvalue { <4 x float>, i8 } %8, 0
  %10 = tail call fast fastcc <4 x float> @_Z21glass_foreground_baseDv2_fDv4_fN5metal9texture2dIfLNS1_6accessE0ELNS1_16memory_coherenceE0EvEERU11MTLconstantK23GlassForegroundUniformsRU11MTLconstantKf(<2 x float> noundef %1, <4 x float> noundef %9, ptr addrspace(1) %3, ptr addrspace(2) noundef align 16 dereferenceable(80) %5, ptr addrspace(2) noundef align 4 dereferenceable(4) %6) #6
  ret <4 x float> %10
}

; Function Attrs: convergent nounwind
define internal fastcc <4 x float> @_Z21glass_foreground_baseDv2_fDv4_fN5metal9texture2dIfLNS1_6accessE0ELNS1_16memory_coherenceE0EvEERU11MTLconstantK23GlassForegroundUniformsRU11MTLconstantKf(<2 x float> noundef %0, <4 x float> noundef %1, ptr addrspace(1) nocapture readonly %2, ptr addrspace(2) nocapture noundef readonly align 16 dereferenceable(80) %3, ptr addrspace(2) nocapture noundef readonly align 4 dereferenceable(4) %4) unnamed_addr #1 {
  %6 = extractelement <4 x float> %1, i64 0
  %7 = tail call fast float @air.fwidth.f32(float %6) #7
  %8 = extractelement <4 x float> %1, i64 3
  %9 = fcmp fast olt float %8, 0x3F50624DE0000000
  br i1 %9, label %200, label %10

10:                                               ; preds = %5
  %11 = tail call fast float @air.fast_fmax.f32(float %7, float 0x3F1A36E2E0000000) #8
  %12 = fdiv fast float %6, %11
  %13 = fsub fast float 5.000000e-01, %12
  %14 = tail call fast float @air.fast_saturate.f32(float %13) #8
  %15 = fneg fast float %6
  %16 = shufflevector <4 x float> %1, <4 x float> poison, <2 x i32> <i32 1, i32 2>
  %17 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 0
  %18 = load <4 x float>, ptr addrspace(2) %17, align 16
  %19 = shufflevector <4 x float> %18, <4 x float> poison, <2 x i32> <i32 0, i32 1>
  %20 = shufflevector <4 x float> %18, <4 x float> poison, <2 x i32> <i32 2, i32 3>
  %21 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 12
  %22 = load <2 x float>, ptr addrspace(2) %21, align 16
  %23 = tail call fast float @air.dot.v2f32(<2 x float> %19, <2 x float> %22) #8
  %24 = insertelement <2 x float> undef, float %23, i64 0
  %25 = extractelement <4 x float> %18, i64 1
  %26 = extractelement <2 x float> %22, i64 0
  %27 = fmul fast float %26, %25
  %28 = extractelement <4 x float> %18, i64 0
  %29 = extractelement <2 x float> %22, i64 1
  %30 = fmul fast float %29, %28
  %31 = fsub fast float %27, %30
  %32 = insertelement <2 x float> %24, float %31, i64 1
  %33 = tail call fast float @air.dot.v2f32(<2 x float> %20, <2 x float> %22) #8
  %34 = insertelement <2 x float> undef, float %33, i64 0
  %35 = extractelement <4 x float> %18, i64 3
  %36 = fmul fast float %26, %35
  %37 = extractelement <4 x float> %18, i64 2
  %38 = fmul fast float %29, %37
  %39 = fsub fast float %36, %38
  %40 = insertelement <2 x float> %34, float %39, i64 1
  %41 = tail call fast float @air.dot.v2f32(<2 x float> %32, <2 x float> %16) #8
  %42 = insertelement <2 x float> undef, float %41, i64 0
  %43 = tail call fast float @air.dot.v2f32(<2 x float> %40, <2 x float> %16) #8
  %44 = insertelement <2 x float> %42, float %43, i64 1
  %45 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 1
  %46 = load float, ptr addrspace(2) %45, align 16, !tbaa !29
  %47 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 2
  %48 = load float, ptr addrspace(2) %47, align 4, !tbaa !34
  %49 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 3
  %50 = load float, ptr addrspace(2) %49, align 8, !tbaa !35
  %51 = fsub fast float %15, %50
  %52 = fmul fast float %51, %48
  %53 = tail call fast float @air.fast_saturate.f32(float %52) #8
  %54 = fsub fast float 2.000000e+00, %53
  %55 = fmul fast float %54, %53
  %56 = tail call fast float @air.fast_sqrt.f32(float %55) #8
  %57 = tail call fast float @air.fast_saturate.f32(float %56) #8
  %58 = fmul fast float %57, %46
  %59 = fsub fast float %46, %58
  %60 = insertelement <2 x float> poison, float %59, i64 0
  %61 = shufflevector <2 x float> %60, <2 x float> poison, <2 x i32> zeroinitializer
  %62 = fmul fast <2 x float> %61, %44
  %63 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 7
  %64 = load <2 x float>, ptr addrspace(2) %63, align 8
  %65 = tail call fast float @air.dot.v2f32(<2 x float> %19, <2 x float> %64) #8
  %66 = insertelement <2 x float> undef, float %65, i64 0
  %67 = extractelement <2 x float> %64, i64 0
  %68 = fmul fast float %67, %25
  %69 = extractelement <2 x float> %64, i64 1
  %70 = fmul fast float %69, %28
  %71 = fsub fast float %68, %70
  %72 = insertelement <2 x float> %66, float %71, i64 1
  %73 = tail call fast float @air.dot.v2f32(<2 x float> %20, <2 x float> %64) #8
  %74 = insertelement <2 x float> undef, float %73, i64 0
  %75 = fmul fast float %67, %35
  %76 = fmul fast float %69, %37
  %77 = fsub fast float %75, %76
  %78 = insertelement <2 x float> %74, float %77, i64 1
  %79 = tail call fast float @air.dot.v2f32(<2 x float> %72, <2 x float> %16) #8
  %80 = insertelement <2 x float> undef, float %79, i64 1
  %81 = tail call fast float @air.dot.v2f32(<2 x float> %78, <2 x float> %16) #8
  %82 = insertelement <2 x float> %80, float %81, i64 0
  %83 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 4
  %84 = load float, ptr addrspace(2) %83, align 4, !tbaa !36
  %85 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 5
  %86 = load float, ptr addrspace(2) %85, align 16, !tbaa !37
  %87 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 6
  %88 = load float, ptr addrspace(2) %87, align 4, !tbaa !38
  %89 = fsub fast float %15, %88
  %90 = fmul fast float %89, %86
  %91 = tail call fast float @air.fast_saturate.f32(float %90) #8
  %92 = fsub fast float 2.000000e+00, %91
  %93 = fmul fast float %92, %91
  %94 = tail call fast float @air.fast_sqrt.f32(float %93) #8
  %95 = tail call fast float @air.fast_saturate.f32(float %94) #8
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
  %110 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %2, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %109, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #5
  %111 = extractvalue { <4 x float>, i8 } %110, 0
  %112 = extractelement <4 x float> %111, i64 3
  %113 = tail call fast float @air.fast_fmax.f32(float %112, float 0x3EB0C6F7A0000000) #8
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
  br i1 %134, label %135, label %102, !llvm.loop !39

135:                                              ; preds = %135, %102
  %136 = phi <4 x float> [ %164, %135 ], [ %131, %102 ]
  %137 = phi float [ %165, %135 ], [ 0.000000e+00, %102 ]
  %138 = phi i32 [ %166, %135 ], [ 0, %102 ]
  %139 = insertelement <2 x float> poison, float %137, i64 0
  %140 = shufflevector <2 x float> %139, <2 x float> poison, <2 x i32> zeroinitializer
  %141 = fmul fast <2 x float> %140, %100
  %142 = fsub fast <2 x float> %101, %141
  %143 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %2, ptr addrspace(2) nocapture readonly @__air_sampler_state.4, <2 x float> %142, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #5
  %144 = extractvalue { <4 x float>, i8 } %143, 0
  %145 = extractelement <4 x float> %144, i64 3
  %146 = tail call fast float @air.fast_fmax.f32(float %145, float 0x3EB0C6F7A0000000) #8
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
  br i1 %167, label %168, label %135, !llvm.loop !41

168:                                              ; preds = %135
  %169 = shufflevector <4 x float> %161, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %170 = fmul fast <3 x float> %169, <float 5.000000e-01, float 0x3FD5555560000000, float 5.000000e-01>
  %171 = fmul fast float %8, 0x3FC24924A0000000
  %172 = fmul fast float %171, %14
  %173 = fmul fast float %172, %163
  %174 = load float, ptr addrspace(2) %4, align 4, !tbaa !42
  %175 = fmul fast float %173, %174
  %176 = insertelement <3 x float> poison, float %175, i64 0
  %177 = shufflevector <3 x float> %176, <3 x float> poison, <3 x i32> zeroinitializer
  %178 = fmul fast <3 x float> %170, %177
  %179 = shufflevector <3 x float> %178, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %180 = insertelement <4 x float> %179, float %173, i64 3
  %181 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 10
  %182 = load float, ptr addrspace(2) %181, align 8, !tbaa !43
  %183 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 11
  %184 = load float, ptr addrspace(2) %183, align 4, !tbaa !44
  %185 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 8
  %186 = load float, ptr addrspace(2) %185, align 16, !tbaa !45
  %187 = getelementptr inbounds %struct.GlassForegroundUniforms.39, ptr addrspace(2) %3, i64 0, i32 9
  %188 = load float, ptr addrspace(2) %187, align 4, !tbaa !46
  %189 = fsub fast float %188, %186
  %190 = fdiv fast float 1.000000e+00, %189
  %191 = fneg fast float %186
  %192 = fdiv fast float %191, %189
  %193 = tail call fast float @air.fma.f32(float %6, float %190, float %192) #8
  %194 = tail call fast float @air.fast_saturate.f32(float %193) #8
  %195 = tail call fast float @air.mix.f32(float %182, float %184, float %194) #8
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

attributes #0 = { convergent mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { convergent nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #2 = { mustprogress nofree nosync nounwind willreturn memory(none) }
attributes #3 = { convergent mustprogress nofree nounwind willreturn memory(argmem: read) }
attributes #4 = { convergent mustprogress nounwind willreturn }
attributes #5 = { convergent nounwind willreturn memory(argmem: read) }
attributes #6 = { convergent nobuiltin "no-builtins" }
attributes #7 = { convergent nounwind willreturn }
attributes #8 = { nounwind willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.fragment = !{!15}
!air.sampler_states = !{!27, !28}

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
!15 = !{ptr @glass_foreground_lpf, !16, !18}
!16 = !{!17}
!17 = !{!"air.render_target", i32 0, i32 0, !"air.arg_type_name", !"float4"}
!18 = !{!19, !20, !21, !22, !23, !24, !26}
!19 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"position", !"air.arg_unused"}
!20 = !{i32 1, !"air.fragment_input", !"generated(9texcoord0Dv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"texcoord0"}
!21 = !{i32 2, !"air.fragment_input", !"generated(9texcoord1Dv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"texcoord1"}
!22 = !{i32 3, !"air.texture", !"air.location_index", i32 3, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"source_texture"}
!23 = !{i32 4, !"air.texture", !"air.location_index", i32 4, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"sdf_texture"}
!24 = !{i32 5, !"air.buffer", !"air.buffer_size", i32 80, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.struct_type_info", !25, !"air.arg_type_size", i32 80, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"GlassForegroundUniforms", !"air.arg_name", !"u"}
!25 = !{i32 0, i32 16, i32 0, !"float4", !"displacement_mat", i32 16, i32 4, i32 0, !"float", !"refraction_amount", i32 20, i32 4, i32 0, !"float", !"inv_refraction_height", i32 24, i32 4, i32 0, !"float", !"refraction_offset", i32 28, i32 4, i32 0, !"float", !"aberration_amount", i32 32, i32 4, i32 0, !"float", !"inv_aberration_height", i32 36, i32 4, i32 0, !"float", !"aberration_offset", i32 40, i32 8, i32 0, !"float2", !"aberration_dir", i32 48, i32 4, i32 0, !"float", !"edge_start", i32 52, i32 4, i32 0, !"float", !"edge_end", i32 56, i32 4, i32 0, !"float", !"edge_opacity_start", i32 60, i32 4, i32 0, !"float", !"edge_opacity_end", i32 64, i32 8, i32 0, !"float2", !"refraction_dir"}
!26 = !{i32 6, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 6, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"edr_scale"}
!27 = !{!"air.sampler_state", ptr addrspace(2) @__air_sampler_state.4}
!28 = !{!"air.sampler_state", ptr addrspace(2) @__air_sampler_state.1}
!29 = !{!30, !31, i64 16}
!30 = !{!"_ZTS23GlassForegroundUniforms", !31, i64 0, !31, i64 16, !31, i64 20, !31, i64 24, !31, i64 28, !31, i64 32, !31, i64 36, !31, i64 40, !31, i64 48, !31, i64 52, !31, i64 56, !31, i64 60, !31, i64 64}
!31 = !{!"float", !32, i64 0}
!32 = !{!"omnipotent char", !33, i64 0}
!33 = !{!"Simple C++ TBAA"}
!34 = !{!30, !31, i64 20}
!35 = !{!30, !31, i64 24}
!36 = !{!30, !31, i64 28}
!37 = !{!30, !31, i64 32}
!38 = !{!30, !31, i64 36}
!39 = distinct !{!39, !40}
!40 = !{!"llvm.loop.mustprogress"}
!41 = distinct !{!41, !40}
!42 = !{!31, !31, i64 0}
!43 = !{!30, !31, i64 56}
!44 = !{!30, !31, i64 60}
!45 = !{!30, !31, i64 48}
!46 = !{!30, !31, i64 52}
