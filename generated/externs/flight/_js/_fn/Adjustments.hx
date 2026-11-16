package flight._js._fn;

@:jsRequire("flight")
extern class Adjustments {
	@:native("flight_create_brightness_contrast_adjustment")
	public static function createBrightnessContrastAdjustment(options:flight._js.BrightnessContrastAdjustmentOptions):flight._js.BrightnessContrastAdjustment;
	@:native("flight_create_channel_mixer_adjustment")
	public static function createChannelMixerAdjustment(options:flight._js.ChannelMixerAdjustmentOptions):flight._js.ChannelMixerAdjustment;
	@:native("flight_is_affine_color_matrix")
	public static function isAffineColorMatrix(matrix:Dynamic):Bool;
	@:native("flight_create_color_blind_simulation_adjustment")
	public static function createColorBlindSimulationAdjustment(options:flight._js.ColorBlindSimulationAdjustmentOptions):flight._js.ColorBlindSimulationAdjustment;
	@:native("flight_create_color_grade_adjustment")
	public static function createColorGradeAdjustment(options:flight._js.ColorGradeAdjustmentOptions):flight._js.ColorGradeAdjustment;
	@:native("flight_bake_color_lut")
	public static function bakeColorLut(transforms:Dynamic, transformsLen:Int, size:haxe.Int64):flight._js.ColorLut;
	@:native("flight_sample_color_lut")
	public static function sampleColorLut(lut:flight._js.ColorLut, out:Dynamic, r:Float, g:Float, b:Float):Void;
	@:native("flight_get_adjustment_color_transform__brightness_contrast_adjustment")
	public static function getAdjustmentColorTransformBrightnessContrastAdjustment(operation:flight._js.BrightnessContrastAdjustment):Dynamic;
	@:native("flight_get_adjustment_color_transform__channel_mixer_adjustment")
	public static function getAdjustmentColorTransformChannelMixerAdjustment(operation:flight._js.ChannelMixerAdjustment):Dynamic;
	@:native("flight_get_adjustment_color_transform__color_blind_simulation_adjustment")
	public static function getAdjustmentColorTransformColorBlindSimulationAdjustment(operation:flight._js.ColorBlindSimulationAdjustment):Dynamic;
	@:native("flight_get_adjustment_color_transform__color_grade_adjustment")
	public static function getAdjustmentColorTransformColorGradeAdjustment(operation:flight._js.ColorGradeAdjustment):Dynamic;
	@:native("flight_get_adjustment_color_transform__color_matrix_adjustment")
	public static function getAdjustmentColorTransformColorMatrixAdjustment(operation:flight._js.ColorMatrixAdjustment):Dynamic;
	@:native("flight_get_adjustment_color_transform__color_scale_bias_adjustment")
	public static function getAdjustmentColorTransformColorScaleBiasAdjustment(operation:flight._js.ColorScaleBiasAdjustment):Dynamic;
	@:native("flight_get_adjustment_color_transform__exposure_adjustment")
	public static function getAdjustmentColorTransformExposureAdjustment(operation:flight._js.ExposureAdjustment):Dynamic;
	@:native("flight_get_adjustment_color_transform__grayscale_adjustment")
	public static function getAdjustmentColorTransformGrayscaleAdjustment(operation:flight._js.GrayscaleAdjustment):Dynamic;
	@:native("flight_get_adjustment_color_transform__hue_saturation_adjustment")
	public static function getAdjustmentColorTransformHueSaturationAdjustment(operation:flight._js.HueSaturationAdjustment):Dynamic;
	@:native("flight_get_adjustment_color_transform__invert_adjustment")
	public static function getAdjustmentColorTransformInvertAdjustment(operation:flight._js.InvertAdjustment):Dynamic;
	@:native("flight_get_adjustment_color_transform__lift_gamma_gain_adjustment")
	public static function getAdjustmentColorTransformLiftGammaGainAdjustment(operation:flight._js.LiftGammaGainAdjustment):Dynamic;
	@:native("flight_get_adjustment_color_transform__lookup_table_grade_adjustment")
	public static function getAdjustmentColorTransformLookupTableGradeAdjustment(operation:flight._js.LookupTableGradeAdjustment):Dynamic;
	@:native("flight_get_adjustment_color_transform__sepia_adjustment")
	public static function getAdjustmentColorTransformSepiaAdjustment(operation:flight._js.SepiaAdjustment):Dynamic;
	@:native("flight_get_adjustment_color_transform__tint_adjustment")
	public static function getAdjustmentColorTransformTintAdjustment(operation:flight._js.TintAdjustment):Dynamic;
	@:native("flight_is_color_lut_adjustment__brightness_contrast_adjustment")
	public static function isColorLutAdjustmentBrightnessContrastAdjustment(operation:flight._js.BrightnessContrastAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__channel_mixer_adjustment")
	public static function isColorLutAdjustmentChannelMixerAdjustment(operation:flight._js.ChannelMixerAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__color_blind_simulation_adjustment")
	public static function isColorLutAdjustmentColorBlindSimulationAdjustment(operation:flight._js.ColorBlindSimulationAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__color_grade_adjustment")
	public static function isColorLutAdjustmentColorGradeAdjustment(operation:flight._js.ColorGradeAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__color_matrix_adjustment")
	public static function isColorLutAdjustmentColorMatrixAdjustment(operation:flight._js.ColorMatrixAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__color_scale_bias_adjustment")
	public static function isColorLutAdjustmentColorScaleBiasAdjustment(operation:flight._js.ColorScaleBiasAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__exposure_adjustment")
	public static function isColorLutAdjustmentExposureAdjustment(operation:flight._js.ExposureAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__grayscale_adjustment")
	public static function isColorLutAdjustmentGrayscaleAdjustment(operation:flight._js.GrayscaleAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__hue_saturation_adjustment")
	public static function isColorLutAdjustmentHueSaturationAdjustment(operation:flight._js.HueSaturationAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__invert_adjustment")
	public static function isColorLutAdjustmentInvertAdjustment(operation:flight._js.InvertAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__lift_gamma_gain_adjustment")
	public static function isColorLutAdjustmentLiftGammaGainAdjustment(operation:flight._js.LiftGammaGainAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__lookup_table_grade_adjustment")
	public static function isColorLutAdjustmentLookupTableGradeAdjustment(operation:flight._js.LookupTableGradeAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__sepia_adjustment")
	public static function isColorLutAdjustmentSepiaAdjustment(operation:flight._js.SepiaAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__tint_adjustment")
	public static function isColorLutAdjustmentTintAdjustment(operation:flight._js.TintAdjustment):Bool;
	@:native("flight_create_color_lut_cache")
	public static function createColorLutCache():flight._js.ColorLutCache;
	@:native("flight_create_color_matrix_adjustment")
	public static function createColorMatrixAdjustment(colorMatrix:Dynamic):flight._js.ColorMatrixAdjustment;
	@:native("flight_is_color_matrix_adjustment__brightness_contrast_adjustment")
	public static function isColorMatrixAdjustmentBrightnessContrastAdjustment(operation:flight._js.BrightnessContrastAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__channel_mixer_adjustment")
	public static function isColorMatrixAdjustmentChannelMixerAdjustment(operation:flight._js.ChannelMixerAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__color_blind_simulation_adjustment")
	public static function isColorMatrixAdjustmentColorBlindSimulationAdjustment(operation:flight._js.ColorBlindSimulationAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__color_grade_adjustment")
	public static function isColorMatrixAdjustmentColorGradeAdjustment(operation:flight._js.ColorGradeAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__color_matrix_adjustment")
	public static function isColorMatrixAdjustmentColorMatrixAdjustment(operation:flight._js.ColorMatrixAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__color_scale_bias_adjustment")
	public static function isColorMatrixAdjustmentColorScaleBiasAdjustment(operation:flight._js.ColorScaleBiasAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__exposure_adjustment")
	public static function isColorMatrixAdjustmentExposureAdjustment(operation:flight._js.ExposureAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__grayscale_adjustment")
	public static function isColorMatrixAdjustmentGrayscaleAdjustment(operation:flight._js.GrayscaleAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__hue_saturation_adjustment")
	public static function isColorMatrixAdjustmentHueSaturationAdjustment(operation:flight._js.HueSaturationAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__invert_adjustment")
	public static function isColorMatrixAdjustmentInvertAdjustment(operation:flight._js.InvertAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__lift_gamma_gain_adjustment")
	public static function isColorMatrixAdjustmentLiftGammaGainAdjustment(operation:flight._js.LiftGammaGainAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__lookup_table_grade_adjustment")
	public static function isColorMatrixAdjustmentLookupTableGradeAdjustment(operation:flight._js.LookupTableGradeAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__sepia_adjustment")
	public static function isColorMatrixAdjustmentSepiaAdjustment(operation:flight._js.SepiaAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__tint_adjustment")
	public static function isColorMatrixAdjustmentTintAdjustment(operation:flight._js.TintAdjustment):Bool;
	@:native("flight_create_brightness_color_matrix")
	public static function createBrightnessColorMatrix(amount:Float):Dynamic;
	@:native("flight_create_channel_mixer_color_matrix")
	public static function createChannelMixerColorMatrix(redOut:Dynamic, greenOut:Dynamic, blueOut:Dynamic):Dynamic;
	@:native("flight_create_color_balance_color_matrix")
	public static function createColorBalanceColorMatrix(shadows:Dynamic, midtones:Dynamic, highlights:Dynamic):Dynamic;
	@:native("flight_create_color_matrix_from_tint")
	public static function createColorMatrixFromTint(packedRgba:Int, amount:Float):Dynamic;
	@:native("flight_create_contrast_color_matrix")
	public static function createContrastColorMatrix(amount:Float):Dynamic;
	@:native("flight_create_desaturate_color_matrix")
	public static function createDesaturateColorMatrix(amount:Float):Dynamic;
	@:native("flight_create_grayscale_color_matrix")
	public static function createGrayscaleColorMatrix():Dynamic;
	@:native("flight_create_hue_rotate_color_matrix")
	public static function createHueRotateColorMatrix(degrees:Float):Dynamic;
	@:native("flight_create_identity_color_matrix")
	public static function createIdentityColorMatrix():Dynamic;
	@:native("flight_create_invert_color_matrix")
	public static function createInvertColorMatrix():Dynamic;
	@:native("flight_create_levels_color_matrix")
	public static function createLevelsColorMatrix(inBlack:Float, inWhite:Float, outBlack:Float, outWhite:Float, gamma:Float):Dynamic;
	@:native("flight_create_opacity_color_matrix")
	public static function createOpacityColorMatrix(alpha:Float):Dynamic;
	@:native("flight_create_polaroid_color_matrix")
	public static function createPolaroidColorMatrix():Dynamic;
	@:native("flight_create_saturation_color_matrix")
	public static function createSaturationColorMatrix(amount:Float):Dynamic;
	@:native("flight_create_sepia_color_matrix")
	public static function createSepiaColorMatrix():Dynamic;
	@:native("flight_create_technicolor_color_matrix")
	public static function createTechnicolorColorMatrix():Dynamic;
	@:native("flight_create_vintage_color_matrix")
	public static function createVintageColorMatrix():Dynamic;
	@:native("flight_create_white_balance_color_matrix")
	public static function createWhiteBalanceColorMatrix(temperature:Float, tint:Float):Dynamic;
	@:native("flight_apply_color_matrix_to_color")
	public static function applyColorMatrixToColor(matrix:Dynamic, packedRgba:Int):Int;
	@:native("flight_concat_color_matrix")
	public static function concatColorMatrix(target:Dynamic, source:Dynamic):Void;
	@:native("flight_multiply_color_matrix")
	public static function multiplyColorMatrix(out:Dynamic, a:Dynamic, b:Dynamic):Void;
	@:native("flight_create_color_scale_bias_adjustment")
	public static function createColorScaleBiasAdjustment(colorScaleBias:flight._js.ColorScaleBias):flight._js.ColorScaleBiasAdjustment;
	@:native("flight_create_exposure_adjustment")
	public static function createExposureAdjustment(options:flight._js.ExposureAdjustmentOptions):flight._js.ExposureAdjustment;
	@:native("flight_create_grayscale_adjustment")
	public static function createGrayscaleAdjustment(options:flight._js.GrayscaleAdjustmentOptions):flight._js.GrayscaleAdjustment;
	@:native("flight_create_hue_saturation_adjustment")
	public static function createHueSaturationAdjustment(options:flight._js.HueSaturationAdjustmentOptions):flight._js.HueSaturationAdjustment;
	@:native("flight_create_invert_adjustment")
	public static function createInvertAdjustment(options:flight._js.InvertAdjustmentOptions):flight._js.InvertAdjustment;
	@:native("flight_create_lift_gamma_gain_adjustment")
	public static function createLiftGammaGainAdjustment(options:flight._js.LiftGammaGainAdjustmentOptions):flight._js.LiftGammaGainAdjustment;
	@:native("flight_create_lookup_table_grade_adjustment")
	public static function createLookupTableGradeAdjustment(options:flight._js.LookupTableGradeAdjustmentOptions):flight._js.LookupTableGradeAdjustment;
	@:native("flight_create_sepia_adjustment")
	public static function createSepiaAdjustment(options:flight._js.SepiaAdjustmentOptions):flight._js.SepiaAdjustment;
	@:native("flight_create_tint_adjustment")
	public static function createTintAdjustment(rgba:Int):flight._js.TintAdjustment;
	@:native("flight_free_brightness_contrast_adjustment")
	public static function freeBrightnessContrastAdjustment(ptr:flight._js.BrightnessContrastAdjustment):Void;
	@:native("flight_free_channel_mixer_adjustment")
	public static function freeChannelMixerAdjustment(ptr:flight._js.ChannelMixerAdjustment):Void;
	@:native("flight_free_color_blind_simulation_adjustment")
	public static function freeColorBlindSimulationAdjustment(ptr:flight._js.ColorBlindSimulationAdjustment):Void;
	@:native("flight_free_color_grade_adjustment")
	public static function freeColorGradeAdjustment(ptr:flight._js.ColorGradeAdjustment):Void;
	@:native("flight_free_color_lut")
	public static function freeColorLut(ptr:flight._js.ColorLut):Void;
	@:native("flight_free_color_transform_function")
	public static function freeColorTransformFunction(ptr:flight._js.ColorTransformFunction):Void;
	@:native("flight_free_color_lut_cache")
	public static function freeColorLutCache(ptr:flight._js.ColorLutCache):Void;
	@:native("flight_free_color_matrix_adjustment")
	public static function freeColorMatrixAdjustment(ptr:flight._js.ColorMatrixAdjustment):Void;
	@:native("flight_free_color_scale_bias_adjustment")
	public static function freeColorScaleBiasAdjustment(ptr:flight._js.ColorScaleBiasAdjustment):Void;
	@:native("flight_free_exposure_adjustment")
	public static function freeExposureAdjustment(ptr:flight._js.ExposureAdjustment):Void;
	@:native("flight_free_grayscale_adjustment")
	public static function freeGrayscaleAdjustment(ptr:flight._js.GrayscaleAdjustment):Void;
	@:native("flight_free_hue_saturation_adjustment")
	public static function freeHueSaturationAdjustment(ptr:flight._js.HueSaturationAdjustment):Void;
	@:native("flight_free_invert_adjustment")
	public static function freeInvertAdjustment(ptr:flight._js.InvertAdjustment):Void;
	@:native("flight_free_lift_gamma_gain_adjustment")
	public static function freeLiftGammaGainAdjustment(ptr:flight._js.LiftGammaGainAdjustment):Void;
	@:native("flight_free_lookup_table_grade_adjustment")
	public static function freeLookupTableGradeAdjustment(ptr:flight._js.LookupTableGradeAdjustment):Void;
	@:native("flight_free_sepia_adjustment")
	public static function freeSepiaAdjustment(ptr:flight._js.SepiaAdjustment):Void;
	@:native("flight_free_tint_adjustment")
	public static function freeTintAdjustment(ptr:flight._js.TintAdjustment):Void;
}
