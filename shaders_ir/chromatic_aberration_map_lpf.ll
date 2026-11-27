source_filename = "chromatic_aberration_map_lpf"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v29-apple-ios27.2.0"

%struct.DisplacementMapUniforms.22 = type { <4 x float>, <2 x float>, <2 x float> }

@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer
@__air_sampler_state.1 = internal addrspace(2) constant [2 x i64] [i64 34901797601028681, i64 0], align 8

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(read)
define <4 x float> @chromatic_aberration_map_lpf(<4 x float> %0, <2 x float> %1, <2 x float> %2, ptr addrspace(1) %3, ptr addrspace(1) nocapture readonly %4, ptr addrspace(2) nocapture noundef readonly align 16 dereferenceable(32) "air-buffer-no-alias" %5, ptr addrspace(2) nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %6) local_unnamed_addr #0 {
  %8 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %4, ptr addrspace(2) nocapture readonly @__air_sampler_state.1, <2 x float> %2, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #3
  %9 = extractvalue { <4 x float>, i8 } %8, 0
  %10 = shufflevector <4 x float> %9, <4 x float> poison, <2 x i32> <i32 0, i32 1>
  %11 = getelementptr inbounds %struct.DisplacementMapUniforms.22, ptr addrspace(2) %5, i64 0, i32 2
  %12 = load <2 x float>, ptr addrspace(2) %11, align 8, !tbaa !28, !alias.scope !31, !noalias !34
  %13 = fsub fast <2 x float> %10, %12
  %14 = getelementptr inbounds %struct.DisplacementMapUniforms.22, ptr addrspace(2) %5, i64 0, i32 0
  %15 = load <4 x float>, ptr addrspace(2) %14, align 16, !alias.scope !31, !noalias !34
  %16 = shufflevector <4 x float> %15, <4 x float> poison, <2 x i32> <i32 0, i32 1>
  %17 = tail call fast float @air.dot.v2f32(<2 x float> %13, <2 x float> %16) #4
  %18 = insertelement <2 x float> undef, float %17, i64 0
  %19 = shufflevector <4 x float> %15, <4 x float> poison, <2 x i32> <i32 2, i32 3>
  %20 = tail call fast float @air.dot.v2f32(<2 x float> %13, <2 x float> %19) #4
  %21 = insertelement <2 x float> %18, float %20, i64 1
  %22 = fadd fast <2 x float> %21, %1
  %23 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) nocapture readonly @__air_sampler_state.1, <2 x float> %22, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #3
  %24 = extractvalue { <4 x float>, i8 } %23, 0
  %25 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) nocapture readonly @__air_sampler_state.1, <2 x float> %1, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #3
  %26 = extractvalue { <4 x float>, i8 } %25, 0
  %27 = fsub fast <2 x float> %1, %21
  %28 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) nocapture readonly @__air_sampler_state.1, <2 x float> %27, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #3
  %29 = extractvalue { <4 x float>, i8 } %28, 0
  %30 = extractelement <4 x float> %24, i64 0
  %31 = extractelement <4 x float> %24, i64 3
  %32 = tail call fast float @air.fast_fmax.f32(float %31, float 0x3EB0C6F7A0000000) #4
  %33 = fdiv fast float %30, %32
  %34 = insertelement <3 x float> undef, float %33, i64 0
  %35 = extractelement <4 x float> %26, i64 1
  %36 = extractelement <4 x float> %26, i64 3
  %37 = tail call fast float @air.fast_fmax.f32(float %36, float 0x3EB0C6F7A0000000) #4
  %38 = fdiv fast float %35, %37
  %39 = insertelement <3 x float> %34, float %38, i64 1
  %40 = fadd fast float %36, %31
  %41 = extractelement <4 x float> %29, i64 2
  %42 = extractelement <4 x float> %29, i64 3
  %43 = tail call fast float @air.fast_fmax.f32(float %42, float 0x3EB0C6F7A0000000) #4
  %44 = fdiv fast float %41, %43
  %45 = insertelement <3 x float> %39, float %44, i64 2
  %46 = fadd fast float %40, %42
  %47 = extractelement <4 x float> %9, i64 2
  %48 = fmul fast float %47, 0x3FD5555560000000
  %49 = fmul fast float %48, %46
  %50 = load float, ptr addrspace(2) %6, align 4, !tbaa !37, !alias.scope !39, !noalias !40
  %51 = fmul fast float %49, %50
  %52 = insertelement <3 x float> poison, float %51, i64 0
  %53 = shufflevector <3 x float> %52, <3 x float> poison, <3 x i32> zeroinitializer
  %54 = fmul fast <3 x float> %53, %45
  %55 = shufflevector <3 x float> %54, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %56 = insertelement <4 x float> %55, float %49, i64 3
  ret <4 x float> %56
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_fmax.f32(float, float) local_unnamed_addr #1

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(argmem: read)
declare { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly, ptr addrspace(2) nocapture readonly, <2 x float>, i1, <2 x i32>, i1, float, float, i32) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.dot.v2f32(<2 x float>, <2 x float>) local_unnamed_addr #1

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
!air.sampler_states = !{!27}

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
!15 = !{ptr @chromatic_aberration_map_lpf, !16, !18}
!16 = !{!17}
!17 = !{!"air.render_target", i32 0, i32 0, !"air.arg_type_name", !"float4"}
!18 = !{!19, !20, !21, !22, !23, !24, !26}
!19 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"position", !"air.arg_unused"}
!20 = !{i32 1, !"air.fragment_input", !"generated(9texcoord0Dv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"texcoord0"}
!21 = !{i32 2, !"air.fragment_input", !"generated(9texcoord1Dv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"texcoord1"}
!22 = !{i32 3, !"air.texture", !"air.location_index", i32 3, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"source_texture"}
!23 = !{i32 4, !"air.texture", !"air.location_index", i32 4, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"mask_texture"}
!24 = !{i32 5, !"air.buffer", !"air.buffer_size", i32 32, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.struct_type_info", !25, !"air.arg_type_size", i32 32, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"DisplacementMapUniforms", !"air.arg_name", !"u"}
!25 = !{i32 0, i32 16, i32 0, !"float4", !"mat", i32 16, i32 8, i32 0, !"float2", !"clamp", i32 24, i32 8, i32 0, !"float2", !"offset"}
!26 = !{i32 6, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 6, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"edr_scale"}
!27 = !{!"air.sampler_state", ptr addrspace(2) @__air_sampler_state.1}
!28 = !{!29, !29, i64 0}
!29 = !{!"omnipotent char", !30, i64 0}
!30 = !{!"Simple C++ TBAA"}
!31 = !{!32}
!32 = distinct !{!32, !33, !"air-alias-scope-arg(5)"}
!33 = distinct !{!33, !"air-alias-scopes(chromatic_aberration_map_lpf)"}
!34 = !{!35, !36}
!35 = distinct !{!35, !33, !"air-alias-scope-textures"}
!36 = distinct !{!36, !33, !"air-alias-scope-arg(6)"}
!37 = !{!38, !38, i64 0}
!38 = !{!"float", !29, i64 0}
!39 = !{!36}
!40 = !{!35, !32}
