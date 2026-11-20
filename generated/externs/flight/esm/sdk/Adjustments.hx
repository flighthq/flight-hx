package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/adjustments")
extern class Adjustments {
  public static final COLOR_ADJUSTMENT_AFFINE:Float;
  public static final COLOR_ADJUSTMENT_CHANNEL_MIXING:Float;
  public static final COLOR_ADJUSTMENT_NONE:Float;
  public static final COLOR_LUT_DEFAULT_SIZE:Float;
  public static final COLOR_MATRIX_LENGTH:Float;
  public static function applyColorMatrixToColor(matrix:js.lib.Float32Array, packedRgba:Float):Float;
  public static function bakeColorLut(transforms:Array<flight.esm.types.adjustments_contract.Types.ColorTransformFunction>, ?size:Float):flight.esm.types.adjustments_contract.Types.ColorLut;
  public static function bakeColorLutForRun(cache:flight.esm.types.adjustments_contract.Types.ColorLutCache, run:Array<Dynamic>, ?size:Float):flight.esm.types.adjustments_contract.Types.ColorLut;
  public static function concatColorMatrix(target:js.lib.Float32Array, source:js.lib.Float32Array):Void;
  public static function createBrightnessColorMatrix(amount:Float):js.lib.Float32Array;
  public static function createBrightnessContrastAdjustment(?options:Dynamic):flight.esm.types.adjustments_contract.Types.BrightnessContrastAdjustment;
  public static function createChannelMixerAdjustment(?options:Dynamic):flight.esm.types.adjustments_contract.Types.ChannelMixerAdjustment;
  public static function createChannelMixerColorMatrix(redOut:Array<Float>, greenOut:Array<Float>, blueOut:Array<Float>):js.lib.Float32Array;
  public static function createColorBalanceColorMatrix(shadows:Array<Float>, midtones:Array<Float>, highlights:Array<Float>):js.lib.Float32Array;
  public static function createColorBlindSimulationAdjustment(?options:Dynamic):flight.esm.types.adjustments_contract.Types.ColorBlindSimulationAdjustment;
  public static function createColorGradeAdjustment(?options:Dynamic):flight.esm.types.adjustments_contract.Types.ColorGradeAdjustment;
  public static function createColorLutCache():flight.esm.types.adjustments_contract.Types.ColorLutCache;
  public static function createColorMatrixAdjustment(colorMatrix:js.lib.Float32Array):flight.esm.types.adjustments_contract.Types.ColorMatrixAdjustment;
  public static function createColorMatrixFromTint(packedRgba:Float, amount:Float):js.lib.Float32Array;
  public static function createColorScaleBiasAdjustment(colorScaleBias:flight.esm.types.adjustments_contract.Types.ColorScaleBiasLike):flight.esm.types.adjustments_contract.Types.ColorScaleBiasAdjustment;
  public static function createContrastColorMatrix(amount:Float):js.lib.Float32Array;
  public static function createDesaturateColorMatrix(amount:Float):js.lib.Float32Array;
  public static function createExposureAdjustment(?options:Dynamic):flight.esm.types.adjustments_contract.Types.ExposureAdjustment;
  public static function createGrayscaleAdjustment(?options:Dynamic):flight.esm.types.adjustments_contract.Types.GrayscaleAdjustment;
  public static function createGrayscaleColorMatrix():js.lib.Float32Array;
  public static function createHueRotateColorMatrix(degrees:Float):js.lib.Float32Array;
  public static function createHueSaturationAdjustment(?options:Dynamic):flight.esm.types.adjustments_contract.Types.HueSaturationAdjustment;
  public static function createIdentityColorMatrix():js.lib.Float32Array;
  public static function createInvertAdjustment(?options:Dynamic):flight.esm.types.adjustments_contract.Types.InvertAdjustment;
  public static function createInvertColorMatrix():js.lib.Float32Array;
  public static function createLevelsColorMatrix(inBlack:Float, inWhite:Float, outBlack:Float, outWhite:Float, ?gamma:Float):js.lib.Float32Array;
  public static function createLiftGammaGainAdjustment(?options:Dynamic):flight.esm.types.adjustments_contract.Types.LiftGammaGainAdjustment;
  public static function createLookupTableGradeAdjustment(?options:Dynamic):flight.esm.types.adjustments_contract.Types.LookupTableGradeAdjustment;
  public static function createOpacityColorMatrix(alpha:Float):js.lib.Float32Array;
  public static function createPolaroidColorMatrix():js.lib.Float32Array;
  public static function createSaturationColorMatrix(amount:Float):js.lib.Float32Array;
  public static function createSepiaAdjustment(?options:Dynamic):flight.esm.types.adjustments_contract.Types.SepiaAdjustment;
  public static function createSepiaColorMatrix():js.lib.Float32Array;
  public static function createTechnicolorColorMatrix():js.lib.Float32Array;
  public static function createTintAdjustment(rgba:Float):flight.esm.types.adjustments_contract.Types.TintAdjustment;
  public static function createVintageColorMatrix():js.lib.Float32Array;
  public static function createWhiteBalanceColorMatrix(temperature:Float, tint:Float):js.lib.Float32Array;
  public static function fuseColorMatrices(matrices:Array<js.lib.Float32Array>):js.lib.Float32Array;
  public static function getAdjustmentColorMatrix(operation:Dynamic):Null<js.lib.Float32Array>;
  public static function getAdjustmentColorTransform(operation:Dynamic):Null<flight.esm.types.adjustments_contract.Types.ColorTransformFunction>;
  public static function isAffineColorMatrix(matrix:js.lib.Float32Array):Bool;
  public static function isColorLutAdjustment(operation:Dynamic):Bool;
  public static function isColorMatrixAdjustment(operation:Dynamic):Bool;
  public static function multiplyColorMatrix(out:js.lib.Float32Array, a:js.lib.Float32Array, b:js.lib.Float32Array):Void;
  public static function resolveColorAdjustmentsColorMatrix(adjustments:Null<Array<flight.esm.types.adjustments_contract.Types.Adjustment>>):Null<js.lib.Float32Array>;
  public static function resolveColorAdjustmentsColorScaleBias(adjustments:Null<Array<flight.esm.types.adjustments_contract.Types.Adjustment>>, out:flight.esm.types.adjustments_contract.Types.ColorScaleBias):Float;
  public static function sampleColorLut(lut:flight.esm.types.adjustments_contract.Types.ColorLut, out:Array<Float>, r:Float, g:Float, b:Float):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
