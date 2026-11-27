source_filename = "simple_rim_lpf"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v29-apple-ios27.2.0"

%struct.SimpleRimUniforms.29 = type { <4 x float>, float, float, float }

@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer
@__air_sampler_state.2 = internal addrspace(2) constant [2 x i64] [i64 34901797601020489, i64 0], align 8

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(read)
define <4 x float> @simple_rim_lpf(<4 x float> %0, <4 x float> %1, <2 x float> %2, ptr addrspace(1) %3, ptr addrspace(2) nocapture noundef readonly align 16 dereferenceable(32) "air-buffer-no-alias" %4) local_unnamed_addr #0 {
  %6 = getelementptr inbounds %struct.SimpleRimUniforms.29, ptr addrspace(2) %4, i64 0, i32 1
  %7 = load float, ptr addrspace(2) %6, align 16, !tbaa !26, !alias.scope !31, !noalias !34
  %8 = tail call i32 @air.convert.s.i32.f.f32(float %7) #3
  %9 = getelementptr inbounds %struct.SimpleRimUniforms.29, ptr addrspace(2) %4, i64 0, i32 2
  %10 = load float, ptr addrspace(2) %9, align 4, !tbaa !36, !alias.scope !31, !noalias !34
  %11 = tail call i1 @air.convert.u.i1.f.f32(float %10) #3
  %12 = getelementptr inbounds %struct.SimpleRimUniforms.29, ptr addrspace(2) %4, i64 0, i32 3
  %13 = load float, ptr addrspace(2) %12, align 8, !tbaa !37, !alias.scope !31, !noalias !34
  %14 = tail call i1 @air.convert.u.i1.f.f32(float %13) #3
  %15 = tail call fast fastcc float @_Z26max_alpha_in_radius_circleN5metal7samplerENS_9texture2dIfLNS_6accessE0ELNS_16memory_coherenceE0EvEEDv2_fibb(ptr addrspace(2) @__air_sampler_state.2, ptr addrspace(1) %3, <2 x float> noundef %2, i32 noundef %8, i1 noundef zeroext %11, i1 noundef zeroext %14) #4
  br i1 %11, label %16, label %21

16:                                               ; preds = %5
  %17 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %3, ptr addrspace(2) nocapture readonly @__air_sampler_state.2, <2 x float> %2, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #5
  %18 = extractvalue { <4 x float>, i8 } %17, 0
  %19 = extractelement <4 x float> %18, i64 3
  %20 = fmul fast float %19, %15
  br label %21

21:                                               ; preds = %16, %5
  %22 = phi float [ %20, %16 ], [ %15, %5 ]
  %23 = getelementptr inbounds %struct.SimpleRimUniforms.29, ptr addrspace(2) %4, i64 0, i32 0
  %24 = load <4 x float>, ptr addrspace(2) %23, align 16, !alias.scope !31, !noalias !34
  %25 = insertelement <4 x float> poison, float %22, i64 0
  %26 = shufflevector <4 x float> %25, <4 x float> poison, <4 x i32> zeroinitializer
  %27 = fmul fast <4 x float> %26, %24
  ret <4 x float> %27
}

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(argmem: read)
declare { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly, ptr addrspace(2) nocapture readonly, <2 x float>, i1, <2 x i32>, i1, float, float, i32) local_unnamed_addr #1

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(read)
define internal fastcc float @_Z26max_alpha_in_radius_circleN5metal7samplerENS_9texture2dIfLNS_6accessE0ELNS_16memory_coherenceE0EvEEDv2_fibb(ptr addrspace(2) nocapture readonly %0, ptr addrspace(1) %1, <2 x float> noundef %2, i32 noundef %3, i1 noundef zeroext %4, i1 noundef zeroext %5) unnamed_addr #0 {
  %7 = sub i32 0, %3
  %8 = icmp slt i32 %3, 0
  br i1 %8, label %17, label %9

9:                                                ; preds = %6
  %10 = tail call fast float @air.convert.f.f32.s.i32(i32 %3) #3
  br label %11

11:                                               ; preds = %19, %9
  %12 = phi float [ %59, %19 ], [ 0.000000e+00, %9 ]
  %13 = phi i32 [ %20, %19 ], [ %7, %9 ]
  %14 = mul nsw i32 %13, %13
  %15 = tail call fast float @air.convert.f.f32.s.i32(i32 %14) #3
  %16 = insertelement <2 x i32> undef, i32 %13, i64 0
  br label %22

17:                                               ; preds = %19, %6
  %18 = phi float [ 0.000000e+00, %6 ], [ %59, %19 ]
  ret float %18

19:                                               ; preds = %50
  %20 = add i32 %13, 1
  %21 = icmp eq i32 %13, %3
  br i1 %21, label %17, label %11, !llvm.loop !38

22:                                               ; preds = %50, %11
  %23 = phi float [ %12, %11 ], [ %59, %50 ]
  %24 = phi i32 [ %7, %11 ], [ %60, %50 ]
  %25 = mul nsw i32 %24, %24
  %26 = tail call fast float @air.convert.f.f32.s.i32(i32 %25) #3
  %27 = fadd fast float %26, %15
  %28 = tail call fast float @air.fast_sqrt.f32(float %27) #3
  %29 = fadd fast float %28, -1.000000e+00
  %30 = fsub fast float %29, %10
  %31 = tail call fast float @air.fast_saturate.f32(float %30) #3
  %32 = fsub fast float 1.000000e+00, %31
  br i1 %5, label %33, label %50

33:                                               ; preds = %22
  %34 = fdiv fast float %29, %10
  %35 = tail call fast float @air.fast_saturate.f32(float %34) #3
  %36 = fptrunc float %35 to half
  %37 = fmul fast half %36, 0xH3800
  %38 = fadd fast half %37, 0xH3800
  %39 = tail call fast half @air.saturate.f16(half %38) #3
  %40 = fmul fast half %39, 0xH4400
  %41 = fadd fast half %40, 0xHC000
  %42 = fmul fast half %41, %41
  %43 = tail call fast half @air.fma.f16(half 0xH1A0D, half %42, half 0xHA869) #3
  %44 = tail call fast half @air.fma.f16(half %43, half %42, half 0xH3162) #3
  %45 = tail call fast half @air.fma.f16(half %44, half %42, half 0xHB87C) #3
  %46 = tail call fast half @air.fma.f16(half %45, half %41, half 0xH3800) #3
  %47 = fmul fast half %46, 0xH4000
  %48 = fpext half %47 to float
  %49 = fmul fast float %32, %48
  br label %50

50:                                               ; preds = %33, %22
  %51 = phi float [ %49, %33 ], [ %32, %22 ]
  %52 = insertelement <2 x i32> %16, i32 %24, i64 1
  %53 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(ptr addrspace(1) nocapture readonly %1, ptr addrspace(2) nocapture readonly %0, <2 x float> %2, i1 true, <2 x i32> %52, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #5
  %54 = extractvalue { <4 x float>, i8 } %53, 0
  %55 = extractelement <4 x float> %54, i64 3
  %56 = fsub fast float 1.000000e+00, %55
  %57 = select i1 %4, float %56, float %55
  %58 = fmul fast float %57, %51
  %59 = tail call fast float @air.fast_fmax.f32(float %23, float %58) #3
  %60 = add i32 %24, 1
  %61 = icmp eq i32 %24, %3
  br i1 %61, label %19, label %22, !llvm.loop !40
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_fmax.f32(float, float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare half @air.fma.f16(half, half, half) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare half @air.saturate.f16(half) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_saturate.f32(float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.fast_sqrt.f32(float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare float @air.convert.f.f32.s.i32(i32) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare i1 @air.convert.u.i1.f.f32(float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare i32 @air.convert.s.i32.f.f32(float) local_unnamed_addr #2

attributes #0 = { convergent mustprogress nofree nounwind willreturn memory(read) "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { convergent mustprogress nofree nounwind willreturn memory(argmem: read) }
attributes #2 = { mustprogress nofree nosync nounwind willreturn memory(none) }
attributes #3 = { nounwind willreturn memory(none) }
attributes #4 = { convergent nobuiltin "no-builtins" }
attributes #5 = { convergent nounwind willreturn memory(argmem: read) }

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
!15 = !{ptr @simple_rim_lpf, !16, !18}
!16 = !{!17}
!17 = !{!"air.render_target", i32 0, i32 0, !"air.arg_type_name", !"float4"}
!18 = !{!19, !20, !21, !22, !23}
!19 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"position", !"air.arg_unused"}
!20 = !{i32 1, !"air.fragment_input", !"generated(5colorDv4_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"color", !"air.arg_unused"}
!21 = !{i32 2, !"air.fragment_input", !"generated(11texcoord0_0Dv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"texcoord0_0"}
!22 = !{i32 3, !"air.texture", !"air.location_index", i32 3, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"surf"}
!23 = !{i32 4, !"air.buffer", !"air.buffer_size", i32 32, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.struct_type_info", !24, !"air.arg_type_size", i32 32, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"SimpleRimUniforms", !"air.arg_name", !"u"}
!24 = !{i32 0, i32 16, i32 0, !"float4", !"color", i32 16, i32 4, i32 0, !"float", !"width", i32 20, i32 4, i32 0, !"float", !"inside", i32 24, i32 4, i32 0, !"float", !"soft"}
!25 = !{!"air.sampler_state", ptr addrspace(2) @__air_sampler_state.2}
!26 = !{!27, !28, i64 16}
!27 = !{!"_ZTS17SimpleRimUniforms", !28, i64 0, !28, i64 16, !28, i64 20, !28, i64 24}
!28 = !{!"float", !29, i64 0}
!29 = !{!"omnipotent char", !30, i64 0}
!30 = !{!"Simple C++ TBAA"}
!31 = !{!32}
!32 = distinct !{!32, !33, !"air-alias-scope-arg(4)"}
!33 = distinct !{!33, !"air-alias-scopes(simple_rim_lpf)"}
!34 = !{!35}
!35 = distinct !{!35, !33, !"air-alias-scope-textures"}
!36 = !{!27, !28, i64 20}
!37 = !{!27, !28, i64 24}
!38 = distinct !{!38, !39}
!39 = !{!"llvm.loop.mustprogress"}
!40 = distinct !{!40, !39}
