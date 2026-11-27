source_filename = "brim_outline_lpf"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v29-apple-ios27.2.0"

%struct.BrimOutlineUniforms.32 = type { <4 x float>, <4 x float>, float, float, float, float, float, float, [8 x i8] }

@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer
@__air_sampler_state.3 = internal addrspace(2) constant [2 x i64] [i64 34901797601017856, i64 0], align 8

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(read)
define <{ <4 x float>, <4 x float> }> @brim_outline_lpf(<4 x float> %0, <2 x float> %1, <2 x float> %2, ptr addrspace(1) %3, ptr addrspace(1) %4, ptr addrspace(2) nocapture noundef readonly align 16 dereferenceable(64) "air-buffer-no-alias" %5, ptr addrspace(2) nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %6) local_unnamed_addr #0 {
  %8 = tail call i32 @air.get_width_texture_2d(ptr addrspace(1) nocapture readonly %3, i32 0) #6, !alias.scope !29, !noalias !32
  %9 = tail call fast float @air.convert.f.f32.u.i32(i32 %8) #7
  %10 = insertelement <2 x float> undef, float %9, i64 0
  %11 = tail call i32 @air.get_height_texture_2d(ptr addrspace(1) nocapture readonly %3, i32 0) #6, !alias.scope !29, !noalias !32
  %12 = tail call fast float @air.convert.f.f32.u.i32(i32 %11) #7
  %13 = insertelement <2 x float> %10, float %12, i64 1
  %14 = fmul fast <2 x float> %13, %1
  %15 = tail call fast <2 x float> @air.fast_floor.v2f32(<2 x float> %14) #7
  %16 = tail call <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float> %15) #7
  %17 = tail call ptr addrspace(2) @air.get_read_sampler() #8
  %18 = tail call { <4 x i32>, i8 } @air.read_texture_2d.u.v4i32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) %17, <2 x i32> %16, <2 x i32> zeroinitializer, i32 0, i32 0) #6
  %19 = extractvalue { <4 x i32>, i8 } %18, 0
  %20 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %4, ptr addrspace(2) nocapture readonly @__air_sampler_state.3, <2 x float> %2, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #9
  %21 = extractvalue { <4 x float>, i8 } %20, 0
  %22 = extractelement <4 x i32> %19, i64 0
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %32

24:                                               ; preds = %7
  %25 = shufflevector <4 x float> %21, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %26 = load float, ptr addrspace(2) %6, align 4, !tbaa !35, !alias.scope !39, !noalias !40
  %27 = insertelement <3 x float> poison, float %26, i64 0
  %28 = shufflevector <3 x float> %27, <3 x float> poison, <3 x i32> zeroinitializer
  %29 = fmul fast <3 x float> %28, %25
  %30 = shufflevector <3 x float> %29, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %31 = shufflevector <4 x float> %30, <4 x float> %21, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  br label %104

32:                                               ; preds = %7
  %33 = extractelement <4 x float> %21, i64 3
  %34 = getelementptr inbounds %struct.BrimOutlineUniforms.32, ptr addrspace(2) %5, i64 0, i32 6
  %35 = load float, ptr addrspace(2) %34, align 16, !tbaa !41, !alias.scope !43, !noalias !44
  %36 = fcmp fast ogt float %33, %35
  %37 = shufflevector <4 x i32> %19, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %38 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %37) #7
  %39 = fsub fast <2 x float> %15, %38
  %40 = tail call fast float @air.dot.v2f32(<2 x float> %39, <2 x float> %39) #7
  %41 = tail call fast float @air.fast_sqrt.f32(float %40) #7
  %42 = getelementptr inbounds %struct.BrimOutlineUniforms.32, ptr addrspace(2) %5, i64 0, i32 7
  %43 = load float, ptr addrspace(2) %42, align 4, !tbaa !45, !alias.scope !43, !noalias !44
  %44 = insertelement <2 x float> poison, float %43, i64 0
  %45 = shufflevector <2 x float> %44, <2 x float> poison, <2 x i32> zeroinitializer
  %46 = fsub fast <2 x float> %38, %45
  %47 = tail call <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float> %46) #7
  %48 = tail call { <4 x float>, i8 } @air.read_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %4, ptr addrspace(2) %17, <2 x i32> %47, <2 x i32> zeroinitializer, i32 0, i32 0) #6
  %49 = extractvalue { <4 x float>, i8 } %48, 0
  %50 = extractelement <4 x float> %49, i64 3
  %51 = fsub fast float 1.000000e+00, %50
  %52 = select fast i1 %36, float %50, float %51
  %53 = fadd fast float %52, %41
  %54 = getelementptr inbounds %struct.BrimOutlineUniforms.32, ptr addrspace(2) %5, i64 0, i32 2
  %55 = load float, ptr addrspace(2) %54, align 16, !alias.scope !43, !noalias !44
  %56 = fadd fast float %55, 0xBFF19999A0000000
  %57 = select i1 %36, float %56, float -0.000000e+00
  %58 = fadd fast float %53, %57
  %59 = getelementptr inbounds %struct.BrimOutlineUniforms.32, ptr addrspace(2) %5, i64 0, i32 0
  %60 = load <4 x float>, ptr addrspace(2) %59, align 16, !tbaa !46, !alias.scope !43, !noalias !44
  %61 = getelementptr inbounds %struct.BrimOutlineUniforms.32, ptr addrspace(2) %5, i64 0, i32 4
  %62 = load float, ptr addrspace(2) %61, align 8, !tbaa !47, !alias.scope !43, !noalias !44
  %63 = tail call i1 @air.convert.u.i1.f.f32(float %62) #7
  %64 = tail call fastcc float @_ZL13outline_alphafffbf(float noundef %58, float noundef %53, float noundef %55, i1 noundef zeroext %63) #10
  %65 = insertelement <4 x float> poison, float %64, i64 0
  %66 = shufflevector <4 x float> %65, <4 x float> poison, <4 x i32> zeroinitializer
  %67 = fmul fast <4 x float> %66, %60
  %68 = getelementptr inbounds %struct.BrimOutlineUniforms.32, ptr addrspace(2) %5, i64 0, i32 1
  %69 = load <4 x float>, ptr addrspace(2) %68, align 16, !tbaa !46, !alias.scope !43, !noalias !44
  %70 = getelementptr inbounds %struct.BrimOutlineUniforms.32, ptr addrspace(2) %5, i64 0, i32 3
  %71 = load float, ptr addrspace(2) %70, align 4, !tbaa !48, !alias.scope !43, !noalias !44
  %72 = getelementptr inbounds %struct.BrimOutlineUniforms.32, ptr addrspace(2) %5, i64 0, i32 5
  %73 = load float, ptr addrspace(2) %72, align 4, !tbaa !49, !alias.scope !43, !noalias !44
  %74 = tail call i1 @air.convert.u.i1.f.f32(float %73) #7
  %75 = tail call fastcc float @_ZL13outline_alphafffbf(float noundef %53, float noundef %53, float noundef %71, i1 noundef zeroext %74) #10
  %76 = insertelement <4 x float> poison, float %75, i64 0
  %77 = shufflevector <4 x float> %76, <4 x float> poison, <4 x i32> zeroinitializer
  %78 = fmul fast <4 x float> %77, %69
  %79 = shufflevector <4 x float> %21, <4 x float> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %80 = extractelement <4 x float> %78, i64 3
  %81 = fsub fast float 1.000000e+00, %80
  %82 = insertelement <4 x float> poison, float %81, i64 0
  %83 = shufflevector <4 x float> %82, <4 x float> poison, <4 x i32> zeroinitializer
  %84 = fmul fast <4 x float> %83, %21
  %85 = xor i1 %36, true
  %86 = fcmp fast ult float %53, 0x3FF19999A0000000
  %87 = select i1 %85, i1 true, i1 %86
  %88 = select i1 %87, <4 x float> %79, <4 x float> splat (float 1.000000e+00)
  %89 = fmul fast <4 x float> %78, %88
  %90 = fadd fast <4 x float> %84, %89
  %91 = extractelement <4 x float> %90, i64 3
  %92 = fsub fast float 1.000000e+00, %91
  %93 = insertelement <4 x float> poison, float %92, i64 0
  %94 = shufflevector <4 x float> %93, <4 x float> poison, <4 x i32> zeroinitializer
  %95 = fmul fast <4 x float> %67, %94
  %96 = fadd fast <4 x float> %95, %90
  %97 = load float, ptr addrspace(2) %6, align 4, !tbaa !35, !alias.scope !39, !noalias !40
  %98 = insertelement <3 x float> poison, float %97, i64 0
  %99 = shufflevector <3 x float> %98, <3 x float> poison, <3 x i32> zeroinitializer
  %100 = shufflevector <4 x float> %96, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %101 = fmul fast <3 x float> %100, %99
  %102 = shufflevector <3 x float> %101, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %103 = shufflevector <4 x float> %102, <4 x float> %96, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  br label %104

104:                                              ; preds = %32, %24
  %105 = phi <4 x float> [ %31, %24 ], [ %103, %32 ]
  %106 = insertvalue <{ <4 x float>, <4 x float> }> undef, <4 x float> %105, 0
  %107 = insertvalue <{ <4 x float>, <4 x float> }> %106, <4 x float> %105, 1
  ret <{ <4 x float>, <4 x float> }> %107
}

; Function Attrs: inlinehint mustprogress nofree nosync nounwind willreturn memory(none)
define internal fastcc float @_ZL13outline_alphafffbf(float noundef %0, float noundef %1, float noundef %2, i1 noundef zeroext %3) unnamed_addr #1 {
  br i1 %3, label %9, label %5

5:                                                ; preds = %4
  %6 = fsub fast float 0x3FF3333340000000, %0
  %7 = fadd fast float %6, %2
  %8 = tail call fast float @air.fast_saturate.f32(float %7) #7
  br label %31

9:                                                ; preds = %4
  %10 = fadd fast float %2, 0x3FF19999A0000000
  %11 = fsub fast float 0x3FF3333340000000, %0
  %12 = fadd fast float %11, %10
  %13 = tail call fast float @air.fast_saturate.f32(float %12) #7
  %14 = fadd fast float %1, 0xBFF19999A0000000
  %15 = fdiv fast float %14, %10
  %16 = tail call fast float @air.fast_saturate.f32(float %15) #7
  %17 = fptrunc float %16 to half
  %18 = fmul fast half %17, 0xH3800
  %19 = fadd fast half %18, 0xH3800
  %20 = tail call fast half @air.saturate.f16(half %19) #7
  %21 = fmul fast half %20, 0xH4400
  %22 = fadd fast half %21, 0xHC000
  %23 = fmul fast half %22, %22
  %24 = tail call fast half @air.fma.f16(half 0xH1A0D, half %23, half 0xHA869) #7
  %25 = tail call fast half @air.fma.f16(half %24, half %23, half 0xH3162) #7
  %26 = tail call fast half @air.fma.f16(half %25, half %23, half 0xHB87C) #7
  %27 = tail call fast half @air.fma.f16(half %26, half %22, half 0xH3800) #7
  %28 = fmul fast half %27, 0xH4000
  %29 = fpext half %28 to float
  %30 = fmul fast float %13, %29
  br label %31

31:                                               ; preds = %9, %5
  %32 = phi float [ %30, %9 ], [ %8, %5 ]
  ret float %32
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare half @air.fma.f16(half, half, half) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare half @air.saturate.f16(half) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_saturate.f32(float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare i1 @air.convert.u.i1.f.f32(float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare { <4 x float>, i8 } @air.read_texture_2d.v4f32(ptr addrspace(1) nocapture readonly, ptr addrspace(2), <2 x i32>, <2 x i32>, i32, i32) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_sqrt.f32(float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.dot.v2f32(<2 x float>, <2 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32>) local_unnamed_addr #2

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(argmem: read)
declare { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly, ptr addrspace(2) nocapture readonly, <2 x float>, i1, <2 x i32>, i1, float, float, i32) local_unnamed_addr #4

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare { <4 x i32>, i8 } @air.read_texture_2d.u.v4i32(ptr addrspace(1) nocapture readonly, ptr addrspace(2), <2 x i32>, <2 x i32>, i32, i32) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: read)
declare ptr addrspace(2) @air.get_read_sampler() local_unnamed_addr #5

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare <2 x float> @air.fast_floor.v2f32(<2 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.convert.f.f32.u.i32(i32) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare i32 @air.get_height_texture_2d(ptr addrspace(1) nocapture readonly, i32) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare i32 @air.get_width_texture_2d(ptr addrspace(1) nocapture readonly, i32) local_unnamed_addr #3

attributes #0 = { convergent mustprogress nofree nounwind willreturn memory(read) "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { inlinehint mustprogress nofree nosync nounwind willreturn memory(none) "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #2 = { mustprogress nofree nosync nounwind willreturn memory(none) }
attributes #3 = { mustprogress nofree nounwind willreturn memory(argmem: read) }
attributes #4 = { convergent mustprogress nofree nounwind willreturn memory(argmem: read) }
attributes #5 = { mustprogress nofree nounwind willreturn memory(inaccessiblemem: read) }
attributes #6 = { nounwind willreturn memory(argmem: read) }
attributes #7 = { nounwind willreturn memory(none) }
attributes #8 = { nounwind willreturn memory(inaccessiblemem: read) }
attributes #9 = { convergent nounwind willreturn memory(argmem: read) }
attributes #10 = { nobuiltin "no-builtins" }

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
!15 = !{ptr @brim_outline_lpf, !16, !19}
!16 = !{!17, !18}
!17 = !{!"air.render_target", i32 0, i32 0, !"air.arg_type_name", !"float4", !"air.arg_name", !"color0"}
!18 = !{!"air.render_target", i32 1, i32 0, !"air.arg_type_name", !"float4", !"air.arg_name", !"color1"}
!19 = !{!20, !21, !22, !23, !24, !25, !27}
!20 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"position", !"air.arg_unused"}
!21 = !{i32 1, !"air.fragment_input", !"generated(9texcoord0Dv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"texcoord0"}
!22 = !{i32 2, !"air.fragment_input", !"generated(9texcoord1Dv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"texcoord1"}
!23 = !{i32 3, !"air.texture", !"air.location_index", i32 3, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<uint, sample>", !"air.arg_name", !"dist_surf"}
!24 = !{i32 4, !"air.texture", !"air.location_index", i32 4, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"img_surf"}
!25 = !{i32 5, !"air.buffer", !"air.buffer_size", i32 64, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.struct_type_info", !26, !"air.arg_type_size", i32 64, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"BrimOutlineUniforms", !"air.arg_name", !"u"}
!26 = !{i32 0, i32 16, i32 0, !"float4", !"rim_color", i32 16, i32 16, i32 0, !"float4", !"border_color", i32 32, i32 4, i32 0, !"float", !"rim_width", i32 36, i32 4, i32 0, !"float", !"border_width", i32 40, i32 4, i32 0, !"float", !"rim_soft", i32 44, i32 4, i32 0, !"float", !"border_soft", i32 48, i32 4, i32 0, !"float", !"alpha_threshold", i32 52, i32 4, i32 0, !"float", !"offset"}
!27 = !{i32 6, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 6, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"edr_scale"}
!28 = !{!"air.sampler_state", ptr addrspace(2) @__air_sampler_state.3}
!29 = !{!30}
!30 = distinct !{!30, !31, !"air-alias-scope-textures"}
!31 = distinct !{!31, !"air-alias-scopes(brim_outline_lpf)"}
!32 = !{!33, !34}
!33 = distinct !{!33, !31, !"air-alias-scope-arg(5)"}
!34 = distinct !{!34, !31, !"air-alias-scope-arg(6)"}
!35 = !{!36, !36, i64 0}
!36 = !{!"float", !37, i64 0}
!37 = !{!"omnipotent char", !38, i64 0}
!38 = !{!"Simple C++ TBAA"}
!39 = !{!34}
!40 = !{!30, !33}
!41 = !{!42, !36, i64 48}
!42 = !{!"_ZTS19BrimOutlineUniforms", !36, i64 0, !36, i64 16, !36, i64 32, !36, i64 36, !36, i64 40, !36, i64 44, !36, i64 48, !36, i64 52}
!43 = !{!33}
!44 = !{!30, !34}
!45 = !{!42, !36, i64 52}
!46 = !{!37, !37, i64 0}
!47 = !{!42, !36, i64 40}
!48 = !{!42, !36, i64 36}
!49 = !{!42, !36, i64 44}
