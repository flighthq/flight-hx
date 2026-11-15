package flight._cpp._fn;

extern class Effects {
	@:native("flight_create_auto_exposure_effect")
	public static function createAutoExposureEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_barrel_distortion_effect")
	public static function createBarrelDistortionEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_bevel_effect")
	public static function createBevelEffect():cpp.Star<cpp.Void>;
	@:native("flight_get_bevel_effect_padding")
	public static function getBevelEffectPadding(out:flight._cpp.EffectPadding, effect:flight._cpp.BevelEffect):Void;
	@:native("flight_create_bitmap_displacement_effect")
	public static function createBitmapDisplacementEffect():cpp.Star<cpp.Void>;
	@:native("flight_get_bitmap_displacement_effect_padding")
	public static function getBitmapDisplacementEffectPadding(out:flight._cpp.EffectPadding, effect:flight._cpp.BitmapDisplacementEffect):Void;
	@:native("flight_create_blend_effect")
	public static function createBlendEffect():cpp.Star<cpp.Void>;
	@:native("flight_blend_non_separable_rgb")
	public static function blendNonSeparableRgb(out:cpp.Star<cpp.Void>, outLen:Int, mode:cpp.ConstCharStar, cbR:Single, cbG:Single, cbB:Single, csR:Single, csG:Single, csB:Single):Void;
	@:native("flight_get_advanced_blend_rgb")
	public static function getAdvancedBlendRgb(out:cpp.Star<cpp.Void>, outLen:Int, mode:cpp.ConstCharStar, cbR:Single, cbG:Single, cbB:Single, csR:Single, csG:Single, csB:Single):Void;
	@:native("flight_get_separable_blend_channel")
	public static function getSeparableBlendChannel(mode:cpp.ConstCharStar, cb:Single, cs:Single):Single;
	@:native("flight_is_non_separable_blend_mode")
	public static function isNonSeparableBlendMode(mode:cpp.ConstCharStar):Bool;
	@:native("flight_create_bloom_effect")
	public static function createBloomEffect():cpp.Star<cpp.Void>;
	@:native("flight_compute_bloom_blur_radius")
	public static function computeBloomBlurRadius(effect:flight._cpp.BloomEffect):Single;
	@:native("flight_compute_bloom_intensity")
	public static function computeBloomIntensity(effect:flight._cpp.BloomEffect):Single;
	@:native("flight_compute_bloom_threshold")
	public static function computeBloomThreshold(effect:flight._cpp.BloomEffect):Single;
	@:native("flight_get_bloom_effect_padding")
	public static function getBloomEffectPadding(out:flight._cpp.EffectPadding, effect:flight._cpp.BloomEffect):Void;
	@:native("flight_get_blur_downsample_level")
	public static function getBlurDownsampleLevel(sigma:Single):Int;
	@:native("flight_get_blur_residual_sigma")
	public static function getBlurResidualSigma(sigma:Single, level:Int):Single;
	@:native("flight_create_blur_effect")
	public static function createBlurEffect():cpp.Star<cpp.Void>;
	@:native("flight_get_blur_effect_padding")
	public static function getBlurEffectPadding(out:flight._cpp.EffectPadding, effect:flight._cpp.BlurEffect):Void;
	@:native("flight_create_bokeh_depth_of_field_effect")
	public static function createBokehDepthOfFieldEffect():cpp.Star<cpp.Void>;
	@:native("flight_get_bokeh_depth_of_field_effect_padding")
	public static function getBokehDepthOfFieldEffectPadding(out:flight._cpp.EffectPadding, effect:flight._cpp.BokehDepthOfFieldEffect):Void;
	@:native("flight_compute_box_blur_pass_radius")
	public static function computeBoxBlurPassRadius(sigma:Single, passes:Single, pass:Single):Single;
	@:native("flight_compute_box_blur_radius")
	public static function computeBoxBlurRadius(sigma:Single, passes:Single):Single;
	@:native("flight_compute_gaussian_sigma_for_blur_radius")
	public static function computeGaussianSigmaForBlurRadius(radius:Single, passes:Single):Single;
	@:native("flight_create_camera_motion_blur_effect")
	public static function createCameraMotionBlurEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_chromatic_aberration_effect")
	public static function createChromaticAberrationEffect():cpp.Star<cpp.Void>;
	@:native("flight_compute_color_temperature_rgb")
	public static function computeColorTemperatureRgb(out:cpp.Star<cpp.Void>, kelvin:Single):Void;
	@:native("flight_compute_white_balance_multipliers")
	public static function computeWhiteBalanceMultipliers(out:cpp.Star<cpp.Void>, temperature:Single, tint:Single):Void;
	@:native("flight_create_composite_effect")
	public static function createCompositeEffect():cpp.Star<cpp.Void>;
	@:native("flight_get_composite_operator_factors")
	public static function getCompositeOperatorFactors(out:cpp.Star<cpp.Void>, outLen:Int, operator_:cpp.ConstCharStar, sourceAlpha:Single, backdropAlpha:Single):Void;
	@:native("flight_create_contact_shadows_effect")
	public static function createContactShadowsEffect():cpp.Star<cpp.Void>;
	@:native("flight_get_contact_shadows_effect_padding")
	public static function getContactShadowsEffectPadding(out:flight._cpp.EffectPadding, effect:flight._cpp.ContactShadowsEffect):Void;
	@:native("flight_create_convolution_effect")
	public static function createConvolutionEffect():cpp.Star<cpp.Void>;
	@:native("flight_get_convolution_effect_padding")
	public static function getConvolutionEffectPadding(out:flight._cpp.EffectPadding, effect:flight._cpp.ConvolutionEffect):Void;
	@:native("flight_create_crt_effect")
	public static function createCrtEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_custom_shader_effect")
	public static function createCustomShaderEffect():cpp.Star<cpp.Void>;
	@:native("flight_compute_depth_of_field_coc")
	public static function computeDepthOfFieldCoc(depth:Single, focusDistance:Single, aperture:Single, focalLength:Single):Single;
	@:native("flight_compute_linear_depth_from_nonlinear")
	public static function computeLinearDepthFromNonlinear(depth:Single, near:Single, far:Single):Single;
	@:native("flight_compute_ssao_sample_kernel")
	public static function computeSsaoSampleKernel(out:cpp.Star<cpp.Void>, outLen:Int, samples:Single):Int;
	@:native("flight_create_directional_blur_effect")
	public static function createDirectionalBlurEffect():cpp.Star<cpp.Void>;
	@:native("flight_get_directional_blur_effect_padding")
	public static function getDirectionalBlurEffectPadding(out:flight._cpp.EffectPadding, effect:flight._cpp.DirectionalBlurEffect):Void;
	@:native("flight_create_displacement_effect")
	public static function createDisplacementEffect():cpp.Star<cpp.Void>;
	@:native("flight_get_displacement_effect_padding")
	public static function getDisplacementEffectPadding(out:flight._cpp.EffectPadding, effect:flight._cpp.DisplacementEffect):Void;
	@:native("flight_create_dither_effect")
	public static function createDitherEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_drop_shadow_effect")
	public static function createDropShadowEffect():cpp.Star<cpp.Void>;
	@:native("flight_get_drop_shadow_effect_padding")
	public static function getDropShadowEffectPadding(out:flight._cpp.EffectPadding, effect:flight._cpp.DropShadowEffect):Void;
	@:native("flight_compute_outline_edge_params")
	public static function computeOutlineEdgeParams(out:cpp.Star<cpp.Void>, effect:flight._cpp.OutlineEffect):Void;
	@:native("flight_compute_outline_thickness_px")
	public static function computeOutlineThicknessPx(effect:flight._cpp.OutlineEffect):Single;
	@:native("flight_compute_sketch_edge_params")
	public static function computeSketchEdgeParams(out:cpp.Star<cpp.Void>, effect:flight._cpp.SketchEffect):Void;
	@:native("flight_get_sobel_kernel_coefficients")
	public static function getSobelKernelCoefficients(out:cpp.Star<cpp.Void>, outLen:Int):Void;
	@:native("flight_get_effect_defaults")
	public static function getEffectDefaults(out:flight._cpp.EffectDefaults, kind:cpp.ConstCharStar):Void;
	@:native("flight_normalize_effect")
	public static function normalizeEffect(effect:flight._cpp.EffectRef, out:flight._cpp.EffectRef):Bool;
	@:native("flight_can_lerp_effects")
	public static function canLerpEffects(a:flight._cpp.EffectRef, b:flight._cpp.EffectRef):Bool;
	@:native("flight_get_directional_effect_padding")
	public static function getDirectionalEffectPadding(out:flight._cpp.EffectPadding, blurX:Single, blurY:Single, offsetX:Single, offsetY:Single):Void;
	@:native("flight_get_gaussian_effect_padding")
	public static function getGaussianEffectPadding(out:flight._cpp.EffectPadding, blurX:Single, blurY:Single):Void;
	@:native("flight_validate_effect_list")
	public static function validateEffectList(effects:cpp.Star<cpp.Void>, effectsLen:Int, available:cpp.Star<cpp.Void>, availableLen:Int):Int;
	@:native("flight_create_film_emulation_effect")
	public static function createFilmEmulationEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_film_grain_effect")
	public static function createFilmGrainEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_fxaa_effect")
	public static function createFxaaEffect():cpp.Star<cpp.Void>;
	@:native("flight_compute_gaussian_kernel_weights")
	public static function computeGaussianKernelWeights(out:cpp.Star<cpp.Void>, sigma:Single):Void;
	@:native("flight_get_gaussian_kernel_size")
	public static function getGaussianKernelSize(sigma:Single):Int;
	@:native("flight_create_gaussian_kernel_weights")
	public static function createGaussianKernelWeights(out:cpp.Star<cpp.Void>, outLen:Int, radius:Single, sigma:Single):Int;
	@:native("flight_compute_gaussian_radius_from_sigma")
	public static function computeGaussianRadiusFromSigma(sigma:Single):Single;
	@:native("flight_compute_gaussian_sigma_from_radius")
	public static function computeGaussianSigmaFromRadius(radius:Single):Single;
	@:native("flight_compute_separable_blur_pass_count")
	public static function computeSeparableBlurPassCount(samples:Single):Single;
	@:native("flight_create_glitch_effect")
	public static function createGlitchEffect():cpp.Star<cpp.Void>;
	@:native("flight_get_glitch_effect_padding")
	public static function getGlitchEffectPadding(out:flight._cpp.EffectPadding, effect:flight._cpp.GlitchEffect):Void;
	@:native("flight_create_god_rays_effect")
	public static function createGodRaysEffect():cpp.Star<cpp.Void>;
	@:native("flight_compute_god_rays_accumulation_scale")
	public static function computeGodRaysAccumulationScale(effect:flight._cpp.GodRaysEffect):Single;
	@:native("flight_compute_god_rays_light_center")
	public static function computeGodRaysLightCenter(out:cpp.Star<cpp.Void>, effect:flight._cpp.GodRaysEffect):Void;
	@:native("flight_compute_god_rays_sample_weight")
	public static function computeGodRaysSampleWeight(effect:flight._cpp.GodRaysEffect, sampleIndex:Single):Single;
	@:native("flight_compute_god_rays_step_size")
	public static function computeGodRaysStepSize(out:cpp.Star<cpp.Void>, effect:flight._cpp.GodRaysEffect, px:Single, py:Single):Void;
	@:native("flight_create_gradient_bevel_effect")
	public static function createGradientBevelEffect():cpp.Star<cpp.Void>;
	@:native("flight_get_gradient_bevel_effect_padding")
	public static function getGradientBevelEffectPadding(out:flight._cpp.EffectPadding, effect:flight._cpp.GradientBevelEffect):Void;
	@:native("flight_create_gradient_glow_effect")
	public static function createGradientGlowEffect():cpp.Star<cpp.Void>;
	@:native("flight_get_gradient_glow_effect_padding")
	public static function getGradientGlowEffectPadding(out:flight._cpp.EffectPadding, effect:flight._cpp.GradientGlowEffect):Void;
	@:native("flight_create_halftone_effect")
	public static function createHalftoneEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_inner_glow_effect")
	public static function createInnerGlowEffect():cpp.Star<cpp.Void>;
	@:native("flight_get_inner_glow_effect_padding")
	public static function getInnerGlowEffectPadding(out:flight._cpp.EffectPadding, effect:flight._cpp.InnerGlowEffect):Void;
	@:native("flight_create_inner_shadow_effect")
	public static function createInnerShadowEffect():cpp.Star<cpp.Void>;
	@:native("flight_get_inner_shadow_effect_padding")
	public static function getInnerShadowEffectPadding(out:flight._cpp.EffectPadding, effect:flight._cpp.InnerShadowEffect):Void;
	@:native("flight_create_kuwahara_effect")
	public static function createKuwaharaEffect():cpp.Star<cpp.Void>;
	@:native("flight_compute_kuwahara_gaussian_weights")
	public static function computeKuwaharaGaussianWeights(out:cpp.Star<cpp.Void>, outLen:Int, radius:Single):Int;
	@:native("flight_compute_kuwahara_sector_offsets")
	public static function computeKuwaharaSectorOffsets(out:cpp.Star<cpp.Void>, radius:Single):Void;
	@:native("flight_compute_kuwahara_sector_pixel_count")
	public static function computeKuwaharaSectorPixelCount(effect:flight._cpp.KuwaharaEffect):Int;
	@:native("flight_compute_kuwahara_sector_size")
	public static function computeKuwaharaSectorSize(effect:flight._cpp.KuwaharaEffect):Int;
	@:native("flight_create_lens_dirt_effect")
	public static function createLensDirtEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_lens_distortion_effect")
	public static function createLensDistortionEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_lens_flare_effect")
	public static function createLensFlareEffect():cpp.Star<cpp.Void>;
	@:native("flight_compute_linear_sampled_gaussian")
	public static function computeLinearSampledGaussian(outWeights:cpp.Star<cpp.Void>, outOffsets:cpp.Star<cpp.Void>, sigma:Single):Void;
	@:native("flight_get_linear_sampled_gaussian_tap_count")
	public static function getLinearSampledGaussianTapCount(sigma:Single):Int;
	@:native("flight_create_median_effect")
	public static function createMedianEffect():cpp.Star<cpp.Void>;
	@:native("flight_get_median_effect_padding")
	public static function getMedianEffectPadding(out:flight._cpp.EffectPadding, effect:flight._cpp.MedianEffect):Void;
	@:native("flight_create_motion_blur_effect")
	public static function createMotionBlurEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_outer_glow_effect")
	public static function createOuterGlowEffect():cpp.Star<cpp.Void>;
	@:native("flight_get_outer_glow_effect_padding")
	public static function getOuterGlowEffectPadding(out:flight._cpp.EffectPadding, effect:flight._cpp.OuterGlowEffect):Void;
	@:native("flight_create_outline_effect")
	public static function createOutlineEffect():cpp.Star<cpp.Void>;
	@:native("flight_get_outline_effect_padding")
	public static function getOutlineEffectPadding(out:flight._cpp.EffectPadding, effect:flight._cpp.OutlineEffect):Void;
	@:native("flight_create_pannini_projection_effect")
	public static function createPanniniProjectionEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_pixelate_effect")
	public static function createPixelateEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_posterize_effect")
	public static function createPosterizeEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_radial_blur_effect")
	public static function createRadialBlurEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_scanlines_effect")
	public static function createScanlinesEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_screen_space_fog_effect")
	public static function createScreenSpaceFogEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_sharpen_effect")
	public static function createSharpenEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_sketch_effect")
	public static function createSketchEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_smaa_effect")
	public static function createSmaaEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_ssao_effect")
	public static function createSsaoEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_ssr_effect")
	public static function createSsrEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_bayer_matrix")
	public static function createBayerMatrix(out:cpp.Star<cpp.Void>, outLen:Int, order:Single):Int;
	@:native("flight_compute_crt_mask_params")
	public static function computeCrtMaskParams(out:cpp.Star<cpp.Void>, resolution:Single, curvature:Single):Void;
	@:native("flight_compute_halftone_cell_params")
	public static function computeHalftoneCellParams(out:cpp.Star<cpp.Void>, frequency:Single, angle:Single):Void;
	@:native("flight_compute_scanline_params")
	public static function computeScanlineParams(out:cpp.Star<cpp.Void>, resolution:Single, intensity:Single):Void;
	@:native("flight_create_taa_effect")
	public static function createTaaEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_tilt_shift_effect")
	public static function createTiltShiftEffect():cpp.Star<cpp.Void>;
	@:native("flight_get_tilt_shift_effect_padding")
	public static function getTiltShiftEffectPadding(out:flight._cpp.EffectPadding, effect:flight._cpp.TiltShiftEffect):Void;
	@:native("flight_create_tone_map_effect")
	public static function createToneMapEffect():cpp.Star<cpp.Void>;
	@:native("flight_compute_aces_tone_map")
	public static function computeAcesToneMap(x:Single):Single;
	@:native("flight_compute_agx_tone_map")
	public static function computeAgxToneMap(x:Single, options:flight._cpp.AgxToneMapOptions):Single;
	@:native("flight_compute_exposure_scale")
	public static function computeExposureScale(exposure:Single):Single;
	@:native("flight_compute_filmic_tone_map")
	public static function computeFilmicToneMap(x:Single, options:flight._cpp.FilmicToneMapOptions):Single;
	@:native("flight_compute_reinhard_extended_tone_map")
	public static function computeReinhardExtendedToneMap(x:Single, white:Single):Single;
	@:native("flight_compute_reinhard_tone_map")
	public static function computeReinhardToneMap(x:Single):Single;
	@:native("flight_compute_uncharted_2_tone_map")
	public static function computeUncharted2ToneMap(x:Single):Single;
	@:native("flight_get_aces_input_matrix")
	public static function getAcesInputMatrix(out:cpp.Star<cpp.Void>, outLen:Int):Void;
	@:native("flight_get_aces_output_matrix")
	public static function getAcesOutputMatrix(out:cpp.Star<cpp.Void>, outLen:Int):Void;
	@:native("flight_create_vignette_effect")
	public static function createVignetteEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_volumetric_light_effect")
	public static function createVolumetricLightEffect():cpp.Star<cpp.Void>;
	@:native("flight_create_white_balance_effect")
	public static function createWhiteBalanceEffect():cpp.Star<cpp.Void>;
}
