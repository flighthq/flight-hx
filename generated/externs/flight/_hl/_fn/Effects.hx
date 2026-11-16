package flight._hl._fn;

extern class Effects {
	@:hlNative("flight", "flight_create_auto_exposure_effect")
	public static function createAutoExposureEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_barrel_distortion_effect")
	public static function createBarrelDistortionEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_bevel_effect")
	public static function createBevelEffect():hl.Bytes;
	@:hlNative("flight", "flight_get_bevel_effect_padding")
	public static function getBevelEffectPadding(out:flight._hl.EffectPadding, effect:flight._hl.BevelEffect):Void;
	@:hlNative("flight", "flight_create_bitmap_displacement_effect")
	public static function createBitmapDisplacementEffect():hl.Bytes;
	@:hlNative("flight", "flight_get_bitmap_displacement_effect_padding")
	public static function getBitmapDisplacementEffectPadding(out:flight._hl.EffectPadding, effect:flight._hl.BitmapDisplacementEffect):Void;
	@:hlNative("flight", "flight_create_blend_effect")
	public static function createBlendEffect():hl.Bytes;
	@:hlNative("flight", "flight_blend_non_separable_rgb")
	public static function blendNonSeparableRgb(out:hl.Bytes, outLen:Int, mode:hl.Bytes, cbR:Single, cbG:Single, cbB:Single, csR:Single, csG:Single, csB:Single):Void;
	@:hlNative("flight", "flight_get_advanced_blend_rgb")
	public static function getAdvancedBlendRgb(out:hl.Bytes, outLen:Int, mode:hl.Bytes, cbR:Single, cbG:Single, cbB:Single, csR:Single, csG:Single, csB:Single):Void;
	@:hlNative("flight", "flight_get_separable_blend_channel")
	public static function getSeparableBlendChannel(mode:hl.Bytes, cb:Single, cs:Single):Single;
	@:hlNative("flight", "flight_is_non_separable_blend_mode")
	public static function isNonSeparableBlendMode(mode:hl.Bytes):Bool;
	@:hlNative("flight", "flight_create_bloom_effect")
	public static function createBloomEffect():hl.Bytes;
	@:hlNative("flight", "flight_compute_bloom_blur_radius")
	public static function computeBloomBlurRadius(effect:flight._hl.BloomEffect):Single;
	@:hlNative("flight", "flight_compute_bloom_intensity")
	public static function computeBloomIntensity(effect:flight._hl.BloomEffect):Single;
	@:hlNative("flight", "flight_compute_bloom_threshold")
	public static function computeBloomThreshold(effect:flight._hl.BloomEffect):Single;
	@:hlNative("flight", "flight_get_bloom_effect_padding")
	public static function getBloomEffectPadding(out:flight._hl.EffectPadding, effect:flight._hl.BloomEffect):Void;
	@:hlNative("flight", "flight_get_blur_downsample_level")
	public static function getBlurDownsampleLevel(sigma:Single):Int;
	@:hlNative("flight", "flight_get_blur_residual_sigma")
	public static function getBlurResidualSigma(sigma:Single, level:Int):Single;
	@:hlNative("flight", "flight_create_blur_effect")
	public static function createBlurEffect():hl.Bytes;
	@:hlNative("flight", "flight_get_blur_effect_padding")
	public static function getBlurEffectPadding(out:flight._hl.EffectPadding, effect:flight._hl.BlurEffect):Void;
	@:hlNative("flight", "flight_create_bokeh_depth_of_field_effect")
	public static function createBokehDepthOfFieldEffect():hl.Bytes;
	@:hlNative("flight", "flight_get_bokeh_depth_of_field_effect_padding")
	public static function getBokehDepthOfFieldEffectPadding(out:flight._hl.EffectPadding, effect:flight._hl.BokehDepthOfFieldEffect):Void;
	@:hlNative("flight", "flight_compute_box_blur_pass_radius")
	public static function computeBoxBlurPassRadius(sigma:Single, passes:Single, pass:Single):Single;
	@:hlNative("flight", "flight_compute_box_blur_radius")
	public static function computeBoxBlurRadius(sigma:Single, passes:Single):Single;
	@:hlNative("flight", "flight_compute_gaussian_sigma_for_blur_radius")
	public static function computeGaussianSigmaForBlurRadius(radius:Single, passes:Single):Single;
	@:hlNative("flight", "flight_create_camera_motion_blur_effect")
	public static function createCameraMotionBlurEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_chromatic_aberration_effect")
	public static function createChromaticAberrationEffect():hl.Bytes;
	@:hlNative("flight", "flight_compute_color_temperature_rgb")
	public static function computeColorTemperatureRgb(out:hl.Bytes, kelvin:Single):Void;
	@:hlNative("flight", "flight_compute_white_balance_multipliers")
	public static function computeWhiteBalanceMultipliers(out:hl.Bytes, temperature:Single, tint:Single):Void;
	@:hlNative("flight", "flight_create_composite_effect")
	public static function createCompositeEffect():hl.Bytes;
	@:hlNative("flight", "flight_get_composite_operator_factors")
	public static function getCompositeOperatorFactors(out:hl.Bytes, outLen:Int, operator_:hl.Bytes, sourceAlpha:Single, backdropAlpha:Single):Void;
	@:hlNative("flight", "flight_create_contact_shadows_effect")
	public static function createContactShadowsEffect():hl.Bytes;
	@:hlNative("flight", "flight_get_contact_shadows_effect_padding")
	public static function getContactShadowsEffectPadding(out:flight._hl.EffectPadding, effect:flight._hl.ContactShadowsEffect):Void;
	@:hlNative("flight", "flight_create_convolution_effect")
	public static function createConvolutionEffect():hl.Bytes;
	@:hlNative("flight", "flight_get_convolution_effect_padding")
	public static function getConvolutionEffectPadding(out:flight._hl.EffectPadding, effect:flight._hl.ConvolutionEffect):Void;
	@:hlNative("flight", "flight_create_crt_effect")
	public static function createCrtEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_custom_shader_effect")
	public static function createCustomShaderEffect():hl.Bytes;
	@:hlNative("flight", "flight_compute_depth_of_field_coc")
	public static function computeDepthOfFieldCoc(depth:Single, focusDistance:Single, aperture:Single, focalLength:Single):Single;
	@:hlNative("flight", "flight_compute_linear_depth_from_nonlinear")
	public static function computeLinearDepthFromNonlinear(depth:Single, near:Single, far:Single):Single;
	@:hlNative("flight", "flight_compute_ssao_sample_kernel")
	public static function computeSsaoSampleKernel(out:hl.Bytes, outLen:Int, samples:Single):Int;
	@:hlNative("flight", "flight_create_directional_blur_effect")
	public static function createDirectionalBlurEffect():hl.Bytes;
	@:hlNative("flight", "flight_get_directional_blur_effect_padding")
	public static function getDirectionalBlurEffectPadding(out:flight._hl.EffectPadding, effect:flight._hl.DirectionalBlurEffect):Void;
	@:hlNative("flight", "flight_create_displacement_effect")
	public static function createDisplacementEffect():hl.Bytes;
	@:hlNative("flight", "flight_get_displacement_effect_padding")
	public static function getDisplacementEffectPadding(out:flight._hl.EffectPadding, effect:flight._hl.DisplacementEffect):Void;
	@:hlNative("flight", "flight_create_dither_effect")
	public static function createDitherEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_drop_shadow_effect")
	public static function createDropShadowEffect():hl.Bytes;
	@:hlNative("flight", "flight_get_drop_shadow_effect_padding")
	public static function getDropShadowEffectPadding(out:flight._hl.EffectPadding, effect:flight._hl.DropShadowEffect):Void;
	@:hlNative("flight", "flight_compute_outline_edge_params")
	public static function computeOutlineEdgeParams(out:hl.Bytes, effect:flight._hl.OutlineEffect):Void;
	@:hlNative("flight", "flight_compute_outline_thickness_px")
	public static function computeOutlineThicknessPx(effect:flight._hl.OutlineEffect):Single;
	@:hlNative("flight", "flight_compute_sketch_edge_params")
	public static function computeSketchEdgeParams(out:hl.Bytes, effect:flight._hl.SketchEffect):Void;
	@:hlNative("flight", "flight_get_sobel_kernel_coefficients")
	public static function getSobelKernelCoefficients(out:hl.Bytes, outLen:Int):Void;
	@:hlNative("flight", "flight_get_effect_defaults")
	public static function getEffectDefaults(out:flight._hl.EffectDefaults, kind:hl.Bytes):Void;
	@:hlNative("flight", "flight_normalize_effect")
	public static function normalizeEffect(effect:flight._hl.EffectRef, out:flight._hl.EffectRef):Bool;
	@:hlNative("flight", "flight_can_lerp_effects")
	public static function canLerpEffects(a:flight._hl.EffectRef, b:flight._hl.EffectRef):Bool;
	@:hlNative("flight", "flight_get_directional_effect_padding")
	public static function getDirectionalEffectPadding(out:flight._hl.EffectPadding, blurX:Single, blurY:Single, offsetX:Single, offsetY:Single):Void;
	@:hlNative("flight", "flight_get_gaussian_effect_padding")
	public static function getGaussianEffectPadding(out:flight._hl.EffectPadding, blurX:Single, blurY:Single):Void;
	@:hlNative("flight", "flight_validate_effect_list")
	public static function validateEffectList(effects:hl.Bytes, effectsLen:Int, available:hl.Bytes, availableLen:Int):Int;
	@:hlNative("flight", "flight_create_film_emulation_effect")
	public static function createFilmEmulationEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_film_grain_effect")
	public static function createFilmGrainEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_fxaa_effect")
	public static function createFxaaEffect():hl.Bytes;
	@:hlNative("flight", "flight_compute_gaussian_kernel_weights")
	public static function computeGaussianKernelWeights(out:hl.Bytes, sigma:Single):Void;
	@:hlNative("flight", "flight_get_gaussian_kernel_size")
	public static function getGaussianKernelSize(sigma:Single):Int;
	@:hlNative("flight", "flight_create_gaussian_kernel_weights")
	public static function createGaussianKernelWeights(out:hl.Bytes, outLen:Int, radius:Single, sigma:Single):Int;
	@:hlNative("flight", "flight_compute_gaussian_radius_from_sigma")
	public static function computeGaussianRadiusFromSigma(sigma:Single):Single;
	@:hlNative("flight", "flight_compute_gaussian_sigma_from_radius")
	public static function computeGaussianSigmaFromRadius(radius:Single):Single;
	@:hlNative("flight", "flight_compute_separable_blur_pass_count")
	public static function computeSeparableBlurPassCount(samples:Single):Single;
	@:hlNative("flight", "flight_create_glitch_effect")
	public static function createGlitchEffect():hl.Bytes;
	@:hlNative("flight", "flight_get_glitch_effect_padding")
	public static function getGlitchEffectPadding(out:flight._hl.EffectPadding, effect:flight._hl.GlitchEffect):Void;
	@:hlNative("flight", "flight_create_god_rays_effect")
	public static function createGodRaysEffect():hl.Bytes;
	@:hlNative("flight", "flight_compute_god_rays_accumulation_scale")
	public static function computeGodRaysAccumulationScale(effect:flight._hl.GodRaysEffect):Single;
	@:hlNative("flight", "flight_compute_god_rays_light_center")
	public static function computeGodRaysLightCenter(out:hl.Bytes, effect:flight._hl.GodRaysEffect):Void;
	@:hlNative("flight", "flight_compute_god_rays_sample_weight")
	public static function computeGodRaysSampleWeight(effect:flight._hl.GodRaysEffect, sampleIndex:Single):Single;
	@:hlNative("flight", "flight_compute_god_rays_step_size")
	public static function computeGodRaysStepSize(out:hl.Bytes, effect:flight._hl.GodRaysEffect, px:Single, py:Single):Void;
	@:hlNative("flight", "flight_create_gradient_bevel_effect")
	public static function createGradientBevelEffect():hl.Bytes;
	@:hlNative("flight", "flight_get_gradient_bevel_effect_padding")
	public static function getGradientBevelEffectPadding(out:flight._hl.EffectPadding, effect:flight._hl.GradientBevelEffect):Void;
	@:hlNative("flight", "flight_create_gradient_glow_effect")
	public static function createGradientGlowEffect():hl.Bytes;
	@:hlNative("flight", "flight_get_gradient_glow_effect_padding")
	public static function getGradientGlowEffectPadding(out:flight._hl.EffectPadding, effect:flight._hl.GradientGlowEffect):Void;
	@:hlNative("flight", "flight_create_halftone_effect")
	public static function createHalftoneEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_inner_glow_effect")
	public static function createInnerGlowEffect():hl.Bytes;
	@:hlNative("flight", "flight_get_inner_glow_effect_padding")
	public static function getInnerGlowEffectPadding(out:flight._hl.EffectPadding, effect:flight._hl.InnerGlowEffect):Void;
	@:hlNative("flight", "flight_create_inner_shadow_effect")
	public static function createInnerShadowEffect():hl.Bytes;
	@:hlNative("flight", "flight_get_inner_shadow_effect_padding")
	public static function getInnerShadowEffectPadding(out:flight._hl.EffectPadding, effect:flight._hl.InnerShadowEffect):Void;
	@:hlNative("flight", "flight_create_kuwahara_effect")
	public static function createKuwaharaEffect():hl.Bytes;
	@:hlNative("flight", "flight_compute_kuwahara_gaussian_weights")
	public static function computeKuwaharaGaussianWeights(out:hl.Bytes, outLen:Int, radius:Single):Int;
	@:hlNative("flight", "flight_compute_kuwahara_sector_offsets")
	public static function computeKuwaharaSectorOffsets(out:hl.Bytes, radius:Single):Void;
	@:hlNative("flight", "flight_compute_kuwahara_sector_pixel_count")
	public static function computeKuwaharaSectorPixelCount(effect:flight._hl.KuwaharaEffect):Int;
	@:hlNative("flight", "flight_compute_kuwahara_sector_size")
	public static function computeKuwaharaSectorSize(effect:flight._hl.KuwaharaEffect):Int;
	@:hlNative("flight", "flight_create_lens_dirt_effect")
	public static function createLensDirtEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_lens_distortion_effect")
	public static function createLensDistortionEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_lens_flare_effect")
	public static function createLensFlareEffect():hl.Bytes;
	@:hlNative("flight", "flight_compute_linear_sampled_gaussian")
	public static function computeLinearSampledGaussian(outWeights:hl.Bytes, outOffsets:hl.Bytes, sigma:Single):Void;
	@:hlNative("flight", "flight_get_linear_sampled_gaussian_tap_count")
	public static function getLinearSampledGaussianTapCount(sigma:Single):Int;
	@:hlNative("flight", "flight_create_median_effect")
	public static function createMedianEffect():hl.Bytes;
	@:hlNative("flight", "flight_get_median_effect_padding")
	public static function getMedianEffectPadding(out:flight._hl.EffectPadding, effect:flight._hl.MedianEffect):Void;
	@:hlNative("flight", "flight_create_motion_blur_effect")
	public static function createMotionBlurEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_outer_glow_effect")
	public static function createOuterGlowEffect():hl.Bytes;
	@:hlNative("flight", "flight_get_outer_glow_effect_padding")
	public static function getOuterGlowEffectPadding(out:flight._hl.EffectPadding, effect:flight._hl.OuterGlowEffect):Void;
	@:hlNative("flight", "flight_create_outline_effect")
	public static function createOutlineEffect():hl.Bytes;
	@:hlNative("flight", "flight_get_outline_effect_padding")
	public static function getOutlineEffectPadding(out:flight._hl.EffectPadding, effect:flight._hl.OutlineEffect):Void;
	@:hlNative("flight", "flight_create_pannini_projection_effect")
	public static function createPanniniProjectionEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_pixelate_effect")
	public static function createPixelateEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_posterize_effect")
	public static function createPosterizeEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_radial_blur_effect")
	public static function createRadialBlurEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_scanlines_effect")
	public static function createScanlinesEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_screen_space_fog_effect")
	public static function createScreenSpaceFogEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_sharpen_effect")
	public static function createSharpenEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_sketch_effect")
	public static function createSketchEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_smaa_effect")
	public static function createSmaaEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_ssao_effect")
	public static function createSsaoEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_ssr_effect")
	public static function createSsrEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_bayer_matrix")
	public static function createBayerMatrix(out:hl.Bytes, outLen:Int, order:Single):Int;
	@:hlNative("flight", "flight_compute_crt_mask_params")
	public static function computeCrtMaskParams(out:hl.Bytes, resolution:Single, curvature:Single):Void;
	@:hlNative("flight", "flight_compute_halftone_cell_params")
	public static function computeHalftoneCellParams(out:hl.Bytes, frequency:Single, angle:Single):Void;
	@:hlNative("flight", "flight_compute_scanline_params")
	public static function computeScanlineParams(out:hl.Bytes, resolution:Single, intensity:Single):Void;
	@:hlNative("flight", "flight_create_taa_effect")
	public static function createTaaEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_tilt_shift_effect")
	public static function createTiltShiftEffect():hl.Bytes;
	@:hlNative("flight", "flight_get_tilt_shift_effect_padding")
	public static function getTiltShiftEffectPadding(out:flight._hl.EffectPadding, effect:flight._hl.TiltShiftEffect):Void;
	@:hlNative("flight", "flight_create_tone_map_effect")
	public static function createToneMapEffect():hl.Bytes;
	@:hlNative("flight", "flight_compute_aces_tone_map")
	public static function computeAcesToneMap(x:Single):Single;
	@:hlNative("flight", "flight_compute_agx_tone_map")
	public static function computeAgxToneMap(x:Single, options:flight._hl.AgxToneMapOptions):Single;
	@:hlNative("flight", "flight_compute_exposure_scale")
	public static function computeExposureScale(exposure:Single):Single;
	@:hlNative("flight", "flight_compute_filmic_tone_map")
	public static function computeFilmicToneMap(x:Single, options:flight._hl.FilmicToneMapOptions):Single;
	@:hlNative("flight", "flight_compute_reinhard_extended_tone_map")
	public static function computeReinhardExtendedToneMap(x:Single, white:Single):Single;
	@:hlNative("flight", "flight_compute_reinhard_tone_map")
	public static function computeReinhardToneMap(x:Single):Single;
	@:hlNative("flight", "flight_compute_uncharted_2_tone_map")
	public static function computeUncharted2ToneMap(x:Single):Single;
	@:hlNative("flight", "flight_get_aces_input_matrix")
	public static function getAcesInputMatrix(out:hl.Bytes, outLen:Int):Void;
	@:hlNative("flight", "flight_get_aces_output_matrix")
	public static function getAcesOutputMatrix(out:hl.Bytes, outLen:Int):Void;
	@:hlNative("flight", "flight_create_vignette_effect")
	public static function createVignetteEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_volumetric_light_effect")
	public static function createVolumetricLightEffect():hl.Bytes;
	@:hlNative("flight", "flight_create_white_balance_effect")
	public static function createWhiteBalanceEffect():hl.Bytes;
}
