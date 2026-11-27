source_filename = "sdf_filter_vert_lpf"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v29-apple-ios27.2.0"

%"struct.metal::matrix.6" = type { [4 x <4 x float>] }

@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define <{ <4 x float>, <2 x float>, <2 x float> }> @sdf_filter_vert_lpf(<4 x float> %0, <2 x float> %1, <2 x float> %2, ptr addrspace(2) nocapture noundef readonly "air-buffer-no-alias" %3, ptr addrspace(2) nocapture noundef readnone "air-buffer-no-alias" %4) local_unnamed_addr #0 {
  %6 = getelementptr inbounds %"struct.metal::matrix.6", ptr addrspace(2) %3, i64 0, i32 0, i64 0
  %7 = load <4 x float>, ptr addrspace(2) %6, align 16, !tbaa !26, !alias.scope !30
  %8 = shufflevector <4 x float> %0, <4 x float> poison, <4 x i32> zeroinitializer
  %9 = fmul fast <4 x float> %7, %8
  %10 = getelementptr inbounds %"struct.metal::matrix.6", ptr addrspace(2) %3, i64 0, i32 0, i64 1
  %11 = load <4 x float>, ptr addrspace(2) %10, align 16, !tbaa !26, !alias.scope !30
  %12 = shufflevector <4 x float> %0, <4 x float> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %13 = fmul fast <4 x float> %11, %12
  %14 = fadd fast <4 x float> %13, %9
  %15 = getelementptr inbounds %"struct.metal::matrix.6", ptr addrspace(2) %3, i64 0, i32 0, i64 2
  %16 = load <4 x float>, ptr addrspace(2) %15, align 16, !tbaa !26, !alias.scope !30
  %17 = shufflevector <4 x float> %0, <4 x float> undef, <4 x i32> <i32 2, i32 2, i32 2, i32 2>
  %18 = fmul fast <4 x float> %16, %17
  %19 = fadd fast <4 x float> %14, %18
  %20 = getelementptr inbounds %"struct.metal::matrix.6", ptr addrspace(2) %3, i64 0, i32 0, i64 3
  %21 = load <4 x float>, ptr addrspace(2) %20, align 16, !tbaa !26, !alias.scope !30
  %22 = shufflevector <4 x float> %0, <4 x float> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %23 = fmul fast <4 x float> %21, %22
  %24 = fadd fast <4 x float> %19, %23
  %25 = insertvalue <{ <4 x float>, <2 x float>, <2 x float> }> undef, <4 x float> %24, 0
  %26 = insertvalue <{ <4 x float>, <2 x float>, <2 x float> }> %25, <2 x float> %1, 1
  %27 = insertvalue <{ <4 x float>, <2 x float>, <2 x float> }> %26, <2 x float> %2, 2
  ret <{ <4 x float>, <2 x float>, <2 x float> }> %27
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.vertex = !{!15}

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
!15 = !{ptr @sdf_filter_vert_lpf, !16, !20}
!16 = !{!17, !18, !19}
!17 = !{!"air.position", !"air.arg_type_name", !"float4", !"air.arg_name", !"position"}
!18 = !{!"air.vertex_output", !"generated(6sdf_uvDv2_f)", !"air.arg_type_name", !"float2", !"air.arg_name", !"sdf_uv"}
!19 = !{!"air.vertex_output", !"generated(6src_uvDv2_f)", !"air.arg_type_name", !"float2", !"air.arg_name", !"src_uv"}
!20 = !{!21, !22, !23, !24, !25}
!21 = !{i32 0, !"air.vertex_input", !"air.location_index", i32 0, i32 1, !"air.arg_type_name", !"float4", !"air.arg_name", !"position"}
!22 = !{i32 1, !"air.vertex_input", !"air.location_index", i32 1, i32 1, !"air.arg_type_name", !"float2", !"air.arg_name", !"sdf_uv"}
!23 = !{i32 2, !"air.vertex_input", !"air.location_index", i32 2, i32 1, !"air.arg_type_name", !"float2", !"air.arg_name", !"src_uv"}
!24 = !{i32 3, !"air.buffer", !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 64, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"float4x4", !"air.arg_name", !"mvp_matrix"}
!25 = !{i32 4, !"air.buffer", !"air.location_index", i32 3, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 16, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"float4", !"air.arg_name", !"texmat", !"air.arg_unused"}
!26 = !{!27, !27, i64 0}
!27 = !{!"float", !28, i64 0}
!28 = !{!"omnipotent char", !29, i64 0}
!29 = !{!"Simple C++ TBAA"}
!30 = !{!31}
!31 = distinct !{!31, !32, !"air-alias-scope-arg(3)"}
!32 = distinct !{!32, !"air-alias-scopes(sdf_filter_vert_lpf)"}
