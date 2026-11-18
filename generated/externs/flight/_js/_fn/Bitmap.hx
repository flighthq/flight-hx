package flight._js._fn;

@:jsRequire("@flighthq/bitmap")
extern class Bitmap {
	@:native("createBitmap")
	public static function createBitmap(width:Int, height:Int, color:Null<Int>):flight._js.Bitmap;
	@:native("cloneBitmap")
	public static function cloneBitmap(source:flight._js.Bitmap):flight._js.Bitmap;
	@:native("convertBitmapAlphaType")
	public static function convertBitmapAlphaType(out:flight._js.Bitmap, target:Dynamic):Void;
	@:native("invalidateBitmap")
	public static function invalidateBitmap(bitmap:flight._js.Bitmap):Void;
	@:native("transformBitmap")
	public static function transformBitmap(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, matrix:Dynamic, edgeMode:Dynamic, sampleMode:Dynamic):Void;
	@:native("copyBitmapAlpha")
	public static function copyBitmapAlpha(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion):Void;
	@:native("multiplyBitmapAlpha")
	public static function multiplyBitmapAlpha(out:flight._js.BitmapRegion, factor:Float):Void;
	@:native("setBitmapAlpha")
	public static function setBitmapAlpha(out:flight._js.BitmapRegion, alpha:Float):Void;
	@:native("bevelBitmap")
	public static function bevelBitmap(out:Dynamic, scratch:Dynamic, source:flight._js.BitmapRegion, options:flight._js.BitmapBevelOptions):Void;
	@:native("blurBitmapPixelsHorizontal")
	public static function blurBitmapPixelsHorizontal(out:Dynamic, source:Dynamic, width:Int, height:Int, radius:Int):Void;
	@:native("blurBitmapPixelsHorizontalWeighted")
	public static function blurBitmapPixelsHorizontalWeighted(out:Dynamic, source:Dynamic, width:Int, height:Int, kernel:Dynamic):Void;
	@:native("blurBitmapPixelsVertical")
	public static function blurBitmapPixelsVertical(out:Dynamic, source:Dynamic, width:Int, height:Int, radius:Int):Void;
	@:native("blurBitmapPixelsVerticalWeighted")
	public static function blurBitmapPixelsVerticalWeighted(out:Dynamic, source:Dynamic, width:Int, height:Int, kernel:Dynamic):Void;
	@:native("boxBlurBitmap")
	public static function boxBlurBitmap(out:Dynamic, scratch:Dynamic, source:flight._js.BitmapRegion, options:flight._js.BitmapBoxBlurOptions):Void;
	@:native("computeGaussianKernel")
	public static function computeGaussianKernel(out:Dynamic, radius:Int, sigma:Float):Void;
	@:native("gaussianBlurBitmap")
	public static function gaussianBlurBitmap(out:Dynamic, scratch:Dynamic, source:flight._js.BitmapRegion, sigmaX:Float, sigmaY:Float, passes:Int):Void;
	@:native("mergeBitmapChannels")
	public static function mergeBitmapChannels(out:flight._js.BitmapRegion, r:flight._js.BitmapRegion, g:flight._js.BitmapRegion, b:flight._js.BitmapRegion, a:flight._js.BitmapRegion):Void;
	@:native("buildBitmapBrightnessColorMatrix")
	public static function buildBitmapBrightnessColorMatrix(out:Dynamic, amount:Float):Void;
	@:native("buildBitmapContrastColorMatrix")
	public static function buildBitmapContrastColorMatrix(out:Dynamic, amount:Float):Void;
	@:native("buildBitmapGrayscaleColorMatrix")
	public static function buildBitmapGrayscaleColorMatrix(out:Dynamic):Void;
	@:native("buildBitmapHueRotationColorMatrix")
	public static function buildBitmapHueRotationColorMatrix(out:Dynamic, degrees:Float):Void;
	@:native("buildBitmapInvertColorMatrix")
	public static function buildBitmapInvertColorMatrix(out:Dynamic):Void;
	@:native("buildBitmapSaturationColorMatrix")
	public static function buildBitmapSaturationColorMatrix(out:Dynamic, amount:Float):Void;
	@:native("buildBitmapSepiaColorMatrix")
	public static function buildBitmapSepiaColorMatrix(out:Dynamic):Void;
	@:native("colorMatrixBitmap")
	public static function colorMatrixBitmap(out:Dynamic, source:flight._js.BitmapRegion, matrix:Dynamic):Void;
	@:native("concatBitmapColorMatrix")
	public static function concatBitmapColorMatrix(out:Dynamic, first:Dynamic, second:Dynamic):Void;
	@:native("setBitmapColorMatrixIdentity")
	public static function setBitmapColorMatrixIdentity(out:Dynamic):Void;
	@:native("compareBitmap")
	public static function compareBitmap(source:flight._js.Bitmap, other:flight._js.Bitmap):Null<flight._js.Bitmap>;
	@:native("getBitmapMismatch")
	public static function getBitmapMismatch(source:flight._js.Bitmap, other:flight._js.Bitmap, channelTolerance:Int):flight._js.BitmapMismatch;
	@:native("compositeBitmapPixels")
	public static function compositeBitmapPixels(dest:flight._js.BitmapRegion, pixels:Dynamic, mode:flight._js.BitmapCompositeMode):Void;
	@:native("compositeBitmapRegion")
	public static function compositeBitmapRegion(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, mode:flight._js.BitmapCompositeMode):Void;
	@:native("extractBitmapPixels")
	public static function extractBitmapPixels(out:Dynamic, source:flight._js.BitmapRegion):Void;
	@:native("extractBitmapPixels32")
	public static function extractBitmapPixels32(out:Dynamic, source:flight._js.BitmapRegion):Void;
	@:native("writeBitmapPixels")
	public static function writeBitmapPixels(dest:flight._js.BitmapRegion, pixels:Dynamic):Void;
	@:native("writeBitmapPixels32")
	public static function writeBitmapPixels32(dest:flight._js.BitmapRegion, pixels:Dynamic):Void;
	@:native("convolveBitmap")
	public static function convolveBitmap(out:Dynamic, source:flight._js.BitmapRegion, options:flight._js.BitmapConvolutionOptions):Void;
	@:native("copyBitmapChannel")
	public static function copyBitmapChannel(dest:flight._js.BitmapRegion, destChannel:flight._js.ImageChannel, source:flight._js.BitmapRegion, sourceChannel:flight._js.ImageChannel):Void;
	@:native("copyBitmapPixels")
	public static function copyBitmapPixels(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, composite:Bool):Void;
	@:native("getBitmapCoverage")
	public static function getBitmapCoverage(source:flight._js.Bitmap, backgroundColor:Int, channelTolerance:Int):Float;
	@:native("cropBitmap")
	public static function cropBitmap(source:flight._js.Bitmap, rect:flight._js.Rectangle):flight._js.Bitmap;
	@:native("extendBitmap")
	public static function extendBitmap(source:flight._js.Bitmap, left:Int, top:Int, right:Int, bottom:Int, edgeMode:Dynamic, fillColor:Int):flight._js.Bitmap;
	@:native("trimBitmap")
	public static function trimBitmap(source:flight._js.Bitmap):flight._js.Bitmap;
	@:native("displaceBitmap")
	public static function displaceBitmap(out:Dynamic, source:flight._js.BitmapRegion, options:flight._js.BitmapDisplacementMapOptions):Void;
	@:native("dissolveBitmapPixels")
	public static function dissolveBitmapPixels(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, seed:Int, pixelCount:Int, fillColor:Int):Int;
	@:native("encodeBitmap")
	public static function encodeBitmap(hostBitmapEncode:flight._js.HostBitmapEncodeCapability, source:flight._js.Bitmap, format:Null<Dynamic>, quality:Null<Float>):Null<Dynamic>;
	@:native("explainBitmapEncodeFailure")
	public static function explainBitmapEncodeFailure(hostBitmapEncode:flight._js.HostBitmapEncodeCapability, format:Dynamic):Null<flight._js.BitmapEncodeFailureExplanation>;
	@:native("fillBitmapRectangle")
	public static function fillBitmapRectangle(dest:flight._js.BitmapRegion, color:Int):Void;
	@:native("floodFillBitmap")
	public static function floodFillBitmap(out:flight._js.Bitmap, x:Int, y:Int, color:Int):Void;
	@:native("createBitmapFingerprint")
	public static function createBitmapFingerprint(source:flight._js.Bitmap, gridSize:Int):flight._js.BitmapFingerprint;
	@:native("compareBitmapFingerprints")
	public static function compareBitmapFingerprints(a:flight._js.BitmapFingerprint, b:flight._js.BitmapFingerprint):Float;
	@:native("formatBitmapFingerprint")
	public static function formatBitmapFingerprint(fingerprint:flight._js.BitmapFingerprint):String;
	@:native("parseBitmapFingerprint")
	public static function parseBitmapFingerprint(text:String):Null<flight._js.BitmapFingerprint>;
	@:native("flipBitmapHorizontal")
	public static function flipBitmapHorizontal(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion):Void;
	@:native("flipBitmapVertical")
	public static function flipBitmapVertical(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion):Void;
	@:native("convertBitmapPixelOrder")
	public static function convertBitmapPixelOrder(out:Dynamic, source:Dynamic, length:Int, from:Dynamic, to:Dynamic):Void;
	@:native("premultiplyBitmapPixels")
	public static function premultiplyBitmapPixels(out:Dynamic, source:Dynamic, length:Int):Void;
	@:native("unpremultiplyBitmapPixels")
	public static function unpremultiplyBitmapPixels(out:Dynamic, source:Dynamic, length:Int):Void;
	@:native("buildBitmapGradientRamp")
	public static function buildBitmapGradientRamp(out:Dynamic, colors:Dynamic, alphas:Dynamic, ratios:Dynamic):Void;
	@:native("gradientBevelBitmap")
	public static function gradientBevelBitmap(out:Dynamic, scratch:Dynamic, source:flight._js.BitmapRegion, ramp:Dynamic, options:flight._js.BitmapGradientBevelOptions):Void;
	@:native("gradientGlowBitmap")
	public static function gradientGlowBitmap(out:Dynamic, scratch:Dynamic, source:flight._js.BitmapRegion, ramp:Dynamic, options:flight._js.BitmapGradientGlowOptions):Void;
	@:native("fillBitmapLinearGradient")
	public static function fillBitmapLinearGradient(dest:flight._js.BitmapRegion, ramp:Dynamic, x0:Float, y0:Float, x1:Float, y1:Float, spread:Dynamic):Void;
	@:native("fillBitmapRadialGradient")
	public static function fillBitmapRadialGradient(dest:flight._js.BitmapRegion, ramp:Dynamic, cx:Float, cy:Float, radius:Float, focalX:Float, focalY:Float, spread:Dynamic):Void;
	@:native("equalizeBitmapHistogram")
	public static function equalizeBitmapHistogram(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion):Void;
	@:native("getBitmapHistogram")
	public static function getBitmapHistogram(source:flight._js.BitmapRegion):flight._js.BitmapHistogram;
	@:native("medianBitmap")
	public static function medianBitmap(out:Dynamic, source:flight._js.BitmapRegion, radius:Int):Void;
	@:native("dilateBitmap")
	public static function dilateBitmap(out:Dynamic, source:flight._js.BitmapRegion, radius:Int):Void;
	@:native("erodeBitmap")
	public static function erodeBitmap(out:Dynamic, source:flight._js.BitmapRegion, radius:Int):Void;
	@:native("fillBitmapNoise")
	public static function fillBitmapNoise(dest:flight._js.BitmapRegion, seed:Int, low:Int, high:Int, grayScale:Bool):Void;
	@:native("fillBitmapPerlinNoise")
	public static function fillBitmapPerlinNoise(dest:flight._js.BitmapRegion, baseX:Float, baseY:Float, octaves:Int, seed:Int, grayScale:Bool, stitch:Bool, channelOptions:Int):Void;
	@:native("fillBitmapTurbulence")
	public static function fillBitmapTurbulence(dest:flight._js.BitmapRegion, baseX:Float, baseY:Float, octaves:Int, seed:Int, grayScale:Bool, stitch:Bool, channelOptions:Int):Void;
	@:native("applyBitmapPaletteMap")
	public static function applyBitmapPaletteMap(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, redMap:Null<Dynamic>, greenMap:Null<Dynamic>, blueMap:Null<Dynamic>, alphaMap:Null<Dynamic>):Void;
	@:native("getBitmapPixel")
	public static function getBitmapPixel(source:flight._js.Bitmap, x:Int, y:Int):Int;
	@:native("getBitmapPixelChannel")
	public static function getBitmapPixelChannel(source:flight._js.Bitmap, x:Int, y:Int, channel:flight._js.ImageChannel):Int;
	@:native("getBitmapPixelLuminance")
	public static function getBitmapPixelLuminance(source:flight._js.Bitmap, x:Int, y:Int):Int;
	@:native("getBitmapPixelRgb")
	public static function getBitmapPixelRgb(source:flight._js.Bitmap, x:Int, y:Int):Int;
	@:native("setBitmapPixel")
	public static function setBitmapPixel(out:flight._js.Bitmap, x:Int, y:Int, color:Int):Void;
	@:native("setBitmapPixelRgb")
	public static function setBitmapPixelRgb(out:flight._js.Bitmap, x:Int, y:Int, color:Int):Void;
	@:native("pixelateBitmap")
	public static function pixelateBitmap(out:Dynamic, source:flight._js.BitmapRegion, blockSize:Int):Void;
	@:native("getBitmapColorBoundsRectangle")
	public static function getBitmapColorBoundsRectangle(source:flight._js.BitmapRegion, mask:Int, color:Int, findColor:Bool):Null<flight._js.Rectangle>;
	@:native("createBitmapRegion")
	public static function createBitmapRegion(bitmap:flight._js.Bitmap, x:Int, y:Int, width:Int, height:Int):flight._js.BitmapRegion;
	@:native("setBitmapRegion")
	public static function setBitmapRegion(out:flight._js.BitmapRegion, bitmap:flight._js.Bitmap, x:Int, y:Int, width:Int, height:Int):Void;
	@:native("resizeBitmap")
	public static function resizeBitmap(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, mode:Dynamic, edgeMode:Dynamic, premultiplied:Bool):Void;
	@:native("rotateBitmap")
	public static function rotateBitmap(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, angle:Float, pivotX:Float, pivotY:Float, edgeMode:Dynamic, sampleMode:Dynamic):Void;
	@:native("rotateBitmap180")
	public static function rotateBitmap180(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion):Void;
	@:native("rotateBitmapClockwise")
	public static function rotateBitmapClockwise(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion):Void;
	@:native("rotateBitmapCounterClockwise")
	public static function rotateBitmapCounterClockwise(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion):Void;
	@:native("dropShadowBitmap")
	public static function dropShadowBitmap(out:Dynamic, scratch:Dynamic, source:flight._js.BitmapRegion, options:flight._js.BitmapDropShadowOptions):Void;
	@:native("glowBitmap")
	public static function glowBitmap(out:Dynamic, scratch:Dynamic, source:flight._js.BitmapRegion, options:flight._js.BitmapGlowOptions):Void;
	@:native("innerGlowBitmap")
	public static function innerGlowBitmap(out:Dynamic, scratch:Dynamic, source:flight._js.BitmapRegion, options:flight._js.BitmapInnerGlowOptions):Void;
	@:native("innerShadowBitmap")
	public static function innerShadowBitmap(out:Dynamic, scratch:Dynamic, source:flight._js.BitmapRegion, options:flight._js.BitmapInnerShadowOptions):Void;
	@:native("sharpenBitmap")
	public static function sharpenBitmap(out:Dynamic, scratch:Dynamic, source:flight._js.BitmapRegion, options:flight._js.BitmapSharpenOptions):Void;
	@:native("applyBitmapCurve")
	public static function applyBitmapCurve(out:flight._js.BitmapRegion, source:flight._js.BitmapRegion, redLut:Null<Dynamic>, greenLut:Null<Dynamic>, blueLut:Null<Dynamic>, alphaLut:Null<Dynamic>):Void;
	@:native("applyBitmapLevels")
	public static function applyBitmapLevels(out:flight._js.BitmapRegion, source:flight._js.BitmapRegion, blackPoint:Float, whitePoint:Float, gamma:Float):Void;
	@:native("applyBitmapColorScaleBias")
	public static function applyBitmapColorScaleBias(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, ct:flight._js.ColorScaleBias):Void;
	@:native("applyBitmapThreshold")
	public static function applyBitmapThreshold(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, operation:Dynamic, thresholdValue:Int, color:Int, mask:Int, copySource:Bool):Int;
	@:native("mergeBitmap")
	public static function mergeBitmap(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, redScale:Float, greenScale:Float, blueScale:Float, alphaScale:Float):Void;
	@:native("scrollBitmap")
	public static function scrollBitmap(out:flight._js.Bitmap, dx:Int, dy:Int):Void;
	@:native("warpBitmap")
	public static function warpBitmap(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, matrix:Dynamic, edgeMode:Dynamic, sampleMode:Dynamic):Void;
	@:native("warpBitmapQuad")
	public static function warpBitmapQuad(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, dstQuad:Dynamic, edgeMode:Dynamic, sampleMode:Dynamic):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeBitmap(ptr:flight._js.Bitmap):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeBitmapMismatch(ptr:flight._js.BitmapMismatch):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeBitmapEncodeFailureExplanation(ptr:flight._js.BitmapEncodeFailureExplanation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeBitmapFingerprint(ptr:flight._js.BitmapFingerprint):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeBitmapHistogram(ptr:flight._js.BitmapHistogram):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeRectangle(ptr:flight._js.Rectangle):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeBitmapRegion(ptr:flight._js.BitmapRegion):Void {}
}
