// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

inline function applyColorMatrixToColor(matrix:Array<Float>, packedRgba:Float):Float {
  return flight._cpp._fn.Adjustments.applyColorMatrixToColor(matrix, packedRgba);
}

inline function concatColorMatrix(target:Array<Float>, source:Array<Float>):Void {
  flight._cpp._fn.Adjustments.concatColorMatrix(target, source);
}

inline function fuseColorMatrices(matrices:Array<Array<Float>>):Array<Float> {
  return flight._cpp._fn.Adjustments.fuseColorMatrices(matrices);
}

inline function createBrightnessColorMatrix(amount:Float):Array<Float> {
  return flight._cpp._fn.Adjustments.createBrightnessColorMatrix(amount);
}

inline function createChannelMixerColorMatrix(redOut:Array<Float>, greenOut:Array<Float>, blueOut:Array<Float>):Array<Float> {
  return flight._cpp._fn.Adjustments.createChannelMixerColorMatrix(redOut, greenOut, blueOut);
}

inline function createColorBalanceColorMatrix(shadows:Array<Float>, midtones:Array<Float>, highlights:Array<Float>):Array<Float> {
  return flight._cpp._fn.Adjustments.createColorBalanceColorMatrix(shadows, midtones, highlights);
}

inline function createColorMatrixFromTint(packedRgba:Float, amount:Float):Array<Float> {
  return flight._cpp._fn.Adjustments.createColorMatrixFromTint(packedRgba, amount);
}

inline function createContrastColorMatrix(amount:Float):Array<Float> {
  return flight._cpp._fn.Adjustments.createContrastColorMatrix(amount);
}

inline function createDesaturateColorMatrix(amount:Float):Array<Float> {
  return flight._cpp._fn.Adjustments.createDesaturateColorMatrix(amount);
}

inline function createGrayscaleColorMatrix():Array<Float> {
  return flight._cpp._fn.Adjustments.createGrayscaleColorMatrix();
}

inline function createHueRotateColorMatrix(degrees:Float):Array<Float> {
  return flight._cpp._fn.Adjustments.createHueRotateColorMatrix(degrees);
}

inline function createIdentityColorMatrix():Array<Float> {
  return flight._cpp._fn.Adjustments.createIdentityColorMatrix();
}

inline function createInvertColorMatrix():Array<Float> {
  return flight._cpp._fn.Adjustments.createInvertColorMatrix();
}

inline function createLevelsColorMatrix(inBlack:Float, inWhite:Float, outBlack:Float, outWhite:Float, ?gamma:Float):Array<Float> {
  return flight._cpp._fn.Adjustments.createLevelsColorMatrix(inBlack, inWhite, outBlack, outWhite, gamma != null, gamma == null ? 0.0 : gamma);
}

inline function createOpacityColorMatrix(alpha:Float):Array<Float> {
  return flight._cpp._fn.Adjustments.createOpacityColorMatrix(alpha);
}

inline function createPolaroidColorMatrix():Array<Float> {
  return flight._cpp._fn.Adjustments.createPolaroidColorMatrix();
}

inline function createSaturationColorMatrix(amount:Float):Array<Float> {
  return flight._cpp._fn.Adjustments.createSaturationColorMatrix(amount);
}

inline function createSepiaColorMatrix():Array<Float> {
  return flight._cpp._fn.Adjustments.createSepiaColorMatrix();
}

inline function createTechnicolorColorMatrix():Array<Float> {
  return flight._cpp._fn.Adjustments.createTechnicolorColorMatrix();
}

inline function createVintageColorMatrix():Array<Float> {
  return flight._cpp._fn.Adjustments.createVintageColorMatrix();
}

inline function createWhiteBalanceColorMatrix(temperature:Float, tint:Float):Array<Float> {
  return flight._cpp._fn.Adjustments.createWhiteBalanceColorMatrix(temperature, tint);
}

inline function isAffineColorMatrix(matrix:Array<Float>):Bool {
  return flight._cpp._fn.Adjustments.isAffineColorMatrix(matrix);
}

inline function multiplyColorMatrix(a:Array<Float>, b:Array<Float>, ?out:Array<Float>):Array<Float> {
  return flight._cpp._fn.Adjustments.multiplyColorMatrix(a, b, out != null, out == null ? ([] : Array<Float>) : out);
}

var COLOR_ADJUSTMENT_AFFINE(get, set):Float;

private extern inline function get_COLOR_ADJUSTMENT_AFFINE():Float return flight._cpp._attempt.Attempt_Adjustments_COLOR_ADJUSTMENT_AFFINE.COLOR_ADJUSTMENT_AFFINE;

private extern inline function set_COLOR_ADJUSTMENT_AFFINE(value:Float):Float return flight._cpp._attempt.Attempt_Adjustments_COLOR_ADJUSTMENT_AFFINE.COLOR_ADJUSTMENT_AFFINE = value;

var COLOR_ADJUSTMENT_CHANNEL_MIXING(get, set):Float;

private extern inline function get_COLOR_ADJUSTMENT_CHANNEL_MIXING():Float return flight._cpp._attempt.Attempt_Adjustments_COLOR_ADJUSTMENT_CHANNEL_MIXING.COLOR_ADJUSTMENT_CHANNEL_MIXING;

private extern inline function set_COLOR_ADJUSTMENT_CHANNEL_MIXING(value:Float):Float return flight._cpp._attempt.Attempt_Adjustments_COLOR_ADJUSTMENT_CHANNEL_MIXING.COLOR_ADJUSTMENT_CHANNEL_MIXING = value;

var COLOR_ADJUSTMENT_NONE(get, set):Float;

private extern inline function get_COLOR_ADJUSTMENT_NONE():Float return flight._cpp._attempt.Attempt_Adjustments_COLOR_ADJUSTMENT_NONE.COLOR_ADJUSTMENT_NONE;

private extern inline function set_COLOR_ADJUSTMENT_NONE(value:Float):Float return flight._cpp._attempt.Attempt_Adjustments_COLOR_ADJUSTMENT_NONE.COLOR_ADJUSTMENT_NONE = value;

var COLOR_LUT_DEFAULT_SIZE(get, set):Float;

private extern inline function get_COLOR_LUT_DEFAULT_SIZE():Float return flight._cpp._attempt.Attempt_Adjustments_COLOR_LUT_DEFAULT_SIZE.COLOR_LUT_DEFAULT_SIZE;

private extern inline function set_COLOR_LUT_DEFAULT_SIZE(value:Float):Float return flight._cpp._attempt.Attempt_Adjustments_COLOR_LUT_DEFAULT_SIZE.COLOR_LUT_DEFAULT_SIZE = value;

var COLOR_MATRIX_LENGTH(get, set):Float;

private extern inline function get_COLOR_MATRIX_LENGTH():Float return flight._cpp._attempt.Attempt_Adjustments_COLOR_MATRIX_LENGTH.COLOR_MATRIX_LENGTH;

private extern inline function set_COLOR_MATRIX_LENGTH(value:Float):Float return flight._cpp._attempt.Attempt_Adjustments_COLOR_MATRIX_LENGTH.COLOR_MATRIX_LENGTH = value;

extern inline function bakeColorLut(transforms:Array<flight.ColorTransformFunction>, ?size:Float):flight.ColorLut {
  return flight._cpp._attempt.Attempt_Adjustments_bakeColorLut.bakeColorLut(transforms, size);
}

extern inline function bakeColorLutForRun(cache:flight.ColorLutCache, run:Array<{ kind:String }>, ?size:Float):flight.ColorLut {
  return flight._cpp._attempt.Attempt_Adjustments_bakeColorLutForRun.bakeColorLutForRun(cache, run, size);
}

extern inline function createBrightnessContrastAdjustment(?options:Dynamic):flight.BrightnessContrastAdjustment {
  return flight._cpp._attempt.Attempt_Adjustments_createBrightnessContrastAdjustment.createBrightnessContrastAdjustment(options);
}

extern inline function createChannelMixerAdjustment(?options:Dynamic):flight.ChannelMixerAdjustment {
  return flight._cpp._attempt.Attempt_Adjustments_createChannelMixerAdjustment.createChannelMixerAdjustment(options);
}

extern inline function createColorBlindSimulationAdjustment(?options:Dynamic):flight.ColorBlindSimulationAdjustment {
  return flight._cpp._attempt.Attempt_Adjustments_createColorBlindSimulationAdjustment.createColorBlindSimulationAdjustment(options);
}

extern inline function createColorGradeAdjustment(?options:Dynamic):flight.ColorGradeAdjustment {
  return flight._cpp._attempt.Attempt_Adjustments_createColorGradeAdjustment.createColorGradeAdjustment(options);
}

extern inline function createColorLutCache():flight.ColorLutCache {
  return flight._cpp._attempt.Attempt_Adjustments_createColorLutCache.createColorLutCache();
}

extern inline function createColorMatrixAdjustment(colorMatrix:Array<Float>):flight.ColorMatrixAdjustment {
  return flight._cpp._attempt.Attempt_Adjustments_createColorMatrixAdjustment.createColorMatrixAdjustment(colorMatrix);
}

extern inline function createColorScaleBiasAdjustment(colorScaleBias:flight.ColorScaleBiasLike):flight.ColorScaleBiasAdjustment {
  return flight._cpp._attempt.Attempt_Adjustments_createColorScaleBiasAdjustment.createColorScaleBiasAdjustment(colorScaleBias);
}

extern inline function createExposureAdjustment(?options:Dynamic):flight.ExposureAdjustment {
  return flight._cpp._attempt.Attempt_Adjustments_createExposureAdjustment.createExposureAdjustment(options);
}

extern inline function createGrayscaleAdjustment(?options:Dynamic):flight.GrayscaleAdjustment {
  return flight._cpp._attempt.Attempt_Adjustments_createGrayscaleAdjustment.createGrayscaleAdjustment(options);
}

extern inline function createHueSaturationAdjustment(?options:Dynamic):flight.HueSaturationAdjustment {
  return flight._cpp._attempt.Attempt_Adjustments_createHueSaturationAdjustment.createHueSaturationAdjustment(options);
}

extern inline function createInvertAdjustment(?options:Dynamic):flight.InvertAdjustment {
  return flight._cpp._attempt.Attempt_Adjustments_createInvertAdjustment.createInvertAdjustment(options);
}

extern inline function createLiftGammaGainAdjustment(?options:Dynamic):flight.LiftGammaGainAdjustment {
  return flight._cpp._attempt.Attempt_Adjustments_createLiftGammaGainAdjustment.createLiftGammaGainAdjustment(options);
}

extern inline function createLookupTableGradeAdjustment(?options:Dynamic):flight.LookupTableGradeAdjustment {
  return flight._cpp._attempt.Attempt_Adjustments_createLookupTableGradeAdjustment.createLookupTableGradeAdjustment(options);
}

extern inline function createSepiaAdjustment(?options:Dynamic):flight.SepiaAdjustment {
  return flight._cpp._attempt.Attempt_Adjustments_createSepiaAdjustment.createSepiaAdjustment(options);
}

extern inline function createTintAdjustment(rgba:Float):flight.TintAdjustment {
  return flight._cpp._attempt.Attempt_Adjustments_createTintAdjustment.createTintAdjustment(rgba);
}

extern inline function getAdjustmentColorMatrix(operation:{ kind:String }):Null<Array<Float>> {
  return flight._cpp._attempt.Attempt_Adjustments_getAdjustmentColorMatrix.getAdjustmentColorMatrix(operation);
}

extern inline function getAdjustmentColorTransform(operation:{ kind:String }):Null<flight.ColorTransformFunction> {
  return flight._cpp._attempt.Attempt_Adjustments_getAdjustmentColorTransform.getAdjustmentColorTransform(operation);
}

extern inline function initializeAdjustment<T:flight.Adjustment>(out:flight.EntityConstruction<T>, kind:flight.AdjustmentKind):Void {
  flight._cpp._attempt.Attempt_Adjustments_initializeAdjustment.initializeAdjustment(out, kind);
}

extern inline function initializeBrightnessContrastAdjustment(out:flight.EntityConstruction<flight.BrightnessContrastAdjustment>, ?options:Dynamic):Void {
  flight._cpp._attempt.Attempt_Adjustments_initializeBrightnessContrastAdjustment.initializeBrightnessContrastAdjustment(out, options);
}

extern inline function initializeChannelMixerAdjustment(out:flight.EntityConstruction<flight.ChannelMixerAdjustment>, ?options:Dynamic):Void {
  flight._cpp._attempt.Attempt_Adjustments_initializeChannelMixerAdjustment.initializeChannelMixerAdjustment(out, options);
}

extern inline function initializeColorBlindSimulationAdjustment(out:flight.EntityConstruction<flight.ColorBlindSimulationAdjustment>, ?options:Dynamic):Void {
  flight._cpp._attempt.Attempt_Adjustments_initializeColorBlindSimulationAdjustment.initializeColorBlindSimulationAdjustment(out, options);
}

extern inline function initializeColorGradeAdjustment(out:flight.EntityConstruction<flight.ColorGradeAdjustment>, ?options:Dynamic):Void {
  flight._cpp._attempt.Attempt_Adjustments_initializeColorGradeAdjustment.initializeColorGradeAdjustment(out, options);
}

extern inline function initializeColorLutAdjustment<T:flight.ColorLutAdjustment>(out:flight.EntityConstruction<T>, kind:flight.AdjustmentKind, transform:flight.ColorTransformFunction):Void {
  flight._cpp._attempt.Attempt_Adjustments_initializeColorLutAdjustment.initializeColorLutAdjustment(out, kind, transform);
}

extern inline function initializeColorLutCache(out:flight.EntityConstruction<flight.ColorLutCache>):Void {
  flight._cpp._attempt.Attempt_Adjustments_initializeColorLutCache.initializeColorLutCache(out);
}

extern inline function initializeColorMatrixAdjustment<T:flight.ColorMatrixAdjustment>(out:flight.EntityConstruction<T>, kind:flight.AdjustmentKind, colorMatrix:Array<Float>):Void {
  flight._cpp._attempt.Attempt_Adjustments_initializeColorMatrixAdjustment.initializeColorMatrixAdjustment(out, kind, colorMatrix);
}

extern inline function initializeColorScaleBiasAdjustment(out:flight.EntityConstruction<flight.ColorScaleBiasAdjustment>, colorScaleBias:flight.ColorScaleBiasLike):Void {
  flight._cpp._attempt.Attempt_Adjustments_initializeColorScaleBiasAdjustment.initializeColorScaleBiasAdjustment(out, colorScaleBias);
}

extern inline function initializeExposureAdjustment(out:flight.EntityConstruction<flight.ExposureAdjustment>, ?options:Dynamic):Void {
  flight._cpp._attempt.Attempt_Adjustments_initializeExposureAdjustment.initializeExposureAdjustment(out, options);
}

extern inline function initializeGrayscaleAdjustment(out:flight.EntityConstruction<flight.GrayscaleAdjustment>, ?options:Dynamic):Void {
  flight._cpp._attempt.Attempt_Adjustments_initializeGrayscaleAdjustment.initializeGrayscaleAdjustment(out, options);
}

extern inline function initializeHueSaturationAdjustment(out:flight.EntityConstruction<flight.HueSaturationAdjustment>, ?options:Dynamic):Void {
  flight._cpp._attempt.Attempt_Adjustments_initializeHueSaturationAdjustment.initializeHueSaturationAdjustment(out, options);
}

extern inline function initializeInvertAdjustment(out:flight.EntityConstruction<flight.InvertAdjustment>, ?options:Dynamic):Void {
  flight._cpp._attempt.Attempt_Adjustments_initializeInvertAdjustment.initializeInvertAdjustment(out, options);
}

extern inline function initializeLiftGammaGainAdjustment(out:flight.EntityConstruction<flight.LiftGammaGainAdjustment>, ?options:Dynamic):Void {
  flight._cpp._attempt.Attempt_Adjustments_initializeLiftGammaGainAdjustment.initializeLiftGammaGainAdjustment(out, options);
}

extern inline function initializeLookupTableGradeAdjustment(out:flight.EntityConstruction<flight.LookupTableGradeAdjustment>, ?options:Dynamic):Void {
  flight._cpp._attempt.Attempt_Adjustments_initializeLookupTableGradeAdjustment.initializeLookupTableGradeAdjustment(out, options);
}

extern inline function initializeSepiaAdjustment(out:flight.EntityConstruction<flight.SepiaAdjustment>, ?options:Dynamic):Void {
  flight._cpp._attempt.Attempt_Adjustments_initializeSepiaAdjustment.initializeSepiaAdjustment(out, options);
}

extern inline function initializeTintAdjustment(out:flight.EntityConstruction<flight.TintAdjustment>, rgba:Float):Void {
  flight._cpp._attempt.Attempt_Adjustments_initializeTintAdjustment.initializeTintAdjustment(out, rgba);
}

extern inline function isColorLutAdjustment(operation:{ kind:String }):Bool {
  return flight._cpp._attempt.Attempt_Adjustments_isColorLutAdjustment.isColorLutAdjustment(operation);
}

extern inline function isColorMatrixAdjustment(operation:{ kind:String }):Bool {
  return flight._cpp._attempt.Attempt_Adjustments_isColorMatrixAdjustment.isColorMatrixAdjustment(operation);
}

extern inline function resolveColorAdjustmentsColorMatrix(adjustments:Null<Array<flight.Adjustment>>):Null<Array<Float>> {
  return flight._cpp._attempt.Attempt_Adjustments_resolveColorAdjustmentsColorMatrix.resolveColorAdjustmentsColorMatrix(adjustments);
}

extern inline function resolveColorAdjustmentsColorScaleBias(adjustments:Null<Array<flight.Adjustment>>, out:flight.ColorScaleBias):Float {
  return flight._cpp._attempt.Attempt_Adjustments_resolveColorAdjustmentsColorScaleBias.resolveColorAdjustmentsColorScaleBias(adjustments, out);
}

extern inline function sampleColorLut(lut:flight.ColorLut, out:Array<Float>, r:Float, g:Float, b:Float):Void {
  flight._cpp._attempt.Attempt_Adjustments_sampleColorLut.sampleColorLut(lut, out, r, g, b);
}
