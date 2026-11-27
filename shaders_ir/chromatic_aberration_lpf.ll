source_filename = "chromatic_aberration_lpf"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v29-apple-ios27.2.0"

%struct.ChromaticAberrationUniforms.21 = type { <2 x float>, <2 x float>, <2 x float>, <2 x float>, <2 x float> }

@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer
@__air_sampler_state.2 = internal addrspace(2) constant [2 x i64] [i64 34901797601020489, i64 0], align 8

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(read)
define <4 x float> @chromatic_aberration_lpf(<4 x float> %0, <4 x float> %1, <2 x float> %2, ptr addrspace(1) %3, ptr addrspace(2) nocapture noundef readonly align 8 dereferenceable(40) "air-buffer-no-alias" %4) local_unnamed_addr #0 {
  %6 = getelementptr inbounds %struct.ChromaticAberrationUniforms.21, ptr addrspace(2) %4, i64 0, i32 0
  %7 = load <2 x float>, ptr addrspace(2) %6, align 8, !tbaa !26, !alias.scope !29, !noalias !32
  %8 = fadd fast <2 x float> %7, %2
  %9 = getelementptr inbounds %struct.ChromaticAberrationUniforms.21, ptr addrspace(2) %4, i64 0, i32 1
  %10 = load <2 x float>, ptr addrspace(2) %9, align 8, !tbaa !26, !alias.scope !29, !noalias !32
  %11 = fadd fast <2 x float> %10, %2
  %12 = getelementptr inbounds %struct.ChromaticAberrationUniforms.21, ptr addrspace(2) %4, i64 0, i32 2
  %13 = load <2 x float>, ptr addrspace(2) %12, align 8, !tbaa !26, !alias.scope !29, !noalias !32
  %14 = fadd fast <2 x float> %13, %2
  %15 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) nocapture readonly @__air_sampler_state.2, <2 x float> %8, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #3
  %16 = extractvalue { <4 x float>, i8 } %15, 0
  %17 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) nocapture readonly @__air_sampler_state.2, <2 x float> %11, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #3
  %18 = extractvalue { <4 x float>, i8 } %17, 0
  %19 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) nocapture readonly @__air_sampler_state.2, <2 x float> %14, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #3
  %20 = extractvalue { <4 x float>, i8 } %19, 0
  %21 = getelementptr inbounds %struct.ChromaticAberrationUniforms.21, ptr addrspace(2) %4, i64 0, i32 3
  %22 = load <2 x float>, ptr addrspace(2) %21, align 8, !tbaa !26, !alias.scope !29, !noalias !32
  %23 = fcmp fast oge <2 x float> %8, %22
  %24 = tail call i1 @air.all.v2i1(<2 x i1> %23) #4
  br i1 %24, label %25, label %37

25:                                               ; preds = %5
  %26 = getelementptr inbounds %struct.ChromaticAberrationUniforms.21, ptr addrspace(2) %4, i64 0, i32 4
  %27 = load <2 x float>, ptr addrspace(2) %26, align 8, !tbaa !26, !alias.scope !29, !noalias !32
  %28 = fcmp fast ole <2 x float> %8, %27
  %29 = tail call i1 @air.all.v2i1(<2 x i1> %28) #4
  br i1 %29, label %30, label %37

30:                                               ; preds = %25
  %31 = extractelement <4 x float> %16, i64 3
  %32 = extractelement <4 x float> %16, i64 0
  %33 = tail call fast float @air.fast_fmax.f32(float %31, float 0x3EB0C6F7A0000000) #4
  %34 = fdiv fast float %32, %33
  %35 = insertelement <4 x float> <float poison, float 0.000000e+00, float 0.000000e+00, float poison>, float %34, i64 0
  %36 = shufflevector <4 x float> %35, <4 x float> %16, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  br label %37

37:                                               ; preds = %30, %25, %5
  %38 = phi <4 x float> [ %36, %30 ], [ zeroinitializer, %25 ], [ zeroinitializer, %5 ]
  %39 = fcmp fast oge <2 x float> %11, %22
  %40 = tail call i1 @air.all.v2i1(<2 x i1> %39) #4
  br i1 %40, label %41, label %55

41:                                               ; preds = %37
  %42 = getelementptr inbounds %struct.ChromaticAberrationUniforms.21, ptr addrspace(2) %4, i64 0, i32 4
  %43 = load <2 x float>, ptr addrspace(2) %42, align 8, !tbaa !26, !alias.scope !29, !noalias !32
  %44 = fcmp fast ole <2 x float> %11, %43
  %45 = tail call i1 @air.all.v2i1(<2 x i1> %44) #4
  br i1 %45, label %46, label %55

46:                                               ; preds = %41
  %47 = extractelement <4 x float> %38, i64 3
  %48 = extractelement <4 x float> %18, i64 3
  %49 = fadd fast float %47, %48
  %50 = extractelement <4 x float> %18, i64 1
  %51 = tail call fast float @air.fast_fmax.f32(float %48, float 0x3EB0C6F7A0000000) #4
  %52 = fdiv fast float %50, %51
  %53 = insertelement <4 x float> %38, float %52, i64 1
  %54 = insertelement <4 x float> %53, float %49, i64 3
  br label %55

55:                                               ; preds = %46, %41, %37
  %56 = phi <4 x float> [ %54, %46 ], [ %38, %41 ], [ %38, %37 ]
  %57 = fcmp fast oge <2 x float> %14, %22
  %58 = tail call i1 @air.all.v2i1(<2 x i1> %57) #4
  br i1 %58, label %59, label %73

59:                                               ; preds = %55
  %60 = getelementptr inbounds %struct.ChromaticAberrationUniforms.21, ptr addrspace(2) %4, i64 0, i32 4
  %61 = load <2 x float>, ptr addrspace(2) %60, align 8, !tbaa !26, !alias.scope !29, !noalias !32
  %62 = fcmp fast ole <2 x float> %14, %61
  %63 = tail call i1 @air.all.v2i1(<2 x i1> %62) #4
  br i1 %63, label %64, label %73

64:                                               ; preds = %59
  %65 = extractelement <4 x float> %56, i64 3
  %66 = extractelement <4 x float> %20, i64 3
  %67 = fadd fast float %65, %66
  %68 = extractelement <4 x float> %20, i64 2
  %69 = tail call fast float @air.fast_fmax.f32(float %66, float 0x3EB0C6F7A0000000) #4
  %70 = fdiv fast float %68, %69
  %71 = insertelement <4 x float> %56, float %70, i64 2
  %72 = insertelement <4 x float> %71, float %67, i64 3
  br label %73

73:                                               ; preds = %64, %59, %55
  %74 = phi <4 x float> [ %72, %64 ], [ %56, %59 ], [ %56, %55 ]
  %75 = extractelement <4 x float> %74, i64 3
  %76 = fmul fast float %75, 0x3FD5555560000000
  %77 = insertelement <3 x float> poison, float %76, i64 0
  %78 = shufflevector <3 x float> %77, <3 x float> poison, <3 x i32> zeroinitializer
  %79 = shufflevector <4 x float> %74, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %80 = fmul fast <3 x float> %78, %79
  %81 = shufflevector <3 x float> %80, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %82 = insertelement <4 x float> %81, float %76, i64 3
  ret <4 x float> %82
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_fmax.f32(float, float) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare i1 @air.all.v2i1(<2 x i1>) local_unnamed_addr #1

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
!15 = !{ptr @chromatic_aberration_lpf, !16, !18}
!16 = !{!17}
!17 = !{!"air.render_target", i32 0, i32 0, !"air.arg_type_name", !"float4"}
!18 = !{!19, !20, !21, !22, !23}
!19 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"position", !"air.arg_unused"}
!20 = !{i32 1, !"air.fragment_input", !"generated(5colorDv4_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"color", !"air.arg_unused"}
!21 = !{i32 2, !"air.fragment_input", !"generated(11texcoord0_0Dv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"texcoord0_0"}
!22 = !{i32 3, !"air.texture", !"air.location_index", i32 3, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"surf"}
!23 = !{i32 4, !"air.buffer", !"air.buffer_size", i32 40, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.struct_type_info", !24, !"air.arg_type_size", i32 40, !"air.arg_type_align_size", i32 8, !"air.arg_type_name", !"ChromaticAberrationUniforms", !"air.arg_name", !"u"}
!24 = !{i32 0, i32 8, i32 0, !"float2", !"r_offset", i32 8, i32 8, i32 0, !"float2", !"g_offset", i32 16, i32 8, i32 0, !"float2", !"b_offset", i32 24, i32 8, i32 0, !"float2", !"uv_min", i32 32, i32 8, i32 0, !"float2", !"uv_max"}
!25 = !{!"air.sampler_state", ptr addrspace(2) @__air_sampler_state.2}
!26 = !{!27, !27, i64 0}
!27 = !{!"omnipotent char", !28, i64 0}
!28 = !{!"Simple C++ TBAA"}
!29 = !{!30}
!30 = distinct !{!30, !31, !"air-alias-scope-arg(4)"}
!31 = distinct !{!31, !"air-alias-scopes(chromatic_aberration_lpf)"}
!32 = !{!33}
!33 = distinct !{!33, !31, !"air-alias-scope-textures"}
