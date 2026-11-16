package flight._cpp._fn;

extern class Adjustments {
	@:native("flight_create_brightness_contrast_adjustment")
	public static function createBrightnessContrastAdjustment(options:flight._cpp.BrightnessContrastAdjustmentOptions):flight._cpp.BrightnessContrastAdjustment;
	@:native("flight_create_channel_mixer_adjustment")
	public static function createChannelMixerAdjustment(options:flight._cpp.ChannelMixerAdjustmentOptions):flight._cpp.ChannelMixerAdjustment;
	@:native("flight_is_affine_color_matrix")
	public static function isAffineColorMatrix(matrix:cpp.Star<cpp.Void>):Bool;
	@:native("flight_create_color_blind_simulation_adjustment")
	public static function createColorBlindSimulationAdjustment(options:flight._cpp.ColorBlindSimulationAdjustmentOptions):flight._cpp.ColorBlindSimulationAdjustment;
	@:native("flight_create_color_grade_adjustment")
	public static function createColorGradeAdjustment(options:flight._cpp.ColorGradeAdjustmentOptions):flight._cpp.ColorGradeAdjustment;
	@:native("flight_bake_color_lut")
	public static function bakeColorLut(transforms:cpp.Star<cpp.Void>, transformsLen:Int, size:haxe.Int64):flight._cpp.ColorLut;
	@:native("flight_sample_color_lut")
	public static function sampleColorLut(lut:flight._cpp.ColorLut, out:cpp.Star<cpp.Void>, r:Single, g:Single, b:Single):Void;
	@:native("flight_get_adjustment_color_transform__brightness_contrast_adjustment")
	public static function getAdjustmentColorTransformBrightnessContrastAdjustment(operation:flight._cpp.BrightnessContrastAdjustment):flight._cpp.ColorTransformFunction;
	@:native("flight_get_adjustment_color_transform__channel_mixer_adjustment")
	public static function getAdjustmentColorTransformChannelMixerAdjustment(operation:flight._cpp.ChannelMixerAdjustment):flight._cpp.ColorTransformFunction;
	@:native("flight_get_adjustment_color_transform__color_blind_simulation_adjustment")
	public static function getAdjustmentColorTransformColorBlindSimulationAdjustment(operation:flight._cpp.ColorBlindSimulationAdjustment):flight._cpp.ColorTransformFunction;
	@:native("flight_get_adjustment_color_transform__color_grade_adjustment")
	public static function getAdjustmentColorTransformColorGradeAdjustment(operation:flight._cpp.ColorGradeAdjustment):flight._cpp.ColorTransformFunction;
	@:native("flight_get_adjustment_color_transform__color_matrix_adjustment")
	public static function getAdjustmentColorTransformColorMatrixAdjustment(operation:flight._cpp.ColorMatrixAdjustment):flight._cpp.ColorTransformFunction;
	@:native("flight_get_adjustment_color_transform__color_scale_bias_adjustment")
	public static function getAdjustmentColorTransformColorScaleBiasAdjustment(operation:flight._cpp.ColorScaleBiasAdjustment):flight._cpp.ColorTransformFunction;
	@:native("flight_get_adjustment_color_transform__exposure_adjustment")
	public static function getAdjustmentColorTransformExposureAdjustment(operation:flight._cpp.ExposureAdjustment):flight._cpp.ColorTransformFunction;
	@:native("flight_get_adjustment_color_transform__grayscale_adjustment")
	public static function getAdjustmentColorTransformGrayscaleAdjustment(operation:flight._cpp.GrayscaleAdjustment):flight._cpp.ColorTransformFunction;
	@:native("flight_get_adjustment_color_transform__hue_saturation_adjustment")
	public static function getAdjustmentColorTransformHueSaturationAdjustment(operation:flight._cpp.HueSaturationAdjustment):flight._cpp.ColorTransformFunction;
	@:native("flight_get_adjustment_color_transform__invert_adjustment")
	public static function getAdjustmentColorTransformInvertAdjustment(operation:flight._cpp.InvertAdjustment):flight._cpp.ColorTransformFunction;
	@:native("flight_get_adjustment_color_transform__lift_gamma_gain_adjustment")
	public static function getAdjustmentColorTransformLiftGammaGainAdjustment(operation:flight._cpp.LiftGammaGainAdjustment):flight._cpp.ColorTransformFunction;
	@:native("flight_get_adjustment_color_transform__lookup_table_grade_adjustment")
	public static function getAdjustmentColorTransformLookupTableGradeAdjustment(operation:flight._cpp.LookupTableGradeAdjustment):flight._cpp.ColorTransformFunction;
	@:native("flight_get_adjustment_color_transform__sepia_adjustment")
	public static function getAdjustmentColorTransformSepiaAdjustment(operation:flight._cpp.SepiaAdjustment):flight._cpp.ColorTransformFunction;
	@:native("flight_get_adjustment_color_transform__tint_adjustment")
	public static function getAdjustmentColorTransformTintAdjustment(operation:flight._cpp.TintAdjustment):flight._cpp.ColorTransformFunction;
	@:native("flight_is_color_lut_adjustment__brightness_contrast_adjustment")
	public static function isColorLutAdjustmentBrightnessContrastAdjustment(operation:flight._cpp.BrightnessContrastAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__channel_mixer_adjustment")
	public static function isColorLutAdjustmentChannelMixerAdjustment(operation:flight._cpp.ChannelMixerAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__color_blind_simulation_adjustment")
	public static function isColorLutAdjustmentColorBlindSimulationAdjustment(operation:flight._cpp.ColorBlindSimulationAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__color_grade_adjustment")
	public static function isColorLutAdjustmentColorGradeAdjustment(operation:flight._cpp.ColorGradeAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__color_matrix_adjustment")
	public static function isColorLutAdjustmentColorMatrixAdjustment(operation:flight._cpp.ColorMatrixAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__color_scale_bias_adjustment")
	public static function isColorLutAdjustmentColorScaleBiasAdjustment(operation:flight._cpp.ColorScaleBiasAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__exposure_adjustment")
	public static function isColorLutAdjustmentExposureAdjustment(operation:flight._cpp.ExposureAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__grayscale_adjustment")
	public static function isColorLutAdjustmentGrayscaleAdjustment(operation:flight._cpp.GrayscaleAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__hue_saturation_adjustment")
	public static function isColorLutAdjustmentHueSaturationAdjustment(operation:flight._cpp.HueSaturationAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__invert_adjustment")
	public static function isColorLutAdjustmentInvertAdjustment(operation:flight._cpp.InvertAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__lift_gamma_gain_adjustment")
	public static function isColorLutAdjustmentLiftGammaGainAdjustment(operation:flight._cpp.LiftGammaGainAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__lookup_table_grade_adjustment")
	public static function isColorLutAdjustmentLookupTableGradeAdjustment(operation:flight._cpp.LookupTableGradeAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__sepia_adjustment")
	public static function isColorLutAdjustmentSepiaAdjustment(operation:flight._cpp.SepiaAdjustment):Bool;
	@:native("flight_is_color_lut_adjustment__tint_adjustment")
	public static function isColorLutAdjustmentTintAdjustment(operation:flight._cpp.TintAdjustment):Bool;
	@:native("flight_create_color_lut_cache")
	public static function createColorLutCache():flight._cpp.ColorLutCache;
	@:native("flight_create_color_matrix_adjustment")
	public static function createColorMatrixAdjustment(colorMatrix:cpp.Star<cpp.Void>):flight._cpp.ColorMatrixAdjustment;
	@:native("flight_is_color_matrix_adjustment__brightness_contrast_adjustment")
	public static function isColorMatrixAdjustmentBrightnessContrastAdjustment(operation:flight._cpp.BrightnessContrastAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__channel_mixer_adjustment")
	public static function isColorMatrixAdjustmentChannelMixerAdjustment(operation:flight._cpp.ChannelMixerAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__color_blind_simulation_adjustment")
	public static function isColorMatrixAdjustmentColorBlindSimulationAdjustment(operation:flight._cpp.ColorBlindSimulationAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__color_grade_adjustment")
	public static function isColorMatrixAdjustmentColorGradeAdjustment(operation:flight._cpp.ColorGradeAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__color_matrix_adjustment")
	public static function isColorMatrixAdjustmentColorMatrixAdjustment(operation:flight._cpp.ColorMatrixAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__color_scale_bias_adjustment")
	public static function isColorMatrixAdjustmentColorScaleBiasAdjustment(operation:flight._cpp.ColorScaleBiasAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__exposure_adjustment")
	public static function isColorMatrixAdjustmentExposureAdjustment(operation:flight._cpp.ExposureAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__grayscale_adjustment")
	public static function isColorMatrixAdjustmentGrayscaleAdjustment(operation:flight._cpp.GrayscaleAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__hue_saturation_adjustment")
	public static function isColorMatrixAdjustmentHueSaturationAdjustment(operation:flight._cpp.HueSaturationAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__invert_adjustment")
	public static function isColorMatrixAdjustmentInvertAdjustment(operation:flight._cpp.InvertAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__lift_gamma_gain_adjustment")
	public static function isColorMatrixAdjustmentLiftGammaGainAdjustment(operation:flight._cpp.LiftGammaGainAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__lookup_table_grade_adjustment")
	public static function isColorMatrixAdjustmentLookupTableGradeAdjustment(operation:flight._cpp.LookupTableGradeAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__sepia_adjustment")
	public static function isColorMatrixAdjustmentSepiaAdjustment(operation:flight._cpp.SepiaAdjustment):Bool;
	@:native("flight_is_color_matrix_adjustment__tint_adjustment")
	public static function isColorMatrixAdjustmentTintAdjustment(operation:flight._cpp.TintAdjustment):Bool;
	@:native("flight_create_brightness_color_matrix")
	public static function createBrightnessColorMatrix(amount:Single):cpp.Star<cpp.Void>;
	@:native("flight_create_channel_mixer_color_matrix")
	public static function createChannelMixerColorMatrix(redOut:cpp.Star<cpp.Void>, greenOut:cpp.Star<cpp.Void>, blueOut:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_create_color_balance_color_matrix")
	public static function createColorBalanceColorMatrix(shadows:cpp.Star<cpp.Void>, midtones:cpp.Star<cpp.Void>, highlights:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_create_color_matrix_from_tint")
	public static function createColorMatrixFromTint(packedRgba:Int, amount:Single):cpp.Star<cpp.Void>;
	@:native("flight_create_contrast_color_matrix")
	public static function createContrastColorMatrix(amount:Single):cpp.Star<cpp.Void>;
	@:native("flight_create_desaturate_color_matrix")
	public static function createDesaturateColorMatrix(amount:Single):cpp.Star<cpp.Void>;
	@:native("flight_create_grayscale_color_matrix")
	public static function createGrayscaleColorMatrix():cpp.Star<cpp.Void>;
	@:native("flight_create_hue_rotate_color_matrix")
	public static function createHueRotateColorMatrix(degrees:Single):cpp.Star<cpp.Void>;
	@:native("flight_create_identity_color_matrix")
	public static function createIdentityColorMatrix():cpp.Star<cpp.Void>;
	@:native("flight_create_invert_color_matrix")
	public static function createInvertColorMatrix():cpp.Star<cpp.Void>;
	@:native("flight_create_levels_color_matrix")
	public static function createLevelsColorMatrix(inBlack:Single, inWhite:Single, outBlack:Single, outWhite:Single, gamma:Single):cpp.Star<cpp.Void>;
	@:native("flight_create_opacity_color_matrix")
	public static function createOpacityColorMatrix(alpha:Single):cpp.Star<cpp.Void>;
	@:native("flight_create_polaroid_color_matrix")
	public static function createPolaroidColorMatrix():cpp.Star<cpp.Void>;
	@:native("flight_create_saturation_color_matrix")
	public static function createSaturationColorMatrix(amount:Single):cpp.Star<cpp.Void>;
	@:native("flight_create_sepia_color_matrix")
	public static function createSepiaColorMatrix():cpp.Star<cpp.Void>;
	@:native("flight_create_technicolor_color_matrix")
	public static function createTechnicolorColorMatrix():cpp.Star<cpp.Void>;
	@:native("flight_create_vintage_color_matrix")
	public static function createVintageColorMatrix():cpp.Star<cpp.Void>;
	@:native("flight_create_white_balance_color_matrix")
	public static function createWhiteBalanceColorMatrix(temperature:Single, tint:Single):cpp.Star<cpp.Void>;
	@:native("flight_apply_color_matrix_to_color")
	public static function applyColorMatrixToColor(matrix:cpp.Star<cpp.Void>, packedRgba:Int):Int;
	@:native("flight_concat_color_matrix")
	public static function concatColorMatrix(target:cpp.Star<cpp.Void>, source:cpp.Star<cpp.Void>):Void;
	@:native("flight_multiply_color_matrix")
	public static function multiplyColorMatrix(out:cpp.Star<cpp.Void>, a:cpp.Star<cpp.Void>, b:cpp.Star<cpp.Void>):Void;
	@:native("flight_create_color_scale_bias_adjustment")
	public static function createColorScaleBiasAdjustment(colorScaleBias:flight._cpp.ColorScaleBias):flight._cpp.ColorScaleBiasAdjustment;
	@:native("flight_create_exposure_adjustment")
	public static function createExposureAdjustment(options:flight._cpp.ExposureAdjustmentOptions):flight._cpp.ExposureAdjustment;
	@:native("flight_create_grayscale_adjustment")
	public static function createGrayscaleAdjustment(options:flight._cpp.GrayscaleAdjustmentOptions):flight._cpp.GrayscaleAdjustment;
	@:native("flight_create_hue_saturation_adjustment")
	public static function createHueSaturationAdjustment(options:flight._cpp.HueSaturationAdjustmentOptions):flight._cpp.HueSaturationAdjustment;
	@:native("flight_create_invert_adjustment")
	public static function createInvertAdjustment(options:flight._cpp.InvertAdjustmentOptions):flight._cpp.InvertAdjustment;
	@:native("flight_create_lift_gamma_gain_adjustment")
	public static function createLiftGammaGainAdjustment(options:flight._cpp.LiftGammaGainAdjustmentOptions):flight._cpp.LiftGammaGainAdjustment;
	@:native("flight_create_lookup_table_grade_adjustment")
	public static function createLookupTableGradeAdjustment(options:flight._cpp.LookupTableGradeAdjustmentOptions):flight._cpp.LookupTableGradeAdjustment;
	@:native("flight_create_sepia_adjustment")
	public static function createSepiaAdjustment(options:flight._cpp.SepiaAdjustmentOptions):flight._cpp.SepiaAdjustment;
	@:native("flight_create_tint_adjustment")
	public static function createTintAdjustment(rgba:Int):flight._cpp.TintAdjustment;
	@:native("flight_free_brightness_contrast_adjustment")
	public static function freeBrightnessContrastAdjustment(ptr:flight._cpp.BrightnessContrastAdjustment):Void;
	@:native("flight_free_channel_mixer_adjustment")
	public static function freeChannelMixerAdjustment(ptr:flight._cpp.ChannelMixerAdjustment):Void;
	@:native("flight_free_color_blind_simulation_adjustment")
	public static function freeColorBlindSimulationAdjustment(ptr:flight._cpp.ColorBlindSimulationAdjustment):Void;
	@:native("flight_free_color_grade_adjustment")
	public static function freeColorGradeAdjustment(ptr:flight._cpp.ColorGradeAdjustment):Void;
	@:native("flight_free_color_lut")
	public static function freeColorLut(ptr:flight._cpp.ColorLut):Void;
	@:native("flight_free_color_transform_function")
	public static function freeColorTransformFunction(ptr:flight._cpp.ColorTransformFunction):Void;
	@:native("flight_free_color_lut_cache")
	public static function freeColorLutCache(ptr:flight._cpp.ColorLutCache):Void;
	@:native("flight_free_color_matrix_adjustment")
	public static function freeColorMatrixAdjustment(ptr:flight._cpp.ColorMatrixAdjustment):Void;
	@:native("flight_free_color_scale_bias_adjustment")
	public static function freeColorScaleBiasAdjustment(ptr:flight._cpp.ColorScaleBiasAdjustment):Void;
	@:native("flight_free_exposure_adjustment")
	public static function freeExposureAdjustment(ptr:flight._cpp.ExposureAdjustment):Void;
	@:native("flight_free_grayscale_adjustment")
	public static function freeGrayscaleAdjustment(ptr:flight._cpp.GrayscaleAdjustment):Void;
	@:native("flight_free_hue_saturation_adjustment")
	public static function freeHueSaturationAdjustment(ptr:flight._cpp.HueSaturationAdjustment):Void;
	@:native("flight_free_invert_adjustment")
	public static function freeInvertAdjustment(ptr:flight._cpp.InvertAdjustment):Void;
	@:native("flight_free_lift_gamma_gain_adjustment")
	public static function freeLiftGammaGainAdjustment(ptr:flight._cpp.LiftGammaGainAdjustment):Void;
	@:native("flight_free_lookup_table_grade_adjustment")
	public static function freeLookupTableGradeAdjustment(ptr:flight._cpp.LookupTableGradeAdjustment):Void;
	@:native("flight_free_sepia_adjustment")
	public static function freeSepiaAdjustment(ptr:flight._cpp.SepiaAdjustment):Void;
	@:native("flight_free_tint_adjustment")
	public static function freeTintAdjustment(ptr:flight._cpp.TintAdjustment):Void;
}
