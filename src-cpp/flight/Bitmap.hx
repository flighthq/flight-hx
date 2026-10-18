// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

typedef Bitmap = flight._cpp.Bitmap;

var BITMAP_FINGERPRINT_COMPUTATION_ID(get, set):String;

private extern inline function get_BITMAP_FINGERPRINT_COMPUTATION_ID():String return flight._cpp._attempt.Attempt_Bitmap_BITMAP_FINGERPRINT_COMPUTATION_ID.BITMAP_FINGERPRINT_COMPUTATION_ID;

private extern inline function set_BITMAP_FINGERPRINT_COMPUTATION_ID(value:String):String return flight._cpp._attempt.Attempt_Bitmap_BITMAP_FINGERPRINT_COMPUTATION_ID.BITMAP_FINGERPRINT_COMPUTATION_ID = value;

var BITMAP_NOISE_CHANNEL_A(get, set):Float;

private extern inline function get_BITMAP_NOISE_CHANNEL_A():Float return flight._cpp._attempt.Attempt_Bitmap_BITMAP_NOISE_CHANNEL_A.BITMAP_NOISE_CHANNEL_A;

private extern inline function set_BITMAP_NOISE_CHANNEL_A(value:Float):Float return flight._cpp._attempt.Attempt_Bitmap_BITMAP_NOISE_CHANNEL_A.BITMAP_NOISE_CHANNEL_A = value;

var BITMAP_NOISE_CHANNEL_B(get, set):Float;

private extern inline function get_BITMAP_NOISE_CHANNEL_B():Float return flight._cpp._attempt.Attempt_Bitmap_BITMAP_NOISE_CHANNEL_B.BITMAP_NOISE_CHANNEL_B;

private extern inline function set_BITMAP_NOISE_CHANNEL_B(value:Float):Float return flight._cpp._attempt.Attempt_Bitmap_BITMAP_NOISE_CHANNEL_B.BITMAP_NOISE_CHANNEL_B = value;

var BITMAP_NOISE_CHANNEL_G(get, set):Float;

private extern inline function get_BITMAP_NOISE_CHANNEL_G():Float return flight._cpp._attempt.Attempt_Bitmap_BITMAP_NOISE_CHANNEL_G.BITMAP_NOISE_CHANNEL_G;

private extern inline function set_BITMAP_NOISE_CHANNEL_G(value:Float):Float return flight._cpp._attempt.Attempt_Bitmap_BITMAP_NOISE_CHANNEL_G.BITMAP_NOISE_CHANNEL_G = value;

var BITMAP_NOISE_CHANNEL_R(get, set):Float;

private extern inline function get_BITMAP_NOISE_CHANNEL_R():Float return flight._cpp._attempt.Attempt_Bitmap_BITMAP_NOISE_CHANNEL_R.BITMAP_NOISE_CHANNEL_R;

private extern inline function set_BITMAP_NOISE_CHANNEL_R(value:Float):Float return flight._cpp._attempt.Attempt_Bitmap_BITMAP_NOISE_CHANNEL_R.BITMAP_NOISE_CHANNEL_R = value;

var ImageChannel(get, set):{ Red:Float, Green:Float, Blue:Float, Alpha:Float };

private extern inline function get_ImageChannel():{ Red:Float, Green:Float, Blue:Float, Alpha:Float } return flight._cpp._attempt.Attempt_Bitmap_ImageChannel.ImageChannel;

private extern inline function set_ImageChannel(value:{ Red:Float, Green:Float, Blue:Float, Alpha:Float }):{ Red:Float, Green:Float, Blue:Float, Alpha:Float } return flight._cpp._attempt.Attempt_Bitmap_ImageChannel.ImageChannel = value;

extern inline function applyBitmapColorScaleBias(dest:flight.BitmapRegion, source:flight.BitmapRegion, ct:flight.ColorScaleBiasLike):Void {
  flight._cpp._attempt.Attempt_Bitmap_applyBitmapColorScaleBias.applyBitmapColorScaleBias(dest, source, ct);
}

extern inline function applyBitmapCurve(out:flight.BitmapRegion, source:flight.BitmapRegion, redLut:Dynamic, greenLut:Dynamic, blueLut:Dynamic, ?alphaLut:Dynamic):Void {
  flight._cpp._attempt.Attempt_Bitmap_applyBitmapCurve.applyBitmapCurve(out, source, redLut, greenLut, blueLut, alphaLut);
}

extern inline function applyBitmapLevels(out:flight.BitmapRegion, source:flight.BitmapRegion, ?blackPoint:Float, ?whitePoint:Float, ?gamma:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_applyBitmapLevels.applyBitmapLevels(out, source, blackPoint, whitePoint, gamma);
}

extern inline function applyBitmapPaletteMap(dest:flight.BitmapRegion, source:flight.BitmapRegion, redMap:Null<Array<Float>>, greenMap:Null<Array<Float>>, blueMap:Null<Array<Float>>, alphaMap:Null<Array<Float>>):Void {
  flight._cpp._attempt.Attempt_Bitmap_applyBitmapPaletteMap.applyBitmapPaletteMap(dest, source, redMap, greenMap, blueMap, alphaMap);
}

extern inline function applyBitmapThreshold(dest:flight.BitmapRegion, source:flight.BitmapRegion, operation:flight.ThresholdOperation, thresholdValue:Float, ?color:Float, ?mask:Float, ?copySource:Bool):Float {
  return flight._cpp._attempt.Attempt_Bitmap_applyBitmapThreshold.applyBitmapThreshold(dest, source, operation, thresholdValue, color, mask, copySource);
}

extern inline function bevelBitmap(out:flight._internal._UInt8ClampedArray, scratch:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, ?options:flight.BitmapBevelOptions):Void {
  flight._cpp._attempt.Attempt_Bitmap_bevelBitmap.bevelBitmap(out, scratch, source, options);
}

extern inline function blurBitmapPixelsHorizontal(out:flight._internal._UInt8ClampedArray, source:flight._internal._UInt8ClampedArray, width:Float, height:Float, radius:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_blurBitmapPixelsHorizontal.blurBitmapPixelsHorizontal(out, source, width, height, radius);
}

extern inline function blurBitmapPixelsHorizontalWeighted(out:flight._internal._UInt8ClampedArray, source:flight._internal._UInt8ClampedArray, width:Float, height:Float, kernel:flight._internal._Float32Array):Void {
  flight._cpp._attempt.Attempt_Bitmap_blurBitmapPixelsHorizontalWeighted.blurBitmapPixelsHorizontalWeighted(out, source, width, height, kernel);
}

extern inline function blurBitmapPixelsVertical(out:flight._internal._UInt8ClampedArray, source:flight._internal._UInt8ClampedArray, width:Float, height:Float, radius:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_blurBitmapPixelsVertical.blurBitmapPixelsVertical(out, source, width, height, radius);
}

extern inline function blurBitmapPixelsVerticalWeighted(out:flight._internal._UInt8ClampedArray, source:flight._internal._UInt8ClampedArray, width:Float, height:Float, kernel:flight._internal._Float32Array):Void {
  flight._cpp._attempt.Attempt_Bitmap_blurBitmapPixelsVerticalWeighted.blurBitmapPixelsVerticalWeighted(out, source, width, height, kernel);
}

extern inline function boxBlurBitmap(out:flight._internal._UInt8ClampedArray, scratch:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, ?options:flight.BitmapBoxBlurOptions):Void {
  flight._cpp._attempt.Attempt_Bitmap_boxBlurBitmap.boxBlurBitmap(out, scratch, source, options);
}

extern inline function buildBitmapBrightnessColorMatrix(out:Array<Float>, amount:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_buildBitmapBrightnessColorMatrix.buildBitmapBrightnessColorMatrix(out, amount);
}

extern inline function buildBitmapContrastColorMatrix(out:Array<Float>, amount:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_buildBitmapContrastColorMatrix.buildBitmapContrastColorMatrix(out, amount);
}

extern inline function buildBitmapGradientRamp(out:flight._internal._UInt8ClampedArray, colors:Array<Float>, alphas:Array<Float>, ratios:Array<Float>):Void {
  flight._cpp._attempt.Attempt_Bitmap_buildBitmapGradientRamp.buildBitmapGradientRamp(out, colors, alphas, ratios);
}

extern inline function buildBitmapGrayscaleColorMatrix(out:Array<Float>):Void {
  flight._cpp._attempt.Attempt_Bitmap_buildBitmapGrayscaleColorMatrix.buildBitmapGrayscaleColorMatrix(out);
}

extern inline function buildBitmapHueRotationColorMatrix(out:Array<Float>, degrees:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_buildBitmapHueRotationColorMatrix.buildBitmapHueRotationColorMatrix(out, degrees);
}

extern inline function buildBitmapInvertColorMatrix(out:Array<Float>):Void {
  flight._cpp._attempt.Attempt_Bitmap_buildBitmapInvertColorMatrix.buildBitmapInvertColorMatrix(out);
}

extern inline function buildBitmapSaturationColorMatrix(out:Array<Float>, amount:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_buildBitmapSaturationColorMatrix.buildBitmapSaturationColorMatrix(out, amount);
}

extern inline function buildBitmapSepiaColorMatrix(out:Array<Float>):Void {
  flight._cpp._attempt.Attempt_Bitmap_buildBitmapSepiaColorMatrix.buildBitmapSepiaColorMatrix(out);
}

extern inline function captureBitmapFromImageResource(hostBitmapReadback:flight.HostBitmapReadbackCapability, resource:flight.ImageResource):Null<flight.Bitmap> {
  return flight._cpp._attempt.Attempt_Bitmap_captureBitmapFromImageResource.captureBitmapFromImageResource(hostBitmapReadback, resource);
}

extern inline function cloneBitmap(source:flight.Bitmap):flight.Bitmap {
  return flight._cpp._attempt.Attempt_Bitmap_cloneBitmap.cloneBitmap(source);
}

extern inline function colorMatrixBitmap(out:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, matrix:Array<Float>):Void {
  flight._cpp._attempt.Attempt_Bitmap_colorMatrixBitmap.colorMatrixBitmap(out, source, matrix);
}

extern inline function compareBitmap(source:flight.Bitmap, other:flight.Bitmap):Null<flight.Bitmap> {
  return flight._cpp._attempt.Attempt_Bitmap_compareBitmap.compareBitmap(source, other);
}

extern inline function compareBitmapFingerprints(a:flight.BitmapFingerprint, b:flight.BitmapFingerprint):Float {
  return flight._cpp._attempt.Attempt_Bitmap_compareBitmapFingerprints.compareBitmapFingerprints(a, b);
}

extern inline function compositeBitmapPixels(dest:flight.BitmapRegion, pixels:flight._internal._UInt8ClampedArray, ?mode:flight.BitmapCompositeMode):Void {
  flight._cpp._attempt.Attempt_Bitmap_compositeBitmapPixels.compositeBitmapPixels(dest, pixels, mode);
}

extern inline function compositeBitmapRegion(dest:flight.BitmapRegion, source:flight.BitmapRegion, ?mode:flight.BitmapCompositeMode):Void {
  flight._cpp._attempt.Attempt_Bitmap_compositeBitmapRegion.compositeBitmapRegion(dest, source, mode);
}

extern inline function computeGaussianKernel(out:flight._internal._Float32Array, radius:Float, sigma:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_computeGaussianKernel.computeGaussianKernel(out, radius, sigma);
}

extern inline function concatBitmapColorMatrix(out:Array<Float>, first:Array<Float>, second:Array<Float>):Void {
  flight._cpp._attempt.Attempt_Bitmap_concatBitmapColorMatrix.concatBitmapColorMatrix(out, first, second);
}

extern inline function convertBitmapAlphaType(out:flight.Bitmap, target:flight.AlphaType):Void {
  flight._cpp._attempt.Attempt_Bitmap_convertBitmapAlphaType.convertBitmapAlphaType(out, target);
}

extern inline function convertBitmapPixelOrder(out:flight._internal._UInt8ClampedArray, source:flight._internal._UInt8ClampedArray, length:Float, from:flight.PixelOrder, to:flight.PixelOrder):Void {
  flight._cpp._attempt.Attempt_Bitmap_convertBitmapPixelOrder.convertBitmapPixelOrder(out, source, length, from, to);
}

extern inline function convolveBitmap(out:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, options:flight.BitmapConvolutionOptions):Void {
  flight._cpp._attempt.Attempt_Bitmap_convolveBitmap.convolveBitmap(out, source, options);
}

extern inline function copyBitmapAlpha(dest:flight.BitmapRegion, source:flight.BitmapRegion):Void {
  flight._cpp._attempt.Attempt_Bitmap_copyBitmapAlpha.copyBitmapAlpha(dest, source);
}

extern inline function copyBitmapChannel(dest:flight.BitmapRegion, destChannel:flight.ImageChannel, source:flight.BitmapRegion, sourceChannel:flight.ImageChannel):Void {
  flight._cpp._attempt.Attempt_Bitmap_copyBitmapChannel.copyBitmapChannel(dest, destChannel, source, sourceChannel);
}

extern inline function copyBitmapPixels(dest:flight.BitmapRegion, source:flight.BitmapRegion, ?composite:Bool):Void {
  flight._cpp._attempt.Attempt_Bitmap_copyBitmapPixels.copyBitmapPixels(dest, source, composite);
}

extern inline function createBitmap(width:Float, height:Float, ?color:Float):flight.Bitmap {
  return flight._cpp._attempt.Attempt_Bitmap_createBitmap.createBitmap(width, height, color);
}

extern inline function createBitmapFingerprint(source:flight.Bitmap, ?gridSize:Float):flight.BitmapFingerprint {
  return flight._cpp._attempt.Attempt_Bitmap_createBitmapFingerprint.createBitmapFingerprint(source, gridSize);
}

extern inline function createBitmapFromImageSource(hostBitmapReadback:flight.HostBitmapReadbackCapability, source:flight.HostImageSource, width:Float, height:Float):Null<flight.Bitmap> {
  return flight._cpp._attempt.Attempt_Bitmap_createBitmapFromImageSource.createBitmapFromImageSource(hostBitmapReadback, source, width, height);
}

extern inline function createBitmapRegion(bitmap:flight.Bitmap, ?x:Float, ?y:Float, ?width:Float, ?height:Float):flight.BitmapRegion {
  return flight._cpp._attempt.Attempt_Bitmap_createBitmapRegion.createBitmapRegion(bitmap, x, y, width, height);
}

extern inline function cropBitmap(source:flight.Bitmap, rect:flight.RectangleLike):flight.Bitmap {
  return flight._cpp._attempt.Attempt_Bitmap_cropBitmap.cropBitmap(source, rect);
}

extern inline function dilateBitmap(out:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, radius:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_dilateBitmap.dilateBitmap(out, source, radius);
}

extern inline function displaceBitmap(out:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, options:flight.BitmapDisplacementMapOptions):Void {
  flight._cpp._attempt.Attempt_Bitmap_displaceBitmap.displaceBitmap(out, source, options);
}

extern inline function dissolveBitmapPixels(dest:flight.BitmapRegion, source:flight.BitmapRegion, seed:Float, pixelCount:Float, ?fillColor:Float):Float {
  return flight._cpp._attempt.Attempt_Bitmap_dissolveBitmapPixels.dissolveBitmapPixels(dest, source, seed, pixelCount, fillColor);
}

extern inline function dropShadowBitmap(out:flight._internal._UInt8ClampedArray, scratch:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, ?options:flight.BitmapDropShadowOptions):Void {
  flight._cpp._attempt.Attempt_Bitmap_dropShadowBitmap.dropShadowBitmap(out, scratch, source, options);
}

extern inline function encodeBitmap(hostBitmapEncode:flight.HostBitmapEncodeCapability, source:flight.Bitmap, ?format:flight.ImageFormat, ?quality:Float):Null<flight._internal._UInt8Array> {
  return flight._cpp._attempt.Attempt_Bitmap_encodeBitmap.encodeBitmap(hostBitmapEncode, source, format, quality);
}

extern inline function equalizeBitmapHistogram(dest:flight.BitmapRegion, source:flight.BitmapRegion):Void {
  flight._cpp._attempt.Attempt_Bitmap_equalizeBitmapHistogram.equalizeBitmapHistogram(dest, source);
}

extern inline function erodeBitmap(out:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, radius:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_erodeBitmap.erodeBitmap(out, source, radius);
}

extern inline function explainBitmapEncodeFailure(hostBitmapEncode:flight.HostBitmapEncodeCapability, format:flight.ImageFormat):Null<flight.BitmapEncodeFailureExplanation> {
  return flight._cpp._attempt.Attempt_Bitmap_explainBitmapEncodeFailure.explainBitmapEncodeFailure(hostBitmapEncode, format);
}

extern inline function explainBitmapReadback(hostBitmapReadback:flight.HostBitmapReadbackCapability, source:flight.HostImageSource, width:Float, height:Float):flight.BitmapReadbackExplanation {
  return flight._cpp._attempt.Attempt_Bitmap_explainBitmapReadback.explainBitmapReadback(hostBitmapReadback, source, width, height);
}

extern inline function extendBitmap(source:flight.Bitmap, left:Float, top:Float, right:Float, bottom:Float, ?edgeMode:flight.BitmapEdgeMode, ?fillColor:Float):flight.Bitmap {
  return flight._cpp._attempt.Attempt_Bitmap_extendBitmap.extendBitmap(source, left, top, right, bottom, edgeMode, fillColor);
}

extern inline function extractBitmapPixels(out:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion):Void {
  flight._cpp._attempt.Attempt_Bitmap_extractBitmapPixels.extractBitmapPixels(out, source);
}

extern inline function extractBitmapPixels32(out:flight._internal._UInt32Array, source:flight.BitmapRegion):Void {
  flight._cpp._attempt.Attempt_Bitmap_extractBitmapPixels32.extractBitmapPixels32(out, source);
}

extern inline function fillBitmapLinearGradient(dest:flight.BitmapRegion, ramp:flight._internal._UInt8ClampedArray, x0:Float, y0:Float, x1:Float, y1:Float, ?spread:flight.GradientSpread):Void {
  flight._cpp._attempt.Attempt_Bitmap_fillBitmapLinearGradient.fillBitmapLinearGradient(dest, ramp, x0, y0, x1, y1, spread);
}

extern inline function fillBitmapNoise(dest:flight.BitmapRegion, seed:Float, ?low:Float, ?high:Float, ?grayScale:Bool):Void {
  flight._cpp._attempt.Attempt_Bitmap_fillBitmapNoise.fillBitmapNoise(dest, seed, low, high, grayScale);
}

extern inline function fillBitmapPerlinNoise(dest:flight.BitmapRegion, baseX:Float, baseY:Float, octaves:Float, seed:Float, ?grayScale:Bool, ?stitch:Bool, ?channelOptions:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_fillBitmapPerlinNoise.fillBitmapPerlinNoise(dest, baseX, baseY, octaves, seed, grayScale, stitch, channelOptions);
}

extern inline function fillBitmapRadialGradient(dest:flight.BitmapRegion, ramp:flight._internal._UInt8ClampedArray, cx:Float, cy:Float, radius:Float, ?focalX:Float, ?focalY:Float, ?spread:flight.GradientSpread):Void {
  flight._cpp._attempt.Attempt_Bitmap_fillBitmapRadialGradient.fillBitmapRadialGradient(dest, ramp, cx, cy, radius, focalX, focalY, spread);
}

extern inline function fillBitmapRectangle(dest:flight.BitmapRegion, color:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_fillBitmapRectangle.fillBitmapRectangle(dest, color);
}

extern inline function fillBitmapTurbulence(dest:flight.BitmapRegion, baseX:Float, baseY:Float, octaves:Float, seed:Float, ?grayScale:Bool, ?stitch:Bool, ?channelOptions:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_fillBitmapTurbulence.fillBitmapTurbulence(dest, baseX, baseY, octaves, seed, grayScale, stitch, channelOptions);
}

extern inline function flipBitmapHorizontal(dest:flight.BitmapRegion, source:flight.BitmapRegion):Void {
  flight._cpp._attempt.Attempt_Bitmap_flipBitmapHorizontal.flipBitmapHorizontal(dest, source);
}

extern inline function flipBitmapVertical(dest:flight.BitmapRegion, source:flight.BitmapRegion):Void {
  flight._cpp._attempt.Attempt_Bitmap_flipBitmapVertical.flipBitmapVertical(dest, source);
}

extern inline function floodFillBitmap(out:flight.Bitmap, x:Float, y:Float, color:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_floodFillBitmap.floodFillBitmap(out, x, y, color);
}

extern inline function formatBitmapFingerprint(fingerprint:flight.BitmapFingerprint):String {
  return flight._cpp._attempt.Attempt_Bitmap_formatBitmapFingerprint.formatBitmapFingerprint(fingerprint);
}

extern inline function gaussianBlurBitmap(out:flight._internal._UInt8ClampedArray, scratch:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, sigmaX:Float, ?sigmaY:Float, ?passes:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_gaussianBlurBitmap.gaussianBlurBitmap(out, scratch, source, sigmaX, sigmaY, passes);
}

extern inline function getBitmapColorBoundsRectangle(source:flight.BitmapRegion, mask:Float, color:Float, ?findColor:Bool):Null<flight.RectangleLike> {
  return flight._cpp._attempt.Attempt_Bitmap_getBitmapColorBoundsRectangle.getBitmapColorBoundsRectangle(source, mask, color, findColor);
}

extern inline function getBitmapCoverage(source:flight.Bitmap, backgroundColor:Float, ?channelTolerance:Float):Float {
  return flight._cpp._attempt.Attempt_Bitmap_getBitmapCoverage.getBitmapCoverage(source, backgroundColor, channelTolerance);
}

extern inline function getBitmapHistogram(source:flight.BitmapRegion):flight.BitmapHistogram {
  return flight._cpp._attempt.Attempt_Bitmap_getBitmapHistogram.getBitmapHistogram(source);
}

extern inline function getBitmapMismatch(source:{ width:Float, height:Float, data:Dynamic }, other:{ width:Float, height:Float, data:Dynamic }, ?channelTolerance:Float):flight.BitmapMismatch {
  return flight._cpp._attempt.Attempt_Bitmap_getBitmapMismatch.getBitmapMismatch(source, other, channelTolerance);
}

extern inline function getBitmapPixel(source:flight.Bitmap, x:Float, y:Float):Float {
  return flight._cpp._attempt.Attempt_Bitmap_getBitmapPixel.getBitmapPixel(source, x, y);
}

extern inline function getBitmapPixelChannel(source:flight.Bitmap, x:Float, y:Float, channel:flight.ImageChannel):Float {
  return flight._cpp._attempt.Attempt_Bitmap_getBitmapPixelChannel.getBitmapPixelChannel(source, x, y, channel);
}

extern inline function getBitmapPixelLuminance(source:flight.Bitmap, x:Float, y:Float):Float {
  return flight._cpp._attempt.Attempt_Bitmap_getBitmapPixelLuminance.getBitmapPixelLuminance(source, x, y);
}

extern inline function getBitmapPixelRgb(source:flight.Bitmap, x:Float, y:Float):Float {
  return flight._cpp._attempt.Attempt_Bitmap_getBitmapPixelRgb.getBitmapPixelRgb(source, x, y);
}

extern inline function glowBitmap(out:flight._internal._UInt8ClampedArray, scratch:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, ?options:flight.BitmapGlowOptions):Void {
  flight._cpp._attempt.Attempt_Bitmap_glowBitmap.glowBitmap(out, scratch, source, options);
}

extern inline function gradientBevelBitmap(out:flight._internal._UInt8ClampedArray, scratch:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, ramp:flight._internal._UInt8ClampedArray, ?options:flight.BitmapGradientBevelOptions):Void {
  flight._cpp._attempt.Attempt_Bitmap_gradientBevelBitmap.gradientBevelBitmap(out, scratch, source, ramp, options);
}

extern inline function gradientGlowBitmap(out:flight._internal._UInt8ClampedArray, scratch:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, ramp:flight._internal._UInt8ClampedArray, ?options:flight.BitmapGradientGlowOptions):Void {
  flight._cpp._attempt.Attempt_Bitmap_gradientGlowBitmap.gradientGlowBitmap(out, scratch, source, ramp, options);
}

extern inline function initializeBitmap(out:flight.EntityConstruction<flight.Bitmap>, alphaType:flight.AlphaType, data:flight._internal._UInt8ClampedArray<flight._internal._ArrayBuffer>, format:flight.PixelFormat, gamut:Dynamic, height:Float, width:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_initializeBitmap.initializeBitmap(out, alphaType, data, format, gamut, height, width);
}

extern inline function initializeBitmapFingerprint(out:flight.EntityConstruction<flight.BitmapFingerprint>, gridSize:Float, cells:flight._internal._UInt8Array):Void {
  flight._cpp._attempt.Attempt_Bitmap_initializeBitmapFingerprint.initializeBitmapFingerprint(out, gridSize, cells);
}

extern inline function innerGlowBitmap(out:flight._internal._UInt8ClampedArray, scratch:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, ?options:flight.BitmapInnerGlowOptions):Void {
  flight._cpp._attempt.Attempt_Bitmap_innerGlowBitmap.innerGlowBitmap(out, scratch, source, options);
}

extern inline function innerShadowBitmap(out:flight._internal._UInt8ClampedArray, scratch:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, ?options:flight.BitmapInnerShadowOptions):Void {
  flight._cpp._attempt.Attempt_Bitmap_innerShadowBitmap.innerShadowBitmap(out, scratch, source, options);
}

extern inline function invalidateBitmap(bitmap:flight.Bitmap):Void {
  flight._cpp._attempt.Attempt_Bitmap_invalidateBitmap.invalidateBitmap(bitmap);
}

extern inline function medianBitmap(out:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, radius:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_medianBitmap.medianBitmap(out, source, radius);
}

extern inline function mergeBitmap(dest:flight.BitmapRegion, source:flight.BitmapRegion, redScale:Float, greenScale:Float, blueScale:Float, alphaScale:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_mergeBitmap.mergeBitmap(dest, source, redScale, greenScale, blueScale, alphaScale);
}

extern inline function mergeBitmapChannels(out:flight.BitmapRegion, r:flight.BitmapRegion, g:flight.BitmapRegion, b:flight.BitmapRegion, a:flight.BitmapRegion):Void {
  flight._cpp._attempt.Attempt_Bitmap_mergeBitmapChannels.mergeBitmapChannels(out, r, g, b, a);
}

extern inline function multiplyBitmapAlpha(out:flight.BitmapRegion, factor:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_multiplyBitmapAlpha.multiplyBitmapAlpha(out, factor);
}

extern inline function parseBitmapFingerprint(text:String):Null<flight.BitmapFingerprint> {
  return flight._cpp._attempt.Attempt_Bitmap_parseBitmapFingerprint.parseBitmapFingerprint(text);
}

extern inline function pixelateBitmap(out:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, blockSize:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_pixelateBitmap.pixelateBitmap(out, source, blockSize);
}

extern inline function premultiplyBitmapPixels(out:flight._internal._UInt8ClampedArray, source:flight._internal._UInt8ClampedArray, length:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_premultiplyBitmapPixels.premultiplyBitmapPixels(out, source, length);
}

extern inline function resizeBitmap(dest:flight.BitmapRegion, source:flight.BitmapRegion, ?options:Dynamic):Void {
  flight._cpp._attempt.Attempt_Bitmap_resizeBitmap.resizeBitmap(dest, source, options);
}

extern inline function resolveBitmapReadback(hostBitmapReadback:flight.HostBitmapReadbackCapability, source:flight.HostImageSource, width:Float, height:Float, mode:flight.BitmapReadbackMode):{ bitmap:Null<flight.Bitmap>, reason:flight.BitmapReadbackBlockReason } {
  return flight._cpp._attempt.Attempt_Bitmap_resolveBitmapReadback.resolveBitmapReadback(hostBitmapReadback, source, width, height, mode);
}

extern inline function rotateBitmap(dest:flight.BitmapRegion, source:flight.BitmapRegion, angle:Float, ?pivotX:Float, ?pivotY:Float, ?edgeMode:flight.BitmapEdgeMode, ?sampleMode:flight.BitmapResizeMode):Void {
  flight._cpp._attempt.Attempt_Bitmap_rotateBitmap.rotateBitmap(dest, source, angle, pivotX, pivotY, edgeMode, sampleMode);
}

extern inline function rotateBitmap180(dest:flight.BitmapRegion, source:flight.BitmapRegion):Void {
  flight._cpp._attempt.Attempt_Bitmap_rotateBitmap180.rotateBitmap180(dest, source);
}

extern inline function rotateBitmapClockwise(dest:flight.BitmapRegion, source:flight.BitmapRegion):Void {
  flight._cpp._attempt.Attempt_Bitmap_rotateBitmapClockwise.rotateBitmapClockwise(dest, source);
}

extern inline function rotateBitmapCounterClockwise(dest:flight.BitmapRegion, source:flight.BitmapRegion):Void {
  flight._cpp._attempt.Attempt_Bitmap_rotateBitmapCounterClockwise.rotateBitmapCounterClockwise(dest, source);
}

extern inline function scrollBitmap(out:flight.Bitmap, dx:Float, dy:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_scrollBitmap.scrollBitmap(out, dx, dy);
}

extern inline function setBitmapAlpha(out:flight.BitmapRegion, alpha:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_setBitmapAlpha.setBitmapAlpha(out, alpha);
}

extern inline function setBitmapColorMatrixIdentity(out:Array<Float>):Void {
  flight._cpp._attempt.Attempt_Bitmap_setBitmapColorMatrixIdentity.setBitmapColorMatrixIdentity(out);
}

extern inline function setBitmapPixel(out:flight.Bitmap, x:Float, y:Float, color:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_setBitmapPixel.setBitmapPixel(out, x, y, color);
}

extern inline function setBitmapPixelRgb(out:flight.Bitmap, x:Float, y:Float, color:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_setBitmapPixelRgb.setBitmapPixelRgb(out, x, y, color);
}

extern inline function setBitmapRegion(out:flight.BitmapRegion, bitmap:flight.Bitmap, ?x:Float, ?y:Float, ?width:Float, ?height:Float):flight.BitmapRegion {
  return flight._cpp._attempt.Attempt_Bitmap_setBitmapRegion.setBitmapRegion(out, bitmap, x, y, width, height);
}

extern inline function sharpenBitmap(out:flight._internal._UInt8ClampedArray, scratch:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, ?options:flight.BitmapSharpenOptions):Void {
  flight._cpp._attempt.Attempt_Bitmap_sharpenBitmap.sharpenBitmap(out, scratch, source, options);
}

extern inline function splitBitmapChannels(source:flight.Bitmap):Array<flight.Bitmap> {
  return flight._cpp._attempt.Attempt_Bitmap_splitBitmapChannels.splitBitmapChannels(source);
}

extern inline function transformBitmap(dest:flight.BitmapRegion, source:flight.BitmapRegion, matrix:Array<Float>, ?edgeMode:flight.BitmapEdgeMode, ?sampleMode:flight.BitmapResizeMode):Void {
  flight._cpp._attempt.Attempt_Bitmap_transformBitmap.transformBitmap(dest, source, matrix, edgeMode, sampleMode);
}

extern inline function trimBitmap(source:flight.Bitmap):flight.Bitmap {
  return flight._cpp._attempt.Attempt_Bitmap_trimBitmap.trimBitmap(source);
}

extern inline function unpremultiplyBitmapPixels(out:flight._internal._UInt8ClampedArray, source:flight._internal._UInt8ClampedArray, length:Float):Void {
  flight._cpp._attempt.Attempt_Bitmap_unpremultiplyBitmapPixels.unpremultiplyBitmapPixels(out, source, length);
}

extern inline function warpBitmap(dest:flight.BitmapRegion, source:flight.BitmapRegion, matrix:Array<Float>, ?edgeMode:flight.BitmapEdgeMode, ?sampleMode:flight.BitmapResizeMode):Void {
  flight._cpp._attempt.Attempt_Bitmap_warpBitmap.warpBitmap(dest, source, matrix, edgeMode, sampleMode);
}

extern inline function warpBitmapQuad(dest:flight.BitmapRegion, source:flight.BitmapRegion, dstQuad:Array<Float>, ?edgeMode:flight.BitmapEdgeMode, ?sampleMode:flight.BitmapResizeMode):Void {
  flight._cpp._attempt.Attempt_Bitmap_warpBitmapQuad.warpBitmapQuad(dest, source, dstQuad, edgeMode, sampleMode);
}

extern inline function writeBitmapPixels(dest:flight.BitmapRegion, pixels:flight._internal._UInt8ClampedArray):Void {
  flight._cpp._attempt.Attempt_Bitmap_writeBitmapPixels.writeBitmapPixels(dest, pixels);
}

extern inline function writeBitmapPixels32(dest:flight.BitmapRegion, pixels:flight._internal._UInt32Array):Void {
  flight._cpp._attempt.Attempt_Bitmap_writeBitmapPixels32.writeBitmapPixels32(dest, pixels);
}
