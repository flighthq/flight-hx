package flight._hl._fn;

extern class Adjustments {
	@:hlNative("flight", "flight_create_brightness_contrast_adjustment")
	public static function createBrightnessContrastAdjustment(options:flight._hl.BrightnessContrastAdjustmentOptions):flight._hl.BrightnessContrastAdjustment;
	@:hlNative("flight", "flight_create_channel_mixer_adjustment")
	public static function createChannelMixerAdjustment(options:flight._hl.ChannelMixerAdjustmentOptions):flight._hl.ChannelMixerAdjustment;
	@:hlNative("flight", "flight_is_affine_color_matrix")
	public static function isAffineColorMatrix(matrix:hl.Bytes):Bool;
	@:hlNative("flight", "flight_create_color_blind_simulation_adjustment")
	public static function createColorBlindSimulationAdjustment(options:flight._hl.ColorBlindSimulationAdjustmentOptions):flight._hl.ColorBlindSimulationAdjustment;
	@:hlNative("flight", "flight_create_color_grade_adjustment")
	public static function createColorGradeAdjustment(options:flight._hl.ColorGradeAdjustmentOptions):flight._hl.ColorGradeAdjustment;
	@:hlNative("flight", "flight_bake_color_lut")
	public static function bakeColorLut(transforms:hl.Bytes, transformsLen:Int, size:haxe.Int64):flight._hl.ColorLut;
	@:hlNative("flight", "flight_sample_color_lut")
	public static function sampleColorLut(lut:flight._hl.ColorLut, out:hl.Bytes, r:Single, g:Single, b:Single):Void;
	@:hlNative("flight", "flight_get_adjustment_color_transform__brightness_contrast_adjustment")
	public static function getAdjustmentColorTransformBrightnessContrastAdjustment(operation:flight._hl.BrightnessContrastAdjustment):flight._hl.ColorTransformFunction;
	@:hlNative("flight", "flight_get_adjustment_color_transform__channel_mixer_adjustment")
	public static function getAdjustmentColorTransformChannelMixerAdjustment(operation:flight._hl.ChannelMixerAdjustment):flight._hl.ColorTransformFunction;
	@:hlNative("flight", "flight_get_adjustment_color_transform__color_blind_simulation_adjustment")
	public static function getAdjustmentColorTransformColorBlindSimulationAdjustment(operation:flight._hl.ColorBlindSimulationAdjustment):flight._hl.ColorTransformFunction;
	@:hlNative("flight", "flight_get_adjustment_color_transform__color_grade_adjustment")
	public static function getAdjustmentColorTransformColorGradeAdjustment(operation:flight._hl.ColorGradeAdjustment):flight._hl.ColorTransformFunction;
	@:hlNative("flight", "flight_get_adjustment_color_transform__color_matrix_adjustment")
	public static function getAdjustmentColorTransformColorMatrixAdjustment(operation:flight._hl.ColorMatrixAdjustment):flight._hl.ColorTransformFunction;
	@:hlNative("flight", "flight_get_adjustment_color_transform__color_scale_bias_adjustment")
	public static function getAdjustmentColorTransformColorScaleBiasAdjustment(operation:flight._hl.ColorScaleBiasAdjustment):flight._hl.ColorTransformFunction;
	@:hlNative("flight", "flight_get_adjustment_color_transform__exposure_adjustment")
	public static function getAdjustmentColorTransformExposureAdjustment(operation:flight._hl.ExposureAdjustment):flight._hl.ColorTransformFunction;
	@:hlNative("flight", "flight_get_adjustment_color_transform__grayscale_adjustment")
	public static function getAdjustmentColorTransformGrayscaleAdjustment(operation:flight._hl.GrayscaleAdjustment):flight._hl.ColorTransformFunction;
	@:hlNative("flight", "flight_get_adjustment_color_transform__hue_saturation_adjustment")
	public static function getAdjustmentColorTransformHueSaturationAdjustment(operation:flight._hl.HueSaturationAdjustment):flight._hl.ColorTransformFunction;
	@:hlNative("flight", "flight_get_adjustment_color_transform__invert_adjustment")
	public static function getAdjustmentColorTransformInvertAdjustment(operation:flight._hl.InvertAdjustment):flight._hl.ColorTransformFunction;
	@:hlNative("flight", "flight_get_adjustment_color_transform__lift_gamma_gain_adjustment")
	public static function getAdjustmentColorTransformLiftGammaGainAdjustment(operation:flight._hl.LiftGammaGainAdjustment):flight._hl.ColorTransformFunction;
	@:hlNative("flight", "flight_get_adjustment_color_transform__lookup_table_grade_adjustment")
	public static function getAdjustmentColorTransformLookupTableGradeAdjustment(operation:flight._hl.LookupTableGradeAdjustment):flight._hl.ColorTransformFunction;
	@:hlNative("flight", "flight_get_adjustment_color_transform__sepia_adjustment")
	public static function getAdjustmentColorTransformSepiaAdjustment(operation:flight._hl.SepiaAdjustment):flight._hl.ColorTransformFunction;
	@:hlNative("flight", "flight_get_adjustment_color_transform__tint_adjustment")
	public static function getAdjustmentColorTransformTintAdjustment(operation:flight._hl.TintAdjustment):flight._hl.ColorTransformFunction;
	@:hlNative("flight", "flight_is_color_lut_adjustment__brightness_contrast_adjustment")
	public static function isColorLutAdjustmentBrightnessContrastAdjustment(operation:flight._hl.BrightnessContrastAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_lut_adjustment__channel_mixer_adjustment")
	public static function isColorLutAdjustmentChannelMixerAdjustment(operation:flight._hl.ChannelMixerAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_lut_adjustment__color_blind_simulation_adjustment")
	public static function isColorLutAdjustmentColorBlindSimulationAdjustment(operation:flight._hl.ColorBlindSimulationAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_lut_adjustment__color_grade_adjustment")
	public static function isColorLutAdjustmentColorGradeAdjustment(operation:flight._hl.ColorGradeAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_lut_adjustment__color_matrix_adjustment")
	public static function isColorLutAdjustmentColorMatrixAdjustment(operation:flight._hl.ColorMatrixAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_lut_adjustment__color_scale_bias_adjustment")
	public static function isColorLutAdjustmentColorScaleBiasAdjustment(operation:flight._hl.ColorScaleBiasAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_lut_adjustment__exposure_adjustment")
	public static function isColorLutAdjustmentExposureAdjustment(operation:flight._hl.ExposureAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_lut_adjustment__grayscale_adjustment")
	public static function isColorLutAdjustmentGrayscaleAdjustment(operation:flight._hl.GrayscaleAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_lut_adjustment__hue_saturation_adjustment")
	public static function isColorLutAdjustmentHueSaturationAdjustment(operation:flight._hl.HueSaturationAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_lut_adjustment__invert_adjustment")
	public static function isColorLutAdjustmentInvertAdjustment(operation:flight._hl.InvertAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_lut_adjustment__lift_gamma_gain_adjustment")
	public static function isColorLutAdjustmentLiftGammaGainAdjustment(operation:flight._hl.LiftGammaGainAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_lut_adjustment__lookup_table_grade_adjustment")
	public static function isColorLutAdjustmentLookupTableGradeAdjustment(operation:flight._hl.LookupTableGradeAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_lut_adjustment__sepia_adjustment")
	public static function isColorLutAdjustmentSepiaAdjustment(operation:flight._hl.SepiaAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_lut_adjustment__tint_adjustment")
	public static function isColorLutAdjustmentTintAdjustment(operation:flight._hl.TintAdjustment):Bool;
	@:hlNative("flight", "flight_create_color_lut_cache")
	public static function createColorLutCache():flight._hl.ColorLutCache;
	@:hlNative("flight", "flight_create_color_matrix_adjustment")
	public static function createColorMatrixAdjustment(colorMatrix:hl.Bytes):flight._hl.ColorMatrixAdjustment;
	@:hlNative("flight", "flight_is_color_matrix_adjustment__brightness_contrast_adjustment")
	public static function isColorMatrixAdjustmentBrightnessContrastAdjustment(operation:flight._hl.BrightnessContrastAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_matrix_adjustment__channel_mixer_adjustment")
	public static function isColorMatrixAdjustmentChannelMixerAdjustment(operation:flight._hl.ChannelMixerAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_matrix_adjustment__color_blind_simulation_adjustment")
	public static function isColorMatrixAdjustmentColorBlindSimulationAdjustment(operation:flight._hl.ColorBlindSimulationAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_matrix_adjustment__color_grade_adjustment")
	public static function isColorMatrixAdjustmentColorGradeAdjustment(operation:flight._hl.ColorGradeAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_matrix_adjustment__color_matrix_adjustment")
	public static function isColorMatrixAdjustmentColorMatrixAdjustment(operation:flight._hl.ColorMatrixAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_matrix_adjustment__color_scale_bias_adjustment")
	public static function isColorMatrixAdjustmentColorScaleBiasAdjustment(operation:flight._hl.ColorScaleBiasAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_matrix_adjustment__exposure_adjustment")
	public static function isColorMatrixAdjustmentExposureAdjustment(operation:flight._hl.ExposureAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_matrix_adjustment__grayscale_adjustment")
	public static function isColorMatrixAdjustmentGrayscaleAdjustment(operation:flight._hl.GrayscaleAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_matrix_adjustment__hue_saturation_adjustment")
	public static function isColorMatrixAdjustmentHueSaturationAdjustment(operation:flight._hl.HueSaturationAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_matrix_adjustment__invert_adjustment")
	public static function isColorMatrixAdjustmentInvertAdjustment(operation:flight._hl.InvertAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_matrix_adjustment__lift_gamma_gain_adjustment")
	public static function isColorMatrixAdjustmentLiftGammaGainAdjustment(operation:flight._hl.LiftGammaGainAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_matrix_adjustment__lookup_table_grade_adjustment")
	public static function isColorMatrixAdjustmentLookupTableGradeAdjustment(operation:flight._hl.LookupTableGradeAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_matrix_adjustment__sepia_adjustment")
	public static function isColorMatrixAdjustmentSepiaAdjustment(operation:flight._hl.SepiaAdjustment):Bool;
	@:hlNative("flight", "flight_is_color_matrix_adjustment__tint_adjustment")
	public static function isColorMatrixAdjustmentTintAdjustment(operation:flight._hl.TintAdjustment):Bool;
	@:hlNative("flight", "flight_create_brightness_color_matrix")
	public static function createBrightnessColorMatrix(amount:Single):hl.Bytes;
	@:hlNative("flight", "flight_create_channel_mixer_color_matrix")
	public static function createChannelMixerColorMatrix(redOut:hl.Bytes, greenOut:hl.Bytes, blueOut:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_create_color_balance_color_matrix")
	public static function createColorBalanceColorMatrix(shadows:hl.Bytes, midtones:hl.Bytes, highlights:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_create_color_matrix_from_tint")
	public static function createColorMatrixFromTint(packedRgba:Int, amount:Single):hl.Bytes;
	@:hlNative("flight", "flight_create_contrast_color_matrix")
	public static function createContrastColorMatrix(amount:Single):hl.Bytes;
	@:hlNative("flight", "flight_create_desaturate_color_matrix")
	public static function createDesaturateColorMatrix(amount:Single):hl.Bytes;
	@:hlNative("flight", "flight_create_grayscale_color_matrix")
	public static function createGrayscaleColorMatrix():hl.Bytes;
	@:hlNative("flight", "flight_create_hue_rotate_color_matrix")
	public static function createHueRotateColorMatrix(degrees:Single):hl.Bytes;
	@:hlNative("flight", "flight_create_identity_color_matrix")
	public static function createIdentityColorMatrix():hl.Bytes;
	@:hlNative("flight", "flight_create_invert_color_matrix")
	public static function createInvertColorMatrix():hl.Bytes;
	@:hlNative("flight", "flight_create_levels_color_matrix")
	public static function createLevelsColorMatrix(inBlack:Single, inWhite:Single, outBlack:Single, outWhite:Single, gamma:Single):hl.Bytes;
	@:hlNative("flight", "flight_create_opacity_color_matrix")
	public static function createOpacityColorMatrix(alpha:Single):hl.Bytes;
	@:hlNative("flight", "flight_create_polaroid_color_matrix")
	public static function createPolaroidColorMatrix():hl.Bytes;
	@:hlNative("flight", "flight_create_saturation_color_matrix")
	public static function createSaturationColorMatrix(amount:Single):hl.Bytes;
	@:hlNative("flight", "flight_create_sepia_color_matrix")
	public static function createSepiaColorMatrix():hl.Bytes;
	@:hlNative("flight", "flight_create_technicolor_color_matrix")
	public static function createTechnicolorColorMatrix():hl.Bytes;
	@:hlNative("flight", "flight_create_vintage_color_matrix")
	public static function createVintageColorMatrix():hl.Bytes;
	@:hlNative("flight", "flight_create_white_balance_color_matrix")
	public static function createWhiteBalanceColorMatrix(temperature:Single, tint:Single):hl.Bytes;
	@:hlNative("flight", "flight_apply_color_matrix_to_color")
	public static function applyColorMatrixToColor(matrix:hl.Bytes, packedRgba:Int):Int;
	@:hlNative("flight", "flight_concat_color_matrix")
	public static function concatColorMatrix(target:hl.Bytes, source:hl.Bytes):Void;
	@:hlNative("flight", "flight_fuse_color_matrices")
	public static function fuseColorMatrices(matrices:hl.Bytes, matricesLen:Int):hl.Bytes;
	@:hlNative("flight", "flight_multiply_color_matrix")
	public static function multiplyColorMatrix(out:hl.Bytes, a:hl.Bytes, b:hl.Bytes):Void;
	@:hlNative("flight", "flight_create_color_scale_bias_adjustment")
	public static function createColorScaleBiasAdjustment(colorScaleBias:flight._hl.ColorScaleBias):flight._hl.ColorScaleBiasAdjustment;
	@:hlNative("flight", "flight_create_exposure_adjustment")
	public static function createExposureAdjustment(options:flight._hl.ExposureAdjustmentOptions):flight._hl.ExposureAdjustment;
	@:hlNative("flight", "flight_create_grayscale_adjustment")
	public static function createGrayscaleAdjustment(options:flight._hl.GrayscaleAdjustmentOptions):flight._hl.GrayscaleAdjustment;
	@:hlNative("flight", "flight_create_hue_saturation_adjustment")
	public static function createHueSaturationAdjustment(options:flight._hl.HueSaturationAdjustmentOptions):flight._hl.HueSaturationAdjustment;
	@:hlNative("flight", "flight_create_invert_adjustment")
	public static function createInvertAdjustment(options:flight._hl.InvertAdjustmentOptions):flight._hl.InvertAdjustment;
	@:hlNative("flight", "flight_create_lift_gamma_gain_adjustment")
	public static function createLiftGammaGainAdjustment(options:flight._hl.LiftGammaGainAdjustmentOptions):flight._hl.LiftGammaGainAdjustment;
	@:hlNative("flight", "flight_create_lookup_table_grade_adjustment")
	public static function createLookupTableGradeAdjustment(options:flight._hl.LookupTableGradeAdjustmentOptions):flight._hl.LookupTableGradeAdjustment;
	@:hlNative("flight", "flight_create_sepia_adjustment")
	public static function createSepiaAdjustment(options:flight._hl.SepiaAdjustmentOptions):flight._hl.SepiaAdjustment;
	@:hlNative("flight", "flight_create_tint_adjustment")
	public static function createTintAdjustment(rgba:Int):flight._hl.TintAdjustment;
	@:hlNative("flight", "flight_free_brightness_contrast_adjustment")
	public static function freeBrightnessContrastAdjustment(ptr:flight._hl.BrightnessContrastAdjustment):Void;
	@:hlNative("flight", "flight_free_channel_mixer_adjustment")
	public static function freeChannelMixerAdjustment(ptr:flight._hl.ChannelMixerAdjustment):Void;
	@:hlNative("flight", "flight_free_color_blind_simulation_adjustment")
	public static function freeColorBlindSimulationAdjustment(ptr:flight._hl.ColorBlindSimulationAdjustment):Void;
	@:hlNative("flight", "flight_free_color_grade_adjustment")
	public static function freeColorGradeAdjustment(ptr:flight._hl.ColorGradeAdjustment):Void;
	@:hlNative("flight", "flight_free_color_lut")
	public static function freeColorLut(ptr:flight._hl.ColorLut):Void;
	@:hlNative("flight", "flight_free_color_transform_function")
	public static function freeColorTransformFunction(ptr:flight._hl.ColorTransformFunction):Void;
	@:hlNative("flight", "flight_free_color_lut_cache")
	public static function freeColorLutCache(ptr:flight._hl.ColorLutCache):Void;
	@:hlNative("flight", "flight_free_color_matrix_adjustment")
	public static function freeColorMatrixAdjustment(ptr:flight._hl.ColorMatrixAdjustment):Void;
	@:hlNative("flight", "flight_free_color_scale_bias_adjustment")
	public static function freeColorScaleBiasAdjustment(ptr:flight._hl.ColorScaleBiasAdjustment):Void;
	@:hlNative("flight", "flight_free_exposure_adjustment")
	public static function freeExposureAdjustment(ptr:flight._hl.ExposureAdjustment):Void;
	@:hlNative("flight", "flight_free_grayscale_adjustment")
	public static function freeGrayscaleAdjustment(ptr:flight._hl.GrayscaleAdjustment):Void;
	@:hlNative("flight", "flight_free_hue_saturation_adjustment")
	public static function freeHueSaturationAdjustment(ptr:flight._hl.HueSaturationAdjustment):Void;
	@:hlNative("flight", "flight_free_invert_adjustment")
	public static function freeInvertAdjustment(ptr:flight._hl.InvertAdjustment):Void;
	@:hlNative("flight", "flight_free_lift_gamma_gain_adjustment")
	public static function freeLiftGammaGainAdjustment(ptr:flight._hl.LiftGammaGainAdjustment):Void;
	@:hlNative("flight", "flight_free_lookup_table_grade_adjustment")
	public static function freeLookupTableGradeAdjustment(ptr:flight._hl.LookupTableGradeAdjustment):Void;
	@:hlNative("flight", "flight_free_sepia_adjustment")
	public static function freeSepiaAdjustment(ptr:flight._hl.SepiaAdjustment):Void;
	@:hlNative("flight", "flight_free_tint_adjustment")
	public static function freeTintAdjustment(ptr:flight._hl.TintAdjustment):Void;
}
