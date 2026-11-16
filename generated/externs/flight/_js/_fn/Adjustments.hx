package flight._js._fn;

@:jsRequire("@flighthq/adjustments")
extern class Adjustments {
	@:native("createBrightnessContrastAdjustment")
	public static function createBrightnessContrastAdjustment(options:Null<flight._js.BrightnessContrastAdjustmentOptions>):flight._js.BrightnessContrastAdjustment;
	@:native("createChannelMixerAdjustment")
	public static function createChannelMixerAdjustment(options:Null<flight._js.ChannelMixerAdjustmentOptions>):flight._js.ChannelMixerAdjustment;
	@:native("isAffineColorMatrix")
	public static function isAffineColorMatrix(matrix:Dynamic):Bool;
	@:native("createColorBlindSimulationAdjustment")
	public static function createColorBlindSimulationAdjustment(options:Null<flight._js.ColorBlindSimulationAdjustmentOptions>):flight._js.ColorBlindSimulationAdjustment;
	@:native("createColorGradeAdjustment")
	public static function createColorGradeAdjustment(options:Null<flight._js.ColorGradeAdjustmentOptions>):flight._js.ColorGradeAdjustment;
	@:native("bakeColorLut")
	public static function bakeColorLut(transforms:Dynamic, size:Null<Int>):flight._js.ColorLut;
	@:native("sampleColorLut")
	public static function sampleColorLut(lut:flight._js.ColorLut, out:Dynamic, r:Float, g:Float, b:Float):Void;
	@:native("getAdjustmentColorTransform")
	public static function getAdjustmentColorTransformBrightnessContrastAdjustment(operation:flight._js.BrightnessContrastAdjustment):Null<flight._js.ColorTransformFunction>;
	@:native("getAdjustmentColorTransform")
	public static function getAdjustmentColorTransformChannelMixerAdjustment(operation:flight._js.ChannelMixerAdjustment):Null<flight._js.ColorTransformFunction>;
	@:native("getAdjustmentColorTransform")
	public static function getAdjustmentColorTransformColorBlindSimulationAdjustment(operation:flight._js.ColorBlindSimulationAdjustment):Null<flight._js.ColorTransformFunction>;
	@:native("getAdjustmentColorTransform")
	public static function getAdjustmentColorTransformColorGradeAdjustment(operation:flight._js.ColorGradeAdjustment):Null<flight._js.ColorTransformFunction>;
	@:native("getAdjustmentColorTransform")
	public static function getAdjustmentColorTransformColorMatrixAdjustment(operation:flight._js.ColorMatrixAdjustment):Null<flight._js.ColorTransformFunction>;
	@:native("getAdjustmentColorTransform")
	public static function getAdjustmentColorTransformColorScaleBiasAdjustment(operation:flight._js.ColorScaleBiasAdjustment):Null<flight._js.ColorTransformFunction>;
	@:native("getAdjustmentColorTransform")
	public static function getAdjustmentColorTransformExposureAdjustment(operation:flight._js.ExposureAdjustment):Null<flight._js.ColorTransformFunction>;
	@:native("getAdjustmentColorTransform")
	public static function getAdjustmentColorTransformGrayscaleAdjustment(operation:flight._js.GrayscaleAdjustment):Null<flight._js.ColorTransformFunction>;
	@:native("getAdjustmentColorTransform")
	public static function getAdjustmentColorTransformHueSaturationAdjustment(operation:flight._js.HueSaturationAdjustment):Null<flight._js.ColorTransformFunction>;
	@:native("getAdjustmentColorTransform")
	public static function getAdjustmentColorTransformInvertAdjustment(operation:flight._js.InvertAdjustment):Null<flight._js.ColorTransformFunction>;
	@:native("getAdjustmentColorTransform")
	public static function getAdjustmentColorTransformLiftGammaGainAdjustment(operation:flight._js.LiftGammaGainAdjustment):Null<flight._js.ColorTransformFunction>;
	@:native("getAdjustmentColorTransform")
	public static function getAdjustmentColorTransformLookupTableGradeAdjustment(operation:flight._js.LookupTableGradeAdjustment):Null<flight._js.ColorTransformFunction>;
	@:native("getAdjustmentColorTransform")
	public static function getAdjustmentColorTransformSepiaAdjustment(operation:flight._js.SepiaAdjustment):Null<flight._js.ColorTransformFunction>;
	@:native("getAdjustmentColorTransform")
	public static function getAdjustmentColorTransformTintAdjustment(operation:flight._js.TintAdjustment):Null<flight._js.ColorTransformFunction>;
	@:native("isColorLutAdjustment")
	public static function isColorLutAdjustmentBrightnessContrastAdjustment(operation:flight._js.BrightnessContrastAdjustment):Bool;
	@:native("isColorLutAdjustment")
	public static function isColorLutAdjustmentChannelMixerAdjustment(operation:flight._js.ChannelMixerAdjustment):Bool;
	@:native("isColorLutAdjustment")
	public static function isColorLutAdjustmentColorBlindSimulationAdjustment(operation:flight._js.ColorBlindSimulationAdjustment):Bool;
	@:native("isColorLutAdjustment")
	public static function isColorLutAdjustmentColorGradeAdjustment(operation:flight._js.ColorGradeAdjustment):Bool;
	@:native("isColorLutAdjustment")
	public static function isColorLutAdjustmentColorMatrixAdjustment(operation:flight._js.ColorMatrixAdjustment):Bool;
	@:native("isColorLutAdjustment")
	public static function isColorLutAdjustmentColorScaleBiasAdjustment(operation:flight._js.ColorScaleBiasAdjustment):Bool;
	@:native("isColorLutAdjustment")
	public static function isColorLutAdjustmentExposureAdjustment(operation:flight._js.ExposureAdjustment):Bool;
	@:native("isColorLutAdjustment")
	public static function isColorLutAdjustmentGrayscaleAdjustment(operation:flight._js.GrayscaleAdjustment):Bool;
	@:native("isColorLutAdjustment")
	public static function isColorLutAdjustmentHueSaturationAdjustment(operation:flight._js.HueSaturationAdjustment):Bool;
	@:native("isColorLutAdjustment")
	public static function isColorLutAdjustmentInvertAdjustment(operation:flight._js.InvertAdjustment):Bool;
	@:native("isColorLutAdjustment")
	public static function isColorLutAdjustmentLiftGammaGainAdjustment(operation:flight._js.LiftGammaGainAdjustment):Bool;
	@:native("isColorLutAdjustment")
	public static function isColorLutAdjustmentLookupTableGradeAdjustment(operation:flight._js.LookupTableGradeAdjustment):Bool;
	@:native("isColorLutAdjustment")
	public static function isColorLutAdjustmentSepiaAdjustment(operation:flight._js.SepiaAdjustment):Bool;
	@:native("isColorLutAdjustment")
	public static function isColorLutAdjustmentTintAdjustment(operation:flight._js.TintAdjustment):Bool;
	@:native("createColorLutCache")
	public static function createColorLutCache():flight._js.ColorLutCache;
	@:native("createColorMatrixAdjustment")
	public static function createColorMatrixAdjustment(colorMatrix:Dynamic):flight._js.ColorMatrixAdjustment;
	@:native("isColorMatrixAdjustment")
	public static function isColorMatrixAdjustmentBrightnessContrastAdjustment(operation:flight._js.BrightnessContrastAdjustment):Bool;
	@:native("isColorMatrixAdjustment")
	public static function isColorMatrixAdjustmentChannelMixerAdjustment(operation:flight._js.ChannelMixerAdjustment):Bool;
	@:native("isColorMatrixAdjustment")
	public static function isColorMatrixAdjustmentColorBlindSimulationAdjustment(operation:flight._js.ColorBlindSimulationAdjustment):Bool;
	@:native("isColorMatrixAdjustment")
	public static function isColorMatrixAdjustmentColorGradeAdjustment(operation:flight._js.ColorGradeAdjustment):Bool;
	@:native("isColorMatrixAdjustment")
	public static function isColorMatrixAdjustmentColorMatrixAdjustment(operation:flight._js.ColorMatrixAdjustment):Bool;
	@:native("isColorMatrixAdjustment")
	public static function isColorMatrixAdjustmentColorScaleBiasAdjustment(operation:flight._js.ColorScaleBiasAdjustment):Bool;
	@:native("isColorMatrixAdjustment")
	public static function isColorMatrixAdjustmentExposureAdjustment(operation:flight._js.ExposureAdjustment):Bool;
	@:native("isColorMatrixAdjustment")
	public static function isColorMatrixAdjustmentGrayscaleAdjustment(operation:flight._js.GrayscaleAdjustment):Bool;
	@:native("isColorMatrixAdjustment")
	public static function isColorMatrixAdjustmentHueSaturationAdjustment(operation:flight._js.HueSaturationAdjustment):Bool;
	@:native("isColorMatrixAdjustment")
	public static function isColorMatrixAdjustmentInvertAdjustment(operation:flight._js.InvertAdjustment):Bool;
	@:native("isColorMatrixAdjustment")
	public static function isColorMatrixAdjustmentLiftGammaGainAdjustment(operation:flight._js.LiftGammaGainAdjustment):Bool;
	@:native("isColorMatrixAdjustment")
	public static function isColorMatrixAdjustmentLookupTableGradeAdjustment(operation:flight._js.LookupTableGradeAdjustment):Bool;
	@:native("isColorMatrixAdjustment")
	public static function isColorMatrixAdjustmentSepiaAdjustment(operation:flight._js.SepiaAdjustment):Bool;
	@:native("isColorMatrixAdjustment")
	public static function isColorMatrixAdjustmentTintAdjustment(operation:flight._js.TintAdjustment):Bool;
	@:native("createBrightnessColorMatrix")
	public static function createBrightnessColorMatrix(amount:Float):Dynamic;
	@:native("createChannelMixerColorMatrix")
	public static function createChannelMixerColorMatrix(redOut:Dynamic, greenOut:Dynamic, blueOut:Dynamic):Dynamic;
	@:native("createColorBalanceColorMatrix")
	public static function createColorBalanceColorMatrix(shadows:Dynamic, midtones:Dynamic, highlights:Dynamic):Dynamic;
	@:native("createColorMatrixFromTint")
	public static function createColorMatrixFromTint(packedRgba:Int, amount:Float):Dynamic;
	@:native("createContrastColorMatrix")
	public static function createContrastColorMatrix(amount:Float):Dynamic;
	@:native("createDesaturateColorMatrix")
	public static function createDesaturateColorMatrix(amount:Float):Dynamic;
	@:native("createGrayscaleColorMatrix")
	public static function createGrayscaleColorMatrix():Dynamic;
	@:native("createHueRotateColorMatrix")
	public static function createHueRotateColorMatrix(degrees:Float):Dynamic;
	@:native("createIdentityColorMatrix")
	public static function createIdentityColorMatrix():Dynamic;
	@:native("createInvertColorMatrix")
	public static function createInvertColorMatrix():Dynamic;
	@:native("createLevelsColorMatrix")
	public static function createLevelsColorMatrix(inBlack:Float, inWhite:Float, outBlack:Float, outWhite:Float, gamma:Float):Dynamic;
	@:native("createOpacityColorMatrix")
	public static function createOpacityColorMatrix(alpha:Float):Dynamic;
	@:native("createPolaroidColorMatrix")
	public static function createPolaroidColorMatrix():Dynamic;
	@:native("createSaturationColorMatrix")
	public static function createSaturationColorMatrix(amount:Float):Dynamic;
	@:native("createSepiaColorMatrix")
	public static function createSepiaColorMatrix():Dynamic;
	@:native("createTechnicolorColorMatrix")
	public static function createTechnicolorColorMatrix():Dynamic;
	@:native("createVintageColorMatrix")
	public static function createVintageColorMatrix():Dynamic;
	@:native("createWhiteBalanceColorMatrix")
	public static function createWhiteBalanceColorMatrix(temperature:Float, tint:Float):Dynamic;
	@:native("applyColorMatrixToColor")
	public static function applyColorMatrixToColor(matrix:Dynamic, packedRgba:Int):Int;
	@:native("concatColorMatrix")
	public static function concatColorMatrix(target:Dynamic, source:Dynamic):Void;
	@:native("multiplyColorMatrix")
	public static function multiplyColorMatrix(out:Dynamic, a:Dynamic, b:Dynamic):Void;
	@:native("createColorScaleBiasAdjustment")
	public static function createColorScaleBiasAdjustment(colorScaleBias:flight._js.ColorScaleBias):flight._js.ColorScaleBiasAdjustment;
	@:native("createExposureAdjustment")
	public static function createExposureAdjustment(options:Null<flight._js.ExposureAdjustmentOptions>):flight._js.ExposureAdjustment;
	@:native("createGrayscaleAdjustment")
	public static function createGrayscaleAdjustment(options:Null<flight._js.GrayscaleAdjustmentOptions>):flight._js.GrayscaleAdjustment;
	@:native("createHueSaturationAdjustment")
	public static function createHueSaturationAdjustment(options:Null<flight._js.HueSaturationAdjustmentOptions>):flight._js.HueSaturationAdjustment;
	@:native("createInvertAdjustment")
	public static function createInvertAdjustment(options:Null<flight._js.InvertAdjustmentOptions>):flight._js.InvertAdjustment;
	@:native("createLiftGammaGainAdjustment")
	public static function createLiftGammaGainAdjustment(options:Null<flight._js.LiftGammaGainAdjustmentOptions>):flight._js.LiftGammaGainAdjustment;
	@:native("createLookupTableGradeAdjustment")
	public static function createLookupTableGradeAdjustment(options:Null<flight._js.LookupTableGradeAdjustmentOptions>):flight._js.LookupTableGradeAdjustment;
	@:native("createSepiaAdjustment")
	public static function createSepiaAdjustment(options:Null<flight._js.SepiaAdjustmentOptions>):flight._js.SepiaAdjustment;
	@:native("createTintAdjustment")
	public static function createTintAdjustment(rgba:Int):flight._js.TintAdjustment;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeBrightnessContrastAdjustment(ptr:flight._js.BrightnessContrastAdjustment):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeChannelMixerAdjustment(ptr:flight._js.ChannelMixerAdjustment):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeColorBlindSimulationAdjustment(ptr:flight._js.ColorBlindSimulationAdjustment):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeColorGradeAdjustment(ptr:flight._js.ColorGradeAdjustment):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeColorLut(ptr:flight._js.ColorLut):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeColorTransformFunction(ptr:flight._js.ColorTransformFunction):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeColorLutCache(ptr:flight._js.ColorLutCache):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeColorMatrixAdjustment(ptr:flight._js.ColorMatrixAdjustment):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeColorScaleBiasAdjustment(ptr:flight._js.ColorScaleBiasAdjustment):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeExposureAdjustment(ptr:flight._js.ExposureAdjustment):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeGrayscaleAdjustment(ptr:flight._js.GrayscaleAdjustment):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeHueSaturationAdjustment(ptr:flight._js.HueSaturationAdjustment):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeInvertAdjustment(ptr:flight._js.InvertAdjustment):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeLiftGammaGainAdjustment(ptr:flight._js.LiftGammaGainAdjustment):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeLookupTableGradeAdjustment(ptr:flight._js.LookupTableGradeAdjustment):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSepiaAdjustment(ptr:flight._js.SepiaAdjustment):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTintAdjustment(ptr:flight._js.TintAdjustment):Void {}
}
