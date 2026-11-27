source_filename = "rim_outline_lpf"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v29-apple-ios27.2.0"

%struct.RimOutlineUniforms.33 = type { <4 x float>, float, float, float, float }

@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer
@__air_sampler_state.3 = internal addrspace(2) constant [2 x i64] [i64 34901797601017856, i64 0], align 8

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(read)
define <{ <4 x float>, <4 x float> }> @rim_outline_lpf(<4 x float> %0, <2 x float> %1, <2 x float> %2, ptr addrspace(1) %3, ptr addrspace(1) %4, ptr addrspace(2) nocapture noundef readonly align 16 dereferenceable(32) "air-buffer-no-alias" %5) local_unnamed_addr #0 {
  %7 = tail call i32 @air.get_width_texture_2d(ptr addrspace(1) nocapture readonly %3, i32 0) #5, !alias.scope !28, !noalias !31
  %8 = tail call fast float @air.convert.f.f32.u.i32(i32 %7) #6
  %9 = insertelement <2 x float> undef, float %8, i64 0
  %10 = tail call i32 @air.get_height_texture_2d(ptr addrspace(1) nocapture readonly %3, i32 0) #5, !alias.scope !28, !noalias !31
  %11 = tail call fast float @air.convert.f.f32.u.i32(i32 %10) #6
  %12 = insertelement <2 x float> %9, float %11, i64 1
  %13 = fmul fast <2 x float> %12, %1
  %14 = tail call fast <2 x float> @air.fast_floor.v2f32(<2 x float> %13) #6
  %15 = tail call <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float> %14) #6
  %16 = tail call ptr addrspace(2) @air.get_read_sampler() #7
  %17 = tail call { <4 x i32>, i8 } @air.read_texture_2d.u.v4i32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) %16, <2 x i32> %15, <2 x i32> zeroinitializer, i32 0, i32 0) #5
  %18 = extractvalue { <4 x i32>, i8 } %17, 0
  %19 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %4, ptr addrspace(2) nocapture readonly @__air_sampler_state.3, <2 x float> %2, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #8
  %20 = extractelement <4 x i32> %18, i64 0
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %87, label %22

22:                                               ; preds = %6
  %23 = extractvalue { <4 x float>, i8 } %19, 0
  %24 = extractelement <4 x float> %23, i64 3
  %25 = getelementptr inbounds %struct.RimOutlineUniforms.33, ptr addrspace(2) %5, i64 0, i32 3
  %26 = load float, ptr addrspace(2) %25, align 8, !tbaa !33, !alias.scope !31, !noalias !28
  %27 = fcmp fast ogt float %24, %26
  %28 = shufflevector <4 x i32> %18, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %29 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %28) #6
  %30 = fsub fast <2 x float> %14, %29
  %31 = tail call fast float @air.dot.v2f32(<2 x float> %30, <2 x float> %30) #6
  %32 = tail call fast float @air.fast_sqrt.f32(float %31) #6
  %33 = getelementptr inbounds %struct.RimOutlineUniforms.33, ptr addrspace(2) %5, i64 0, i32 4
  %34 = load float, ptr addrspace(2) %33, align 4, !tbaa !38, !alias.scope !31, !noalias !28
  %35 = insertelement <2 x float> poison, float %34, i64 0
  %36 = shufflevector <2 x float> %35, <2 x float> poison, <2 x i32> zeroinitializer
  %37 = fsub fast <2 x float> %29, %36
  %38 = tail call <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float> %37) #6
  %39 = tail call { <4 x float>, i8 } @air.read_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %4, ptr addrspace(2) %16, <2 x i32> %38, <2 x i32> zeroinitializer, i32 0, i32 0) #5
  %40 = extractvalue { <4 x float>, i8 } %39, 0
  %41 = extractelement <4 x float> %40, i64 3
  %42 = fsub fast float 1.000000e+00, %41
  %43 = select fast i1 %27, float %41, float %42
  %44 = fadd fast float %43, %32
  %45 = getelementptr inbounds %struct.RimOutlineUniforms.33, ptr addrspace(2) %5, i64 0, i32 1
  %46 = load float, ptr addrspace(2) %45, align 16, !tbaa !39, !alias.scope !31, !noalias !28
  %47 = fadd fast float %46, 1.000000e+00
  %48 = fsub fast float %47, %44
  %49 = tail call fast float @air.fast_saturate.f32(float %48) #6
  %50 = getelementptr inbounds %struct.RimOutlineUniforms.33, ptr addrspace(2) %5, i64 0, i32 2
  %51 = load float, ptr addrspace(2) %50, align 4, !tbaa !40, !alias.scope !31, !noalias !28
  %52 = tail call i1 @air.convert.u.i1.f.f32(float %51) #6
  br i1 %52, label %53, label %71

53:                                               ; preds = %22
  %54 = fadd fast float %44, -1.000000e+00
  %55 = fdiv fast float %54, %46
  %56 = tail call fast float @air.fast_saturate.f32(float %55) #6
  %57 = fptrunc float %56 to half
  %58 = fmul fast half %57, 0xH3800
  %59 = fadd fast half %58, 0xH3800
  %60 = tail call fast half @air.saturate.f16(half %59) #6
  %61 = fmul fast half %60, 0xH4400
  %62 = fadd fast half %61, 0xHC000
  %63 = fmul fast half %62, %62
  %64 = tail call fast half @air.fma.f16(half 0xH1A0D, half %63, half 0xHA869) #6
  %65 = tail call fast half @air.fma.f16(half %64, half %63, half 0xH3162) #6
  %66 = tail call fast half @air.fma.f16(half %65, half %63, half 0xHB87C) #6
  %67 = tail call fast half @air.fma.f16(half %66, half %62, half 0xH3800) #6
  %68 = fmul fast half %67, 0xH4000
  %69 = fpext half %68 to float
  %70 = fmul fast float %49, %69
  br label %71

71:                                               ; preds = %53, %22
  %72 = phi float [ %70, %53 ], [ %49, %22 ]
  %73 = getelementptr inbounds %struct.RimOutlineUniforms.33, ptr addrspace(2) %5, i64 0, i32 0
  %74 = load <4 x float>, ptr addrspace(2) %73, align 16, !tbaa !41, !alias.scope !31, !noalias !28
  %75 = insertelement <4 x float> poison, float %72, i64 0
  %76 = shufflevector <4 x float> %75, <4 x float> poison, <4 x i32> zeroinitializer
  %77 = fmul fast <4 x float> %76, %74
  br i1 %27, label %78, label %87

78:                                               ; preds = %71
  %79 = fmul fast float %44, %44
  %80 = tail call fast float @air.fast_fmax.f32(float %79, float 1.000000e+00) #6
  %81 = fmul fast float %80, %24
  %82 = fsub fast float 1.000000e+00, %81
  %83 = tail call fast float @air.fast_saturate.f32(float %82) #6
  %84 = insertelement <4 x float> poison, float %83, i64 0
  %85 = shufflevector <4 x float> %84, <4 x float> poison, <4 x i32> zeroinitializer
  %86 = fmul fast <4 x float> %85, %77
  br label %87

87:                                               ; preds = %78, %71, %6
  %88 = phi <4 x float> [ zeroinitializer, %6 ], [ %86, %78 ], [ %77, %71 ]
  %89 = insertvalue <{ <4 x float>, <4 x float> }> undef, <4 x float> %88, 0
  %90 = insertvalue <{ <4 x float>, <4 x float> }> %89, <4 x float> %88, 1
  ret <{ <4 x float>, <4 x float> }> %90
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_saturate.f32(float) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_fmax.f32(float, float) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare half @air.fma.f16(half, half, half) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare half @air.saturate.f16(half) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare i1 @air.convert.u.i1.f.f32(float) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare { <4 x float>, i8 } @air.read_texture_2d.v4f32(ptr addrspace(1) nocapture readonly, ptr addrspace(2), <2 x i32>, <2 x i32>, i32, i32) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float>) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_sqrt.f32(float) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.dot.v2f32(<2 x float>, <2 x float>) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32>) local_unnamed_addr #1

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(argmem: read)
declare { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly, ptr addrspace(2) nocapture readonly, <2 x float>, i1, <2 x i32>, i1, float, float, i32) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare { <4 x i32>, i8 } @air.read_texture_2d.u.v4i32(ptr addrspace(1) nocapture readonly, ptr addrspace(2), <2 x i32>, <2 x i32>, i32, i32) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: read)
declare ptr addrspace(2) @air.get_read_sampler() local_unnamed_addr #4

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x float> @air.fast_floor.v2f32(<2 x float>) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.convert.f.f32.u.i32(i32) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare i32 @air.get_height_texture_2d(ptr addrspace(1) nocapture readonly, i32) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare i32 @air.get_width_texture_2d(ptr addrspace(1) nocapture readonly, i32) local_unnamed_addr #2

attributes #0 = { convergent mustprogress nofree nounwind willreturn memory(read) "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { mustprogress nofree nosync nounwind willreturn memory(none) }
attributes #2 = { mustprogress nofree nounwind willreturn memory(argmem: read) }
attributes #3 = { convergent mustprogress nofree nounwind willreturn memory(argmem: read) }
attributes #4 = { mustprogress nofree nounwind willreturn memory(inaccessiblemem: read) }
attributes #5 = { nounwind willreturn memory(argmem: read) }
attributes #6 = { nounwind willreturn memory(none) }
attributes #7 = { nounwind willreturn memory(inaccessiblemem: read) }
attributes #8 = { convergent nounwind willreturn memory(argmem: read) }

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
!15 = !{ptr @rim_outline_lpf, !16, !19}
!16 = !{!17, !18}
!17 = !{!"air.render_target", i32 0, i32 0, !"air.arg_type_name", !"float4", !"air.arg_name", !"color0"}
!18 = !{!"air.render_target", i32 1, i32 0, !"air.arg_type_name", !"float4", !"air.arg_name", !"color1"}
!19 = !{!20, !21, !22, !23, !24, !25}
!20 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"position", !"air.arg_unused"}
!21 = !{i32 1, !"air.fragment_input", !"generated(9texcoord0Dv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"texcoord0"}
!22 = !{i32 2, !"air.fragment_input", !"generated(9texcoord1Dv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"texcoord1"}
!23 = !{i32 3, !"air.texture", !"air.location_index", i32 3, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<uint, sample>", !"air.arg_name", !"dist_surf"}
!24 = !{i32 4, !"air.texture", !"air.location_index", i32 4, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"img_surf"}
!25 = !{i32 5, !"air.buffer", !"air.buffer_size", i32 32, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.struct_type_info", !26, !"air.arg_type_size", i32 32, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"RimOutlineUniforms", !"air.arg_name", !"u"}
!26 = !{i32 0, i32 16, i32 0, !"float4", !"rim_color", i32 16, i32 4, i32 0, !"float", !"rim_width", i32 20, i32 4, i32 0, !"float", !"rim_soft", i32 24, i32 4, i32 0, !"float", !"alpha_threshold", i32 28, i32 4, i32 0, !"float", !"offset"}
!27 = !{!"air.sampler_state", ptr addrspace(2) @__air_sampler_state.3}
!28 = !{!29}
!29 = distinct !{!29, !30, !"air-alias-scope-textures"}
!30 = distinct !{!30, !"air-alias-scopes(rim_outline_lpf)"}
!31 = !{!32}
!32 = distinct !{!32, !30, !"air-alias-scope-arg(5)"}
!33 = !{!34, !35, i64 24}
!34 = !{!"_ZTS18RimOutlineUniforms", !35, i64 0, !35, i64 16, !35, i64 20, !35, i64 24, !35, i64 28}
!35 = !{!"float", !36, i64 0}
!36 = !{!"omnipotent char", !37, i64 0}
!37 = !{!"Simple C++ TBAA"}
!38 = !{!34, !35, i64 28}
!39 = !{!34, !35, i64 16}
!40 = !{!34, !35, i64 20}
!41 = !{!36, !36, i64 0}
