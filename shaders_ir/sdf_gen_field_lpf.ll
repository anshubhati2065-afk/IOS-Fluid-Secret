source_filename = "sdf_gen_field_lpf"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v29-apple-ios27.2.0"

@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer

; Function Attrs: mustprogress nofree nounwind willreturn memory(read)
define <4 x float> @sdf_gen_field_lpf(<4 x float> %0, <2 x float> %1, <2 x float> %2, ptr addrspace(1) %3, ptr addrspace(1) %4, ptr addrspace(2) nocapture noundef readonly align 16 dereferenceable(16) "air-buffer-no-alias" %5) local_unnamed_addr #0 {
  %7 = shufflevector <4 x float> %0, <4 x float> poison, <2 x i32> <i32 0, i32 1>
  %8 = tail call <2 x i32> @air.convert.s.v2i32.f.v2f32(<2 x float> %7) #4
  %9 = load <4 x float>, ptr addrspace(2) %5, align 16, !alias.scope !25, !noalias !28
  %10 = extractelement <4 x float> %9, i64 1
  %11 = tail call i32 @air.convert.s.i32.f.f32(float %10) #4
  %12 = extractelement <4 x float> %9, i64 0
  %13 = tail call ptr addrspace(2) @air.get_read_sampler() #5
  %14 = tail call { <4 x i32>, i8 } @air.read_texture_2d.u.v4i32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) %13, <2 x i32> %8, <2 x i32> zeroinitializer, i32 0, i32 0) #6
  %15 = extractvalue { <4 x i32>, i8 } %14, 0
  %16 = shufflevector <4 x i32> %15, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %17 = insertelement <2 x i32> poison, i32 %11, i64 0
  %18 = shufflevector <2 x i32> %17, <2 x i32> poison, <2 x i32> zeroinitializer
  %19 = sub <2 x i32> %8, %18
  %20 = tail call { <4 x float>, i8 } @air.read_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %4, ptr addrspace(2) %13, <2 x i32> %19, <2 x i32> zeroinitializer, i32 0, i32 0) #6
  %21 = extractvalue { <4 x float>, i8 } %20, 0
  %22 = extractelement <4 x float> %21, i64 3
  %23 = fcmp fast ogt float %22, %12
  %24 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %16) #4
  %25 = tail call fast <2 x float> @air.convert.f.v2f32.s.v2i32(<2 x i32> %8) #4
  %26 = fsub fast <2 x float> %25, %24
  %27 = tail call fast float @air.dot.v2f32(<2 x float> %26, <2 x float> %26) #4
  %28 = tail call fast float @air.fast_sqrt.f32(float %27) #4
  %29 = sub <2 x i32> %16, %18
  %30 = tail call { <4 x float>, i8 } @air.read_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %4, ptr addrspace(2) %13, <2 x i32> %29, <2 x i32> zeroinitializer, i32 0, i32 0) #6
  %31 = fneg fast float %28
  %32 = select i1 %23, float %31, float %28
  %33 = extractvalue { <4 x float>, i8 } %30, 0
  %34 = extractelement <4 x float> %33, i64 3
  %35 = fadd fast float %32, 5.000000e-01
  %36 = fsub fast float %35, %34
  %37 = extractelement <4 x float> %9, i64 2
  %38 = fmul fast float %36, %37
  %39 = extractelement <4 x float> %9, i64 3
  %40 = fadd fast float %38, %39
  %41 = insertelement <4 x float> <float poison, float 0.000000e+00, float 0.000000e+00, float 1.000000e+00>, float %40, i64 0
  ret <4 x float> %41
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare { <4 x float>, i8 } @air.read_texture_2d.v4f32(ptr addrspace(1) nocapture readonly, ptr addrspace(2), <2 x i32>, <2 x i32>, i32, i32) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_sqrt.f32(float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.dot.v2f32(<2 x float>, <2 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x float> @air.convert.f.v2f32.s.v2i32(<2 x i32>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare { <4 x i32>, i8 } @air.read_texture_2d.u.v4i32(ptr addrspace(1) nocapture readonly, ptr addrspace(2), <2 x i32>, <2 x i32>, i32, i32) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: read)
declare ptr addrspace(2) @air.get_read_sampler() local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare i32 @air.convert.s.i32.f.f32(float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x i32> @air.convert.s.v2i32.f.v2f32(<2 x float>) local_unnamed_addr #2

attributes #0 = { mustprogress nofree nounwind willreturn memory(read) "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { mustprogress nofree nounwind willreturn memory(argmem: read) }
attributes #2 = { mustprogress nofree nosync nounwind willreturn memory(none) }
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
!15 = !{ptr @sdf_gen_field_lpf, !16, !18}
!16 = !{!17}
!17 = !{!"air.render_target", i32 0, i32 0, !"air.arg_type_name", !"float4"}
!18 = !{!19, !20, !21, !22, !23, !24}
!19 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"position"}
!20 = !{i32 1, !"air.fragment_input", !"generated(9texcoord0Dv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"texcoord0", !"air.arg_unused"}
!21 = !{i32 2, !"air.fragment_input", !"generated(9texcoord1Dv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"texcoord1", !"air.arg_unused"}
!22 = !{i32 3, !"air.texture", !"air.location_index", i32 3, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<uint, sample>", !"air.arg_name", !"dist_surf"}
!23 = !{i32 4, !"air.texture", !"air.location_index", i32 4, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"img_surf"}
!24 = !{i32 5, !"air.buffer", !"air.buffer_size", i32 16, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 16, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"float4", !"air.arg_name", !"u"}
!25 = !{!26}
!26 = distinct !{!26, !27, !"air-alias-scope-arg(5)"}
!27 = distinct !{!27, !"air-alias-scopes(sdf_gen_field_lpf)"}
!28 = !{!29}
!29 = distinct !{!29, !27, !"air-alias-scope-textures"}
