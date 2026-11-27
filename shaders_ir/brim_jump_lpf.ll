source_filename = "brim_jump_lpf"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v29-apple-ios27.2.0"

%struct.BrimJumpUniforms.31 = type { float, float, float }

@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer
@__air_sampler_state.3 = internal addrspace(2) constant [2 x i64] [i64 34901797601017856, i64 0], align 8

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(read)
define <2 x i32> @brim_jump_lpf(<4 x float> %0, <2 x float> %1, <2 x float> %2, ptr addrspace(1) %3, ptr addrspace(1) %4, ptr addrspace(2) nocapture noundef readonly align 4 dereferenceable(12) "air-buffer-no-alias" %5) local_unnamed_addr #0 {
  %7 = shufflevector <4 x float> %0, <4 x float> poison, <2 x i32> <i32 0, i32 1>
  %8 = tail call fast <2 x float> @air.fast_floor.v2f32(<2 x float> %7) #5
  %9 = tail call <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float> %8) #5
  %10 = getelementptr inbounds %struct.BrimJumpUniforms.31, ptr addrspace(2) %5, i64 0, i32 0
  %11 = load float, ptr addrspace(2) %10, align 4, !tbaa !27, !alias.scope !32, !noalias !35
  %12 = tail call i32 @air.convert.u.i32.f.f32(float %11) #5
  %13 = getelementptr inbounds %struct.BrimJumpUniforms.31, ptr addrspace(2) %5, i64 0, i32 1
  %14 = load float, ptr addrspace(2) %13, align 4, !tbaa !37, !alias.scope !32, !noalias !35
  %15 = tail call i32 @air.convert.u.i32.f.f32(float %14) #5
  %16 = insertelement <2 x i32> poison, i32 %12, i64 0
  %17 = shufflevector <2 x i32> %16, <2 x i32> poison, <2 x i32> zeroinitializer
  %18 = tail call ptr addrspace(2) @air.get_read_sampler() #6
  %19 = getelementptr inbounds %struct.BrimJumpUniforms.31, ptr addrspace(2) %5, i64 0, i32 2
  %20 = load float, ptr addrspace(2) %19, align 4
  %21 = insertelement <2 x i32> poison, i32 %15, i64 0
  %22 = shufflevector <2 x i32> %21, <2 x i32> poison, <2 x i32> zeroinitializer
  br label %23

23:                                               ; preds = %33, %6
  %24 = phi float [ 0x7FF0000000000000, %6 ], [ %70, %33 ]
  %25 = phi <2 x i32> [ %9, %6 ], [ %69, %33 ]
  %26 = phi i32 [ -1, %6 ], [ %34, %33 ]
  %27 = insertelement <2 x i32> undef, i32 %26, i64 0
  br label %36

28:                                               ; preds = %33
  %29 = bitcast float %70 to i32
  %30 = and i32 %29, 2147483647
  %31 = icmp eq i32 %30, 2139095040
  %32 = select i1 %31, <2 x i32> zeroinitializer, <2 x i32> %69
  ret <2 x i32> %32

33:                                               ; preds = %68
  %34 = add nsw i32 %26, 1
  %35 = icmp eq i32 %34, 2
  br i1 %35, label %28, label %23, !llvm.loop !38

36:                                               ; preds = %68, %23
  %37 = phi float [ %24, %23 ], [ %70, %68 ]
  %38 = phi <2 x i32> [ %25, %23 ], [ %69, %68 ]
  %39 = phi i32 [ -1, %23 ], [ %71, %68 ]
  %40 = insertelement <2 x i32> %27, i32 %39, i64 1
  %41 = mul <2 x i32> %40, %17
  %42 = add <2 x i32> %41, %9
  %43 = tail call { <4 x i32>, i8 } @air.read_texture_2d.u.v4i32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) %18, <2 x i32> %42, <2 x i32> zeroinitializer, i32 0, i32 0) #7
  %44 = extractvalue { <4 x i32>, i8 } %43, 0
  %45 = extractelement <4 x i32> %44, i64 0
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %68, label %47

47:                                               ; preds = %36
  %48 = shufflevector <4 x i32> %44, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %49 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %9) #5
  %50 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %48) #5
  %51 = fsub fast <2 x float> %49, %50
  %52 = tail call fast float @air.dot.v2f32(<2 x float> %51, <2 x float> %51) #5
  %53 = tail call fast float @air.fast_sqrt.f32(float %52) #5
  %54 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %4, ptr addrspace(2) nocapture readonly @__air_sampler_state.3, <2 x float> %2, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #8
  %55 = extractvalue { <4 x float>, i8 } %54, 0
  %56 = extractelement <4 x float> %55, i64 3
  %57 = fcmp fast ogt float %56, %20
  %58 = sub <2 x i32> %48, %22
  %59 = tail call { <4 x float>, i8 } @air.read_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %4, ptr addrspace(2) %18, <2 x i32> %58, <2 x i32> zeroinitializer, i32 0, i32 0) #7
  %60 = extractvalue { <4 x float>, i8 } %59, 0
  %61 = extractelement <4 x float> %60, i64 3
  %62 = fsub fast float 1.000000e+00, %61
  %63 = select fast i1 %57, float %61, float %62
  %64 = fadd fast float %63, %53
  %65 = fcmp fast olt float %64, %37
  %66 = select i1 %65, <2 x i32> %48, <2 x i32> %38
  %67 = select i1 %65, float %64, float %37
  br label %68

68:                                               ; preds = %47, %36
  %69 = phi <2 x i32> [ %66, %47 ], [ %38, %36 ]
  %70 = phi float [ %67, %47 ], [ %37, %36 ]
  %71 = add nsw i32 %39, 1
  %72 = icmp eq i32 %71, 2
  br i1 %72, label %33, label %36, !llvm.loop !40
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare { <4 x float>, i8 } @air.read_texture_2d.v4f32(ptr addrspace(1) nocapture readonly, ptr addrspace(2), <2 x i32>, <2 x i32>, i32, i32) local_unnamed_addr #1

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(argmem: read)
declare { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly, ptr addrspace(2) nocapture readonly, <2 x float>, i1, <2 x i32>, i1, float, float, i32) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_sqrt.f32(float) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.dot.v2f32(<2 x float>, <2 x float>) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32>) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare { <4 x i32>, i8 } @air.read_texture_2d.u.v4i32(ptr addrspace(1) nocapture readonly, ptr addrspace(2), <2 x i32>, <2 x i32>, i32, i32) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: read)
declare ptr addrspace(2) @air.get_read_sampler() local_unnamed_addr #4

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare i32 @air.convert.u.i32.f.f32(float) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float>) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x float> @air.fast_floor.v2f32(<2 x float>) local_unnamed_addr #3

attributes #0 = { convergent mustprogress nofree nounwind willreturn memory(read) "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { mustprogress nofree nounwind willreturn memory(argmem: read) }
attributes #2 = { convergent mustprogress nofree nounwind willreturn memory(argmem: read) }
attributes #3 = { mustprogress nofree nosync nounwind willreturn memory(none) }
attributes #4 = { mustprogress nofree nounwind willreturn memory(inaccessiblemem: read) }
attributes #5 = { nounwind willreturn memory(none) }
attributes #6 = { nounwind willreturn memory(inaccessiblemem: read) }
attributes #7 = { nounwind willreturn memory(argmem: read) }
attributes #8 = { convergent nounwind willreturn memory(argmem: read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.fragment = !{!15}
!air.sampler_states = !{!26}

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
!15 = !{ptr @brim_jump_lpf, !16, !18}
!16 = !{!17}
!17 = !{!"air.render_target", i32 0, i32 0, !"air.arg_type_name", !"uint2"}
!18 = !{!19, !20, !21, !22, !23, !24}
!19 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"position"}
!20 = !{i32 1, !"air.fragment_input", !"generated(9texcoord0Dv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"texcoord0", !"air.arg_unused"}
!21 = !{i32 2, !"air.fragment_input", !"generated(9texcoord1Dv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"texcoord1"}
!22 = !{i32 3, !"air.texture", !"air.location_index", i32 3, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<uint, sample>", !"air.arg_name", !"dist_surf"}
!23 = !{i32 4, !"air.texture", !"air.location_index", i32 4, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"img_surf"}
!24 = !{i32 5, !"air.buffer", !"air.buffer_size", i32 12, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.struct_type_info", !25, !"air.arg_type_size", i32 12, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"BrimJumpUniforms", !"air.arg_name", !"u"}
!25 = !{i32 0, i32 4, i32 0, !"float", !"jump_dist", i32 4, i32 4, i32 0, !"float", !"offset", i32 8, i32 4, i32 0, !"float", !"alpha_threshold"}
!26 = !{!"air.sampler_state", ptr addrspace(2) @__air_sampler_state.3}
!27 = !{!28, !29, i64 0}
!28 = !{!"_ZTS16BrimJumpUniforms", !29, i64 0, !29, i64 4, !29, i64 8}
!29 = !{!"float", !30, i64 0}
!30 = !{!"omnipotent char", !31, i64 0}
!31 = !{!"Simple C++ TBAA"}
!32 = !{!33}
!33 = distinct !{!33, !34, !"air-alias-scope-arg(5)"}
!34 = distinct !{!34, !"air-alias-scopes(brim_jump_lpf)"}
!35 = !{!36}
!36 = distinct !{!36, !34, !"air-alias-scope-textures"}
!37 = !{!28, !29, i64 4}
!38 = distinct !{!38, !39}
!39 = !{!"llvm.loop.mustprogress"}
!40 = distinct !{!40, !39}
