package flight._js._fn;

@:jsRequire("flight")
extern class Effects {
	@:native("flight_create_auto_exposure_effect")
	public static function createAutoExposureEffect():Dynamic;
	@:native("flight_create_barrel_distortion_effect")
	public static function createBarrelDistortionEffect():Dynamic;
	@:native("flight_create_bevel_effect")
	public static function createBevelEffect():Dynamic;
	@:native("flight_get_bevel_effect_padding")
	public static function getBevelEffectPadding(out:flight._js.EffectPadding, effect:flight._js.BevelEffect):Void;
	@:native("flight_create_bitmap_displacement_effect")
	public static function createBitmapDisplacementEffect():Dynamic;
	@:native("flight_get_bitmap_displacement_effect_padding")
	public static function getBitmapDisplacementEffectPadding(out:flight._js.EffectPadding, effect:flight._js.BitmapDisplacementEffect):Void;
	@:native("flight_create_blend_effect")
	public static function createBlendEffect():Dynamic;
	@:native("flight_blend_non_separable_rgb")
	public static function blendNonSeparableRgb(out:Dynamic, outLen:Int, mode:String, cbR:Float, cbG:Float, cbB:Float, csR:Float, csG:Float, csB:Float):Void;
	@:native("flight_get_advanced_blend_rgb")
	public static function getAdvancedBlendRgb(out:Dynamic, outLen:Int, mode:String, cbR:Float, cbG:Float, cbB:Float, csR:Float, csG:Float, csB:Float):Void;
	@:native("flight_get_separable_blend_channel")
	public static function getSeparableBlendChannel(mode:String, cb:Float, cs:Float):Float;
	@:native("flight_is_non_separable_blend_mode")
	public static function isNonSeparableBlendMode(mode:String):Bool;
	@:native("flight_create_bloom_effect")
	public static function createBloomEffect():Dynamic;
	@:native("flight_compute_bloom_blur_radius")
	public static function computeBloomBlurRadius(effect:flight._js.BloomEffect):Float;
	@:native("flight_compute_bloom_intensity")
	public static function computeBloomIntensity(effect:flight._js.BloomEffect):Float;
	@:native("flight_compute_bloom_threshold")
	public static function computeBloomThreshold(effect:flight._js.BloomEffect):Float;
	@:native("flight_get_bloom_effect_padding")
	public static function getBloomEffectPadding(out:flight._js.EffectPadding, effect:flight._js.BloomEffect):Void;
	@:native("flight_get_blur_downsample_level")
	public static function getBlurDownsampleLevel(sigma:Float):Int;
	@:native("flight_get_blur_residual_sigma")
	public static function getBlurResidualSigma(sigma:Float, level:Int):Float;
	@:native("flight_create_blur_effect")
	public static function createBlurEffect():Dynamic;
	@:native("flight_get_blur_effect_padding")
	public static function getBlurEffectPadding(out:flight._js.EffectPadding, effect:flight._js.BlurEffect):Void;
	@:native("flight_create_bokeh_depth_of_field_effect")
	public static function createBokehDepthOfFieldEffect():Dynamic;
	@:native("flight_get_bokeh_depth_of_field_effect_padding")
	public static function getBokehDepthOfFieldEffectPadding(out:flight._js.EffectPadding, effect:flight._js.BokehDepthOfFieldEffect):Void;
	@:native("flight_compute_box_blur_pass_radius")
	public static function computeBoxBlurPassRadius(sigma:Float, passes:Float, pass:Float):Float;
	@:native("flight_compute_box_blur_radius")
	public static function computeBoxBlurRadius(sigma:Float, passes:Float):Float;
	@:native("flight_compute_gaussian_sigma_for_blur_radius")
	public static function computeGaussianSigmaForBlurRadius(radius:Float, passes:Float):Float;
	@:native("flight_create_camera_motion_blur_effect")
	public static function createCameraMotionBlurEffect():Dynamic;
	@:native("flight_create_chromatic_aberration_effect")
	public static function createChromaticAberrationEffect():Dynamic;
	@:native("flight_compute_color_temperature_rgb")
	public static function computeColorTemperatureRgb(out:Dynamic, kelvin:Float):Void;
	@:native("flight_compute_white_balance_multipliers")
	public static function computeWhiteBalanceMultipliers(out:Dynamic, temperature:Float, tint:Float):Void;
	@:native("flight_create_composite_effect")
	public static function createCompositeEffect():Dynamic;
	@:native("flight_get_composite_operator_factors")
	public static function getCompositeOperatorFactors(out:Dynamic, outLen:Int, operator_:String, sourceAlpha:Float, backdropAlpha:Float):Void;
	@:native("flight_create_contact_shadows_effect")
	public static function createContactShadowsEffect():Dynamic;
	@:native("flight_get_contact_shadows_effect_padding")
	public static function getContactShadowsEffectPadding(out:flight._js.EffectPadding, effect:flight._js.ContactShadowsEffect):Void;
	@:native("flight_create_convolution_effect")
	public static function createConvolutionEffect():Dynamic;
	@:native("flight_get_convolution_effect_padding")
	public static function getConvolutionEffectPadding(out:flight._js.EffectPadding, effect:flight._js.ConvolutionEffect):Void;
	@:native("flight_create_crt_effect")
	public static function createCrtEffect():Dynamic;
	@:native("flight_create_custom_shader_effect")
	public static function createCustomShaderEffect():Dynamic;
	@:native("flight_compute_depth_of_field_coc")
	public static function computeDepthOfFieldCoc(depth:Float, focusDistance:Float, aperture:Float, focalLength:Float):Float;
	@:native("flight_compute_linear_depth_from_nonlinear")
	public static function computeLinearDepthFromNonlinear(depth:Float, near:Float, far:Float):Float;
	@:native("flight_compute_ssao_sample_kernel")
	public static function computeSsaoSampleKernel(out:Dynamic, outLen:Int, samples:Float):Int;
	@:native("flight_create_directional_blur_effect")
	public static function createDirectionalBlurEffect():Dynamic;
	@:native("flight_get_directional_blur_effect_padding")
	public static function getDirectionalBlurEffectPadding(out:flight._js.EffectPadding, effect:flight._js.DirectionalBlurEffect):Void;
	@:native("flight_create_displacement_effect")
	public static function createDisplacementEffect():Dynamic;
	@:native("flight_get_displacement_effect_padding")
	public static function getDisplacementEffectPadding(out:flight._js.EffectPadding, effect:flight._js.DisplacementEffect):Void;
	@:native("flight_create_dither_effect")
	public static function createDitherEffect():Dynamic;
	@:native("flight_create_drop_shadow_effect")
	public static function createDropShadowEffect():Dynamic;
	@:native("flight_get_drop_shadow_effect_padding")
	public static function getDropShadowEffectPadding(out:flight._js.EffectPadding, effect:flight._js.DropShadowEffect):Void;
	@:native("flight_compute_outline_edge_params")
	public static function computeOutlineEdgeParams(out:Dynamic, effect:flight._js.OutlineEffect):Void;
	@:native("flight_compute_outline_thickness_px")
	public static function computeOutlineThicknessPx(effect:flight._js.OutlineEffect):Float;
	@:native("flight_compute_sketch_edge_params")
	public static function computeSketchEdgeParams(out:Dynamic, effect:flight._js.SketchEffect):Void;
	@:native("flight_get_sobel_kernel_coefficients")
	public static function getSobelKernelCoefficients(out:Dynamic, outLen:Int):Void;
	@:native("flight_get_effect_defaults")
	public static function getEffectDefaults(out:flight._js.EffectDefaults, kind:String):Void;
	@:native("flight_normalize_effect")
	public static function normalizeEffect(effect:flight._js.EffectRef, out:flight._js.EffectRef):Bool;
	@:native("flight_can_lerp_effects")
	public static function canLerpEffects(a:flight._js.EffectRef, b:flight._js.EffectRef):Bool;
	@:native("flight_get_directional_effect_padding")
	public static function getDirectionalEffectPadding(out:flight._js.EffectPadding, blurX:Float, blurY:Float, offsetX:Float, offsetY:Float):Void;
	@:native("flight_get_gaussian_effect_padding")
	public static function getGaussianEffectPadding(out:flight._js.EffectPadding, blurX:Float, blurY:Float):Void;
	@:native("flight_validate_effect_list")
	public static function validateEffectList(effects:Dynamic, effectsLen:Int, available:Dynamic, availableLen:Int):Int;
	@:native("flight_create_film_emulation_effect")
	public static function createFilmEmulationEffect():Dynamic;
	@:native("flight_create_film_grain_effect")
	public static function createFilmGrainEffect():Dynamic;
	@:native("flight_create_fxaa_effect")
	public static function createFxaaEffect():Dynamic;
	@:native("flight_compute_gaussian_kernel_weights")
	public static function computeGaussianKernelWeights(out:Dynamic, sigma:Float):Void;
	@:native("flight_get_gaussian_kernel_size")
	public static function getGaussianKernelSize(sigma:Float):Int;
	@:native("flight_create_gaussian_kernel_weights")
	public static function createGaussianKernelWeights(out:Dynamic, outLen:Int, radius:Float, sigma:Float):Int;
	@:native("flight_compute_gaussian_radius_from_sigma")
	public static function computeGaussianRadiusFromSigma(sigma:Float):Float;
	@:native("flight_compute_gaussian_sigma_from_radius")
	public static function computeGaussianSigmaFromRadius(radius:Float):Float;
	@:native("flight_compute_separable_blur_pass_count")
	public static function computeSeparableBlurPassCount(samples:Float):Float;
	@:native("flight_create_glitch_effect")
	public static function createGlitchEffect():Dynamic;
	@:native("flight_get_glitch_effect_padding")
	public static function getGlitchEffectPadding(out:flight._js.EffectPadding, effect:flight._js.GlitchEffect):Void;
	@:native("flight_create_god_rays_effect")
	public static function createGodRaysEffect():Dynamic;
	@:native("flight_compute_god_rays_accumulation_scale")
	public static function computeGodRaysAccumulationScale(effect:flight._js.GodRaysEffect):Float;
	@:native("flight_compute_god_rays_light_center")
	public static function computeGodRaysLightCenter(out:Dynamic, effect:flight._js.GodRaysEffect):Void;
	@:native("flight_compute_god_rays_sample_weight")
	public static function computeGodRaysSampleWeight(effect:flight._js.GodRaysEffect, sampleIndex:Float):Float;
	@:native("flight_compute_god_rays_step_size")
	public static function computeGodRaysStepSize(out:Dynamic, effect:flight._js.GodRaysEffect, px:Float, py:Float):Void;
	@:native("flight_create_gradient_bevel_effect")
	public static function createGradientBevelEffect():Dynamic;
	@:native("flight_get_gradient_bevel_effect_padding")
	public static function getGradientBevelEffectPadding(out:flight._js.EffectPadding, effect:flight._js.GradientBevelEffect):Void;
	@:native("flight_create_gradient_glow_effect")
	public static function createGradientGlowEffect():Dynamic;
	@:native("flight_get_gradient_glow_effect_padding")
	public static function getGradientGlowEffectPadding(out:flight._js.EffectPadding, effect:flight._js.GradientGlowEffect):Void;
	@:native("flight_create_halftone_effect")
	public static function createHalftoneEffect():Dynamic;
	@:native("flight_create_inner_glow_effect")
	public static function createInnerGlowEffect():Dynamic;
	@:native("flight_get_inner_glow_effect_padding")
	public static function getInnerGlowEffectPadding(out:flight._js.EffectPadding, effect:flight._js.InnerGlowEffect):Void;
	@:native("flight_create_inner_shadow_effect")
	public static function createInnerShadowEffect():Dynamic;
	@:native("flight_get_inner_shadow_effect_padding")
	public static function getInnerShadowEffectPadding(out:flight._js.EffectPadding, effect:flight._js.InnerShadowEffect):Void;
	@:native("flight_create_kuwahara_effect")
	public static function createKuwaharaEffect():Dynamic;
	@:native("flight_compute_kuwahara_gaussian_weights")
	public static function computeKuwaharaGaussianWeights(out:Dynamic, outLen:Int, radius:Float):Int;
	@:native("flight_compute_kuwahara_sector_offsets")
	public static function computeKuwaharaSectorOffsets(out:Dynamic, radius:Float):Void;
	@:native("flight_compute_kuwahara_sector_pixel_count")
	public static function computeKuwaharaSectorPixelCount(effect:flight._js.KuwaharaEffect):Int;
	@:native("flight_compute_kuwahara_sector_size")
	public static function computeKuwaharaSectorSize(effect:flight._js.KuwaharaEffect):Int;
	@:native("flight_create_lens_dirt_effect")
	public static function createLensDirtEffect():Dynamic;
	@:native("flight_create_lens_distortion_effect")
	public static function createLensDistortionEffect():Dynamic;
	@:native("flight_create_lens_flare_effect")
	public static function createLensFlareEffect():Dynamic;
	@:native("flight_compute_linear_sampled_gaussian")
	public static function computeLinearSampledGaussian(outWeights:Dynamic, outOffsets:Dynamic, sigma:Float):Void;
	@:native("flight_get_linear_sampled_gaussian_tap_count")
	public static function getLinearSampledGaussianTapCount(sigma:Float):Int;
	@:native("flight_create_median_effect")
	public static function createMedianEffect():Dynamic;
	@:native("flight_get_median_effect_padding")
	public static function getMedianEffectPadding(out:flight._js.EffectPadding, effect:flight._js.MedianEffect):Void;
	@:native("flight_create_motion_blur_effect")
	public static function createMotionBlurEffect():Dynamic;
	@:native("flight_create_outer_glow_effect")
	public static function createOuterGlowEffect():Dynamic;
	@:native("flight_get_outer_glow_effect_padding")
	public static function getOuterGlowEffectPadding(out:flight._js.EffectPadding, effect:flight._js.OuterGlowEffect):Void;
	@:native("flight_create_outline_effect")
	public static function createOutlineEffect():Dynamic;
	@:native("flight_get_outline_effect_padding")
	public static function getOutlineEffectPadding(out:flight._js.EffectPadding, effect:flight._js.OutlineEffect):Void;
	@:native("flight_create_pannini_projection_effect")
	public static function createPanniniProjectionEffect():Dynamic;
	@:native("flight_create_pixelate_effect")
	public static function createPixelateEffect():Dynamic;
	@:native("flight_create_posterize_effect")
	public static function createPosterizeEffect():Dynamic;
	@:native("flight_create_radial_blur_effect")
	public static function createRadialBlurEffect():Dynamic;
	@:native("flight_create_scanlines_effect")
	public static function createScanlinesEffect():Dynamic;
	@:native("flight_create_screen_space_fog_effect")
	public static function createScreenSpaceFogEffect():Dynamic;
	@:native("flight_create_sharpen_effect")
	public static function createSharpenEffect():Dynamic;
	@:native("flight_create_sketch_effect")
	public static function createSketchEffect():Dynamic;
	@:native("flight_create_smaa_effect")
	public static function createSmaaEffect():Dynamic;
	@:native("flight_create_ssao_effect")
	public static function createSsaoEffect():Dynamic;
	@:native("flight_create_ssr_effect")
	public static function createSsrEffect():Dynamic;
	@:native("flight_create_bayer_matrix")
	public static function createBayerMatrix(out:Dynamic, outLen:Int, order:Float):Int;
	@:native("flight_compute_crt_mask_params")
	public static function computeCrtMaskParams(out:Dynamic, resolution:Float, curvature:Float):Void;
	@:native("flight_compute_halftone_cell_params")
	public static function computeHalftoneCellParams(out:Dynamic, frequency:Float, angle:Float):Void;
	@:native("flight_compute_scanline_params")
	public static function computeScanlineParams(out:Dynamic, resolution:Float, intensity:Float):Void;
	@:native("flight_create_taa_effect")
	public static function createTaaEffect():Dynamic;
	@:native("flight_create_tilt_shift_effect")
	public static function createTiltShiftEffect():Dynamic;
	@:native("flight_get_tilt_shift_effect_padding")
	public static function getTiltShiftEffectPadding(out:flight._js.EffectPadding, effect:flight._js.TiltShiftEffect):Void;
	@:native("flight_create_tone_map_effect")
	public static function createToneMapEffect():Dynamic;
	@:native("flight_compute_aces_tone_map")
	public static function computeAcesToneMap(x:Float):Float;
	@:native("flight_compute_agx_tone_map")
	public static function computeAgxToneMap(x:Float, options:flight._js.AgxToneMapOptions):Float;
	@:native("flight_compute_exposure_scale")
	public static function computeExposureScale(exposure:Float):Float;
	@:native("flight_compute_filmic_tone_map")
	public static function computeFilmicToneMap(x:Float, options:flight._js.FilmicToneMapOptions):Float;
	@:native("flight_compute_reinhard_extended_tone_map")
	public static function computeReinhardExtendedToneMap(x:Float, white:Float):Float;
	@:native("flight_compute_reinhard_tone_map")
	public static function computeReinhardToneMap(x:Float):Float;
	@:native("flight_compute_uncharted_2_tone_map")
	public static function computeUncharted2ToneMap(x:Float):Float;
	@:native("flight_get_aces_input_matrix")
	public static function getAcesInputMatrix(out:Dynamic, outLen:Int):Void;
	@:native("flight_get_aces_output_matrix")
	public static function getAcesOutputMatrix(out:Dynamic, outLen:Int):Void;
	@:native("flight_create_vignette_effect")
	public static function createVignetteEffect():Dynamic;
	@:native("flight_create_volumetric_light_effect")
	public static function createVolumetricLightEffect():Dynamic;
	@:native("flight_create_white_balance_effect")
	public static function createWhiteBalanceEffect():Dynamic;
}
