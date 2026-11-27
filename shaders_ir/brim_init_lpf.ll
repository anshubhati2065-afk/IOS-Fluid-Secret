source_filename = "brim_init_lpf"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v29-apple-ios27.2.0"

%struct.ResolveBlurWeightUniforms.9 = type { float }

@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer
@__air_sampler_state.3 = internal addrspace(2) constant [2 x i64] [i64 34901797601017856, i64 0], align 8

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(read)
define <2 x i32> @brim_init_lpf(<4 x float> %0, <4 x float> %1, <2 x float> %2, ptr addrspace(1) %3, ptr addrspace(2) nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %4) local_unnamed_addr #0 {
  %6 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) nocapture readonly @__air_sampler_state.3, <2 x float> %2, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #3
  %7 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) nocapture readonly @__air_sampler_state.3, <2 x float> %2, i1 true, <2 x i32> <i32 -1, i32 0>, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #3
  %8 = extractvalue { <4 x float>, i8 } %7, 0
  %9 = extractelement <4 x float> %8, i64 3
  %10 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) nocapture readonly @__air_sampler_state.3, <2 x float> %2, i1 true, <2 x i32> <i32 1, i32 0>, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #3
  %11 = extractvalue { <4 x float>, i8 } %10, 0
  %12 = extractelement <4 x float> %11, i64 3
  %13 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) nocapture readonly @__air_sampler_state.3, <2 x float> %2, i1 true, <2 x i32> <i32 0, i32 -1>, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #3
  %14 = extractvalue { <4 x float>, i8 } %13, 0
  %15 = extractelement <4 x float> %14, i64 3
  %16 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) nocapture readonly @__air_sampler_state.3, <2 x float> %2, i1 true, <2 x i32> <i32 0, i32 1>, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #3
  %17 = extractvalue { <4 x float>, i8 } %16, 0
  %18 = extractelement <4 x float> %17, i64 3
  %19 = tail call fast float @air.fast_fmin.f32(float %9, float %12) #4
  %20 = tail call fast float @air.fast_fmin.f32(float %15, float %18) #4
  %21 = tail call fast float @air.fast_fmin.f32(float %19, float %20) #4
  %22 = getelementptr inbounds %struct.ResolveBlurWeightUniforms.9, ptr addrspace(2) %4, i64 0, i32 0
  %23 = load float, ptr addrspace(2) %22, align 4, !tbaa !26, !alias.scope !31, !noalias !34
  %24 = fcmp fast ole float %21, %23
  %25 = extractvalue { <4 x float>, i8 } %6, 0
  %26 = extractelement <4 x float> %25, i64 3
  %27 = fcmp fast ogt float %26, %23
  %28 = select i1 %24, i1 %27, i1 false
  br i1 %28, label %29, label %33

29:                                               ; preds = %5
  %30 = shufflevector <4 x float> %0, <4 x float> poison, <2 x i32> <i32 0, i32 1>
  %31 = tail call fast <2 x float> @air.fast_floor.v2f32(<2 x float> %30) #4
  %32 = tail call <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float> %31) #4
  br label %33

33:                                               ; preds = %29, %5
  %34 = phi <2 x i32> [ %32, %29 ], [ zeroinitializer, %5 ]
  ret <2 x i32> %34
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float>) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x float> @air.fast_floor.v2f32(<2 x float>) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_fmin.f32(float, float) local_unnamed_addr #1

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(argmem: read)
declare { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly, ptr addrspace(2) nocapture readonly, <2 x float>, i1, <2 x i32>, i1, float, float, i32) local_unnamed_addr #2

attributes #0 = { convergent mustprogress nofree nounwind willreturn memory(read) "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { mustprogress nofree nosync nounwind willreturn memory(none) }
attributes #2 = { convergent mustprogress nofree nounwind willreturn memory(argmem: read) }
attributes #3 = { convergent nounwind willreturn memory(argmem: read) }
attributes #4 = { nounwind willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.fragment = !{!15}
!air.sampler_states = !{!25}

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
!15 = !{ptr @brim_init_lpf, !16, !18}
!16 = !{!17}
!17 = !{!"air.render_target", i32 0, i32 0, !"air.arg_type_name", !"uint2"}
!18 = !{!19, !20, !21, !22, !23}
!19 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"position"}
!20 = !{i32 1, !"air.fragment_input", !"generated(5colorDv4_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"color", !"air.arg_unused"}
!21 = !{i32 2, !"air.fragment_input", !"generated(11texcoord0_0Dv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"texcoord0_0"}
!22 = !{i32 3, !"air.texture", !"air.location_index", i32 3, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"surf"}
!23 = !{i32 4, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.struct_type_info", !24, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"BrimInitUniforms", !"air.arg_name", !"u"}
!24 = !{i32 0, i32 4, i32 0, !"float", !"alpha_threshold"}
!25 = !{!"air.sampler_state", ptr addrspace(2) @__air_sampler_state.3}
!26 = !{!27, !28, i64 0}
!27 = !{!"_ZTS16BrimInitUniforms", !28, i64 0}
!28 = !{!"float", !29, i64 0}
!29 = !{!"omnipotent char", !30, i64 0}
!30 = !{!"Simple C++ TBAA"}
!31 = !{!32}
!32 = distinct !{!32, !33, !"air-alias-scope-arg(4)"}
!33 = distinct !{!33, !"air-alias-scopes(brim_init_lpf)"}
!34 = !{!35}
!35 = distinct !{!35, !33, !"air-alias-scope-textures"}
