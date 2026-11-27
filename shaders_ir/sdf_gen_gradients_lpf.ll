source_filename = "sdf_gen_gradients_lpf"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v29-apple-ios27.2.0"

@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer

; Function Attrs: mustprogress nofree nounwind willreturn memory(read)
define <4 x float> @sdf_gen_gradients_lpf(<4 x float> %0, <2 x float> %1, <2 x float> %2, ptr addrspace(1) nocapture readonly %3, ptr addrspace(1) %4, ptr addrspace(2) nocapture noundef readonly align 16 dereferenceable(16) "air-buffer-no-alias" %5) local_unnamed_addr #0 {
  %7 = shufflevector <4 x float> %0, <4 x float> poison, <2 x i32> <i32 0, i32 1>
  %8 = tail call <2 x i32> @air.convert.s.v2i32.f.v2f32(<2 x float> %7) #4
  %9 = tail call ptr addrspace(2) @air.get_read_sampler() #5
  %10 = tail call { <4 x float>, i8 } @air.read_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) %9, <2 x i32> %8, <2 x i32> zeroinitializer, i32 0, i32 0) #6
  %11 = extractvalue { <4 x float>, i8 } %10, 0
  %12 = extractelement <4 x float> %11, i64 0
  %13 = add <2 x i32> %8, <i32 -1, i32 0>
  %14 = tail call { <4 x float>, i8 } @air.read_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %4, ptr addrspace(2) %9, <2 x i32> %13, <2 x i32> zeroinitializer, i32 0, i32 0) #6
  %15 = extractvalue { <4 x float>, i8 } %14, 0
  %16 = extractelement <4 x float> %15, i64 0
  %17 = add <2 x i32> %8, <i32 1, i32 0>
  %18 = tail call { <4 x float>, i8 } @air.read_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %4, ptr addrspace(2) %9, <2 x i32> %17, <2 x i32> zeroinitializer, i32 0, i32 0) #6
  %19 = extractvalue { <4 x float>, i8 } %18, 0
  %20 = extractelement <4 x float> %19, i64 0
  %21 = add <2 x i32> %8, <i32 0, i32 -1>
  %22 = tail call { <4 x float>, i8 } @air.read_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %4, ptr addrspace(2) %9, <2 x i32> %21, <2 x i32> zeroinitializer, i32 0, i32 0) #6
  %23 = extractvalue { <4 x float>, i8 } %22, 0
  %24 = extractelement <4 x float> %23, i64 0
  %25 = add <2 x i32> %8, <i32 0, i32 1>
  %26 = tail call { <4 x float>, i8 } @air.read_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %4, ptr addrspace(2) %9, <2 x i32> %25, <2 x i32> zeroinitializer, i32 0, i32 0) #6
  %27 = extractvalue { <4 x float>, i8 } %26, 0
  %28 = extractelement <4 x float> %27, i64 0
  %29 = fsub fast float %20, %16
  %30 = insertelement <2 x float> undef, float %29, i64 0
  %31 = fsub fast float %24, %28
  %32 = insertelement <2 x float> %30, float %31, i64 1
  %33 = tail call fast float @air.dot.v2f32(<2 x float> %32, <2 x float> %32) #4
  %34 = tail call fast float @air.fast_rsqrt.f32(float %33) #4
  %35 = insertelement <2 x float> poison, float %34, i64 0
  %36 = shufflevector <2 x float> %35, <2 x float> poison, <2 x i32> zeroinitializer
  %37 = fmul fast <2 x float> %32, %36
  %38 = load <4 x float>, ptr addrspace(2) %5, align 16, !alias.scope !25, !noalias !28
  %39 = extractelement <4 x float> %38, i64 0
  %40 = fmul fast float %39, %12
  %41 = extractelement <4 x float> %38, i64 1
  %42 = fadd fast float %40, %41
  %43 = shufflevector <4 x float> %38, <4 x float> undef, <2 x i32> <i32 2, i32 2>
  %44 = fmul fast <2 x float> %37, %43
  %45 = shufflevector <4 x float> %38, <4 x float> undef, <2 x i32> <i32 3, i32 3>
  %46 = fadd fast <2 x float> %44, %45
  %47 = shufflevector <2 x float> %46, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %48 = insertelement <4 x float> <float poison, float poison, float poison, float 1.000000e+00>, float %42, i64 0
  %49 = shufflevector <4 x float> %48, <4 x float> %47, <4 x i32> <i32 0, i32 4, i32 5, i32 3>
  ret <4 x float> %49
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_rsqrt.f32(float) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.dot.v2f32(<2 x float>, <2 x float>) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare { <4 x float>, i8 } @air.read_texture_2d.v4f32(ptr addrspace(1) nocapture readonly, ptr addrspace(2), <2 x i32>, <2 x i32>, i32, i32) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: read)
declare ptr addrspace(2) @air.get_read_sampler() local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x i32> @air.convert.s.v2i32.f.v2f32(<2 x float>) local_unnamed_addr #1

attributes #0 = { mustprogress nofree nounwind willreturn memory(read) "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { mustprogress nofree nosync nounwind willreturn memory(none) }
attributes #2 = { mustprogress nofree nounwind willreturn memory(argmem: read) }
attributes #3 = { mustprogress nofree nounwind willreturn memory(inaccessiblemem: read) }
attributes #4 = { nounwind willreturn memory(none) }
attributes #5 = { nounwind willreturn memory(inaccessiblemem: read) }
attributes #6 = { nounwind willreturn memory(argmem: read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.fragment = !{!15}

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
!15 = !{ptr @sdf_gen_gradients_lpf, !16, !18}
!16 = !{!17}
!17 = !{!"air.render_target", i32 0, i32 0, !"air.arg_type_name", !"float4"}
!18 = !{!19, !20, !21, !22, !23, !24}
!19 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"position"}
!20 = !{i32 1, !"air.fragment_input", !"generated(9texcoord0Dv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"texcoord0", !"air.arg_unused"}
!21 = !{i32 2, !"air.fragment_input", !"generated(9texcoord1Dv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"texcoord1", !"air.arg_unused"}
!22 = !{i32 3, !"air.texture", !"air.location_index", i32 3, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"base_surf"}
!23 = !{i32 4, !"air.texture", !"air.location_index", i32 4, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"blur_surf"}
!24 = !{i32 5, !"air.buffer", !"air.buffer_size", i32 16, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 16, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"float4", !"air.arg_name", !"u"}
!25 = !{!26}
!26 = distinct !{!26, !27, !"air-alias-scope-arg(5)"}
!27 = distinct !{!27, !"air-alias-scopes(sdf_gen_gradients_lpf)"}
!28 = !{!29}
!29 = distinct !{!29, !27, !"air-alias-scope-textures"}
