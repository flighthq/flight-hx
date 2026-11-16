package flight;

#if hl

typedef Bitmap = flight._hl.Bitmap;

#elseif cpp

typedef Bitmap = flight._cpp.Bitmap;

#elseif (js && flight_esm)

typedef Bitmap = flight._js.Bitmap;

#elseif js

#error "flight.Bitmap on js requires flight_esm."

#else

#error "flight.Bitmap: no backend for this target."

#end

#if (js && flight_esm)
extern inline function createBitmap(width:Int, height:Int, color:Null<Int>):Bitmap {
	return flight._js._fn.Bitmap.createBitmap(width, height, color);
}
#else
extern inline function createBitmap(width:Int, height:Int, color:haxe.Int64):Bitmap {
#if hl
	return flight._hl._fn.Bitmap.createBitmap(width, height, color);
#elseif cpp
	return flight._cpp._fn.Bitmap.createBitmap(width, height, color);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.createBitmap(width, height, color);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function cloneBitmap(source:Bitmap):Bitmap {
	return flight._js._fn.Bitmap.cloneBitmap(source);
}
#else
extern inline function cloneBitmap(source:Bitmap):Bitmap {
#if hl
	return flight._hl._fn.Bitmap.cloneBitmap(source);
#elseif cpp
	return flight._cpp._fn.Bitmap.cloneBitmap(source);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.cloneBitmap(source);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function convertBitmapAlphaType(out:Bitmap, target:Dynamic):Void {
	flight._js._fn.Bitmap.convertBitmapAlphaType(out, target);
}
#else
extern inline function convertBitmapAlphaType(out:Bitmap, target:flight.AlphaType):Void {
#if hl
	flight._hl._fn.Bitmap.convertBitmapAlphaType(out, target);
#elseif cpp
	flight._cpp._fn.Bitmap.convertBitmapAlphaType(out, target);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.convertBitmapAlphaType(out, target);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function invalidateBitmap(bitmap:Bitmap):Void {
	flight._js._fn.Bitmap.invalidateBitmap(bitmap);
}
#else
extern inline function invalidateBitmap(bitmap:Bitmap):Void {
#if hl
	flight._hl._fn.Bitmap.invalidateBitmap(bitmap);
#elseif cpp
	flight._cpp._fn.Bitmap.invalidateBitmap(bitmap);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.invalidateBitmap(bitmap);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function transformBitmap(dest:BitmapRegion, source:BitmapRegion, matrix:Dynamic, edgeMode:Dynamic, sampleMode:Dynamic):Void {
	flight._js._fn.Bitmap.transformBitmap(dest, source, matrix, edgeMode, sampleMode);
}
#else
extern inline function transformBitmap(dest:BitmapRegion, source:BitmapRegion, matrix:Dynamic, edgeMode:flight.BitmapEdgeMode, sampleMode:flight.BitmapResizeMode):Void {
#if hl
	flight._hl._fn.Bitmap.transformBitmap(dest, source, matrix, edgeMode, sampleMode);
#elseif cpp
	flight._cpp._fn.Bitmap.transformBitmap(dest, source, matrix, edgeMode, sampleMode);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.transformBitmap(dest, source, matrix, edgeMode, sampleMode);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function copyBitmapAlpha(dest:BitmapRegion, source:BitmapRegion):Void {
	flight._js._fn.Bitmap.copyBitmapAlpha(dest, source);
}
#else
extern inline function copyBitmapAlpha(dest:BitmapRegion, source:BitmapRegion):Void {
#if hl
	flight._hl._fn.Bitmap.copyBitmapAlpha(dest, source);
#elseif cpp
	flight._cpp._fn.Bitmap.copyBitmapAlpha(dest, source);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.copyBitmapAlpha(dest, source);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function multiplyBitmapAlpha(out:BitmapRegion, factor:Float):Void {
	flight._js._fn.Bitmap.multiplyBitmapAlpha(out, factor);
}
#else
extern inline function multiplyBitmapAlpha(out:BitmapRegion, factor:Float):Void {
#if hl
	flight._hl._fn.Bitmap.multiplyBitmapAlpha(out, factor);
#elseif cpp
	flight._cpp._fn.Bitmap.multiplyBitmapAlpha(out, factor);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.multiplyBitmapAlpha(out, factor);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setBitmapAlpha(out:BitmapRegion, alpha:Float):Void {
	flight._js._fn.Bitmap.setBitmapAlpha(out, alpha);
}
#else
extern inline function setBitmapAlpha(out:BitmapRegion, alpha:Float):Void {
#if hl
	flight._hl._fn.Bitmap.setBitmapAlpha(out, alpha);
#elseif cpp
	flight._cpp._fn.Bitmap.setBitmapAlpha(out, alpha);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.setBitmapAlpha(out, alpha);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function bevelBitmap(out:Dynamic, scratch:Dynamic, source:BitmapRegion, options:BitmapBevelOptions):Void {
	flight._js._fn.Bitmap.bevelBitmap(out, scratch, source, options);
}
#else
extern inline function bevelBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:BitmapRegion, options:BitmapBevelOptions):Void {
#if hl
	flight._hl._fn.Bitmap.bevelBitmap(out, outLen, scratch, scratchLen, source, options);
#elseif cpp
	flight._cpp._fn.Bitmap.bevelBitmap(out, outLen, scratch, scratchLen, source, options);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.bevelBitmap(out, outLen, scratch, scratchLen, source, options);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function blurBitmapPixelsHorizontal(out:Dynamic, source:Dynamic, width:Int, height:Int, radius:Int):Void {
	flight._js._fn.Bitmap.blurBitmapPixelsHorizontal(out, source, width, height, radius);
}
#else
extern inline function blurBitmapPixelsHorizontal(out:Dynamic, outLen:Int, source:Dynamic, sourceLen:Int, width:Int, height:Int, radius:Int):Void {
#if hl
	flight._hl._fn.Bitmap.blurBitmapPixelsHorizontal(out, outLen, source, sourceLen, width, height, radius);
#elseif cpp
	flight._cpp._fn.Bitmap.blurBitmapPixelsHorizontal(out, outLen, source, sourceLen, width, height, radius);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.blurBitmapPixelsHorizontal(out, outLen, source, sourceLen, width, height, radius);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function blurBitmapPixelsHorizontalWeighted(out:Dynamic, source:Dynamic, width:Int, height:Int, kernel:Dynamic):Void {
	flight._js._fn.Bitmap.blurBitmapPixelsHorizontalWeighted(out, source, width, height, kernel);
}
#else
extern inline function blurBitmapPixelsHorizontalWeighted(out:Dynamic, outLen:Int, source:Dynamic, sourceLen:Int, width:Int, height:Int, kernel:Dynamic, kernelLen:Int):Void {
#if hl
	flight._hl._fn.Bitmap.blurBitmapPixelsHorizontalWeighted(out, outLen, source, sourceLen, width, height, kernel, kernelLen);
#elseif cpp
	flight._cpp._fn.Bitmap.blurBitmapPixelsHorizontalWeighted(out, outLen, source, sourceLen, width, height, kernel, kernelLen);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.blurBitmapPixelsHorizontalWeighted(out, outLen, source, sourceLen, width, height, kernel, kernelLen);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function blurBitmapPixelsVertical(out:Dynamic, source:Dynamic, width:Int, height:Int, radius:Int):Void {
	flight._js._fn.Bitmap.blurBitmapPixelsVertical(out, source, width, height, radius);
}
#else
extern inline function blurBitmapPixelsVertical(out:Dynamic, outLen:Int, source:Dynamic, sourceLen:Int, width:Int, height:Int, radius:Int):Void {
#if hl
	flight._hl._fn.Bitmap.blurBitmapPixelsVertical(out, outLen, source, sourceLen, width, height, radius);
#elseif cpp
	flight._cpp._fn.Bitmap.blurBitmapPixelsVertical(out, outLen, source, sourceLen, width, height, radius);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.blurBitmapPixelsVertical(out, outLen, source, sourceLen, width, height, radius);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function blurBitmapPixelsVerticalWeighted(out:Dynamic, source:Dynamic, width:Int, height:Int, kernel:Dynamic):Void {
	flight._js._fn.Bitmap.blurBitmapPixelsVerticalWeighted(out, source, width, height, kernel);
}
#else
extern inline function blurBitmapPixelsVerticalWeighted(out:Dynamic, outLen:Int, source:Dynamic, sourceLen:Int, width:Int, height:Int, kernel:Dynamic, kernelLen:Int):Void {
#if hl
	flight._hl._fn.Bitmap.blurBitmapPixelsVerticalWeighted(out, outLen, source, sourceLen, width, height, kernel, kernelLen);
#elseif cpp
	flight._cpp._fn.Bitmap.blurBitmapPixelsVerticalWeighted(out, outLen, source, sourceLen, width, height, kernel, kernelLen);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.blurBitmapPixelsVerticalWeighted(out, outLen, source, sourceLen, width, height, kernel, kernelLen);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function boxBlurBitmap(out:Dynamic, scratch:Dynamic, source:BitmapRegion, options:BitmapBoxBlurOptions):Void {
	flight._js._fn.Bitmap.boxBlurBitmap(out, scratch, source, options);
}
#else
extern inline function boxBlurBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:BitmapRegion, options:BitmapBoxBlurOptions):Void {
#if hl
	flight._hl._fn.Bitmap.boxBlurBitmap(out, outLen, scratch, scratchLen, source, options);
#elseif cpp
	flight._cpp._fn.Bitmap.boxBlurBitmap(out, outLen, scratch, scratchLen, source, options);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.boxBlurBitmap(out, outLen, scratch, scratchLen, source, options);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeGaussianKernel(out:Dynamic, radius:Int, sigma:Float):Void {
	flight._js._fn.Bitmap.computeGaussianKernel(out, radius, sigma);
}
#else
extern inline function computeGaussianKernel(out:Dynamic, outLen:Int, radius:Int, sigma:Float):Void {
#if hl
	flight._hl._fn.Bitmap.computeGaussianKernel(out, outLen, radius, sigma);
#elseif cpp
	flight._cpp._fn.Bitmap.computeGaussianKernel(out, outLen, radius, sigma);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.computeGaussianKernel(out, outLen, radius, sigma);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function gaussianBlurBitmap(out:Dynamic, scratch:Dynamic, source:BitmapRegion, sigmaX:Float, sigmaY:Float, passes:Int):Void {
	flight._js._fn.Bitmap.gaussianBlurBitmap(out, scratch, source, sigmaX, sigmaY, passes);
}
#else
extern inline function gaussianBlurBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:BitmapRegion, sigmaX:Float, sigmaY:Float, passes:Int):Void {
#if hl
	flight._hl._fn.Bitmap.gaussianBlurBitmap(out, outLen, scratch, scratchLen, source, sigmaX, sigmaY, passes);
#elseif cpp
	flight._cpp._fn.Bitmap.gaussianBlurBitmap(out, outLen, scratch, scratchLen, source, sigmaX, sigmaY, passes);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.gaussianBlurBitmap(out, outLen, scratch, scratchLen, source, sigmaX, sigmaY, passes);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function mergeBitmapChannels(out:BitmapRegion, r:BitmapRegion, g:BitmapRegion, b:BitmapRegion, a:BitmapRegion):Void {
	flight._js._fn.Bitmap.mergeBitmapChannels(out, r, g, b, a);
}
#else
extern inline function mergeBitmapChannels(out:BitmapRegion, r:BitmapRegion, g:BitmapRegion, b:BitmapRegion, a:BitmapRegion):Void {
#if hl
	flight._hl._fn.Bitmap.mergeBitmapChannels(out, r, g, b, a);
#elseif cpp
	flight._cpp._fn.Bitmap.mergeBitmapChannels(out, r, g, b, a);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.mergeBitmapChannels(out, r, g, b, a);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function buildBitmapBrightnessColorMatrix(out:Dynamic, amount:Float):Void {
	flight._js._fn.Bitmap.buildBitmapBrightnessColorMatrix(out, amount);
}
#else
extern inline function buildBitmapBrightnessColorMatrix(out:Dynamic, amount:Float):Void {
#if hl
	flight._hl._fn.Bitmap.buildBitmapBrightnessColorMatrix(out, amount);
#elseif cpp
	flight._cpp._fn.Bitmap.buildBitmapBrightnessColorMatrix(out, amount);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.buildBitmapBrightnessColorMatrix(out, amount);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function buildBitmapContrastColorMatrix(out:Dynamic, amount:Float):Void {
	flight._js._fn.Bitmap.buildBitmapContrastColorMatrix(out, amount);
}
#else
extern inline function buildBitmapContrastColorMatrix(out:Dynamic, amount:Float):Void {
#if hl
	flight._hl._fn.Bitmap.buildBitmapContrastColorMatrix(out, amount);
#elseif cpp
	flight._cpp._fn.Bitmap.buildBitmapContrastColorMatrix(out, amount);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.buildBitmapContrastColorMatrix(out, amount);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function buildBitmapGrayscaleColorMatrix(out:Dynamic):Void {
	flight._js._fn.Bitmap.buildBitmapGrayscaleColorMatrix(out);
}
#else
extern inline function buildBitmapGrayscaleColorMatrix(out:Dynamic):Void {
#if hl
	flight._hl._fn.Bitmap.buildBitmapGrayscaleColorMatrix(out);
#elseif cpp
	flight._cpp._fn.Bitmap.buildBitmapGrayscaleColorMatrix(out);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.buildBitmapGrayscaleColorMatrix(out);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function buildBitmapHueRotationColorMatrix(out:Dynamic, degrees:Float):Void {
	flight._js._fn.Bitmap.buildBitmapHueRotationColorMatrix(out, degrees);
}
#else
extern inline function buildBitmapHueRotationColorMatrix(out:Dynamic, degrees:Float):Void {
#if hl
	flight._hl._fn.Bitmap.buildBitmapHueRotationColorMatrix(out, degrees);
#elseif cpp
	flight._cpp._fn.Bitmap.buildBitmapHueRotationColorMatrix(out, degrees);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.buildBitmapHueRotationColorMatrix(out, degrees);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function buildBitmapInvertColorMatrix(out:Dynamic):Void {
	flight._js._fn.Bitmap.buildBitmapInvertColorMatrix(out);
}
#else
extern inline function buildBitmapInvertColorMatrix(out:Dynamic):Void {
#if hl
	flight._hl._fn.Bitmap.buildBitmapInvertColorMatrix(out);
#elseif cpp
	flight._cpp._fn.Bitmap.buildBitmapInvertColorMatrix(out);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.buildBitmapInvertColorMatrix(out);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function buildBitmapSaturationColorMatrix(out:Dynamic, amount:Float):Void {
	flight._js._fn.Bitmap.buildBitmapSaturationColorMatrix(out, amount);
}
#else
extern inline function buildBitmapSaturationColorMatrix(out:Dynamic, amount:Float):Void {
#if hl
	flight._hl._fn.Bitmap.buildBitmapSaturationColorMatrix(out, amount);
#elseif cpp
	flight._cpp._fn.Bitmap.buildBitmapSaturationColorMatrix(out, amount);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.buildBitmapSaturationColorMatrix(out, amount);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function buildBitmapSepiaColorMatrix(out:Dynamic):Void {
	flight._js._fn.Bitmap.buildBitmapSepiaColorMatrix(out);
}
#else
extern inline function buildBitmapSepiaColorMatrix(out:Dynamic):Void {
#if hl
	flight._hl._fn.Bitmap.buildBitmapSepiaColorMatrix(out);
#elseif cpp
	flight._cpp._fn.Bitmap.buildBitmapSepiaColorMatrix(out);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.buildBitmapSepiaColorMatrix(out);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function colorMatrixBitmap(out:Dynamic, source:BitmapRegion, matrix:Dynamic):Void {
	flight._js._fn.Bitmap.colorMatrixBitmap(out, source, matrix);
}
#else
extern inline function colorMatrixBitmap(out:Dynamic, outLen:Int, source:BitmapRegion, matrix:Dynamic, matrixLen:Int):Void {
#if hl
	flight._hl._fn.Bitmap.colorMatrixBitmap(out, outLen, source, matrix, matrixLen);
#elseif cpp
	flight._cpp._fn.Bitmap.colorMatrixBitmap(out, outLen, source, matrix, matrixLen);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.colorMatrixBitmap(out, outLen, source, matrix, matrixLen);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function concatBitmapColorMatrix(out:Dynamic, first:Dynamic, second:Dynamic):Void {
	flight._js._fn.Bitmap.concatBitmapColorMatrix(out, first, second);
}
#else
extern inline function concatBitmapColorMatrix(out:Dynamic, first:Dynamic, second:Dynamic):Void {
#if hl
	flight._hl._fn.Bitmap.concatBitmapColorMatrix(out, first, second);
#elseif cpp
	flight._cpp._fn.Bitmap.concatBitmapColorMatrix(out, first, second);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.concatBitmapColorMatrix(out, first, second);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setBitmapColorMatrixIdentity(out:Dynamic):Void {
	flight._js._fn.Bitmap.setBitmapColorMatrixIdentity(out);
}
#else
extern inline function setBitmapColorMatrixIdentity(out:Dynamic):Void {
#if hl
	flight._hl._fn.Bitmap.setBitmapColorMatrixIdentity(out);
#elseif cpp
	flight._cpp._fn.Bitmap.setBitmapColorMatrixIdentity(out);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.setBitmapColorMatrixIdentity(out);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function compareBitmap(source:Bitmap, other:Bitmap):Null<Bitmap> {
	return flight._js._fn.Bitmap.compareBitmap(source, other);
}
#else
extern inline function compareBitmap(source:Bitmap, other:Bitmap):Bitmap {
#if hl
	return flight._hl._fn.Bitmap.compareBitmap(source, other);
#elseif cpp
	return flight._cpp._fn.Bitmap.compareBitmap(source, other);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.compareBitmap(source, other);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapMismatch(source:Bitmap, other:Bitmap, channelTolerance:Int):BitmapMismatch {
	return flight._js._fn.Bitmap.getBitmapMismatch(source, other, channelTolerance);
}
#else
extern inline function getBitmapMismatch(source:Bitmap, other:Bitmap, channelTolerance:Int):BitmapMismatch {
#if hl
	return flight._hl._fn.Bitmap.getBitmapMismatch(source, other, channelTolerance);
#elseif cpp
	return flight._cpp._fn.Bitmap.getBitmapMismatch(source, other, channelTolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.getBitmapMismatch(source, other, channelTolerance);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function compositeBitmapPixels(dest:BitmapRegion, pixels:Dynamic, mode:BitmapCompositeMode):Void {
	flight._js._fn.Bitmap.compositeBitmapPixels(dest, pixels, mode);
}
#else
extern inline function compositeBitmapPixels(dest:BitmapRegion, pixels:Dynamic, pixelsLen:Int, mode:BitmapCompositeMode):Void {
#if hl
	flight._hl._fn.Bitmap.compositeBitmapPixels(dest, pixels, pixelsLen, mode);
#elseif cpp
	flight._cpp._fn.Bitmap.compositeBitmapPixels(dest, pixels, pixelsLen, mode);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.compositeBitmapPixels(dest, pixels, pixelsLen, mode);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function compositeBitmapRegion(dest:BitmapRegion, source:BitmapRegion, mode:BitmapCompositeMode):Void {
	flight._js._fn.Bitmap.compositeBitmapRegion(dest, source, mode);
}
#else
extern inline function compositeBitmapRegion(dest:BitmapRegion, source:BitmapRegion, mode:BitmapCompositeMode):Void {
#if hl
	flight._hl._fn.Bitmap.compositeBitmapRegion(dest, source, mode);
#elseif cpp
	flight._cpp._fn.Bitmap.compositeBitmapRegion(dest, source, mode);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.compositeBitmapRegion(dest, source, mode);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function extractBitmapPixels(out:Dynamic, source:BitmapRegion):Void {
	flight._js._fn.Bitmap.extractBitmapPixels(out, source);
}
#else
extern inline function extractBitmapPixels(out:Dynamic, outLen:Int, source:BitmapRegion):Void {
#if hl
	flight._hl._fn.Bitmap.extractBitmapPixels(out, outLen, source);
#elseif cpp
	flight._cpp._fn.Bitmap.extractBitmapPixels(out, outLen, source);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.extractBitmapPixels(out, outLen, source);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function extractBitmapPixels32(out:Dynamic, source:BitmapRegion):Void {
	flight._js._fn.Bitmap.extractBitmapPixels32(out, source);
}
#else
extern inline function extractBitmapPixels32(out:Dynamic, outLen:Int, source:BitmapRegion):Void {
#if hl
	flight._hl._fn.Bitmap.extractBitmapPixels32(out, outLen, source);
#elseif cpp
	flight._cpp._fn.Bitmap.extractBitmapPixels32(out, outLen, source);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.extractBitmapPixels32(out, outLen, source);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writeBitmapPixels(dest:BitmapRegion, pixels:Dynamic):Void {
	flight._js._fn.Bitmap.writeBitmapPixels(dest, pixels);
}
#else
extern inline function writeBitmapPixels(dest:BitmapRegion, pixels:Dynamic, pixelsLen:Int):Void {
#if hl
	flight._hl._fn.Bitmap.writeBitmapPixels(dest, pixels, pixelsLen);
#elseif cpp
	flight._cpp._fn.Bitmap.writeBitmapPixels(dest, pixels, pixelsLen);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.writeBitmapPixels(dest, pixels, pixelsLen);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writeBitmapPixels32(dest:BitmapRegion, pixels:Dynamic):Void {
	flight._js._fn.Bitmap.writeBitmapPixels32(dest, pixels);
}
#else
extern inline function writeBitmapPixels32(dest:BitmapRegion, pixels:Dynamic, pixelsLen:Int):Void {
#if hl
	flight._hl._fn.Bitmap.writeBitmapPixels32(dest, pixels, pixelsLen);
#elseif cpp
	flight._cpp._fn.Bitmap.writeBitmapPixels32(dest, pixels, pixelsLen);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.writeBitmapPixels32(dest, pixels, pixelsLen);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function convolveBitmap(out:Dynamic, source:BitmapRegion, options:BitmapConvolutionOptions):Void {
	flight._js._fn.Bitmap.convolveBitmap(out, source, options);
}
#else
extern inline function convolveBitmap(out:Dynamic, outLen:Int, source:BitmapRegion, options:BitmapConvolutionOptions):Void {
#if hl
	flight._hl._fn.Bitmap.convolveBitmap(out, outLen, source, options);
#elseif cpp
	flight._cpp._fn.Bitmap.convolveBitmap(out, outLen, source, options);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.convolveBitmap(out, outLen, source, options);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function copyBitmapChannel(dest:BitmapRegion, destChannel:ImageChannel, source:BitmapRegion, sourceChannel:ImageChannel):Void {
	flight._js._fn.Bitmap.copyBitmapChannel(dest, destChannel, source, sourceChannel);
}
#else
extern inline function copyBitmapChannel(dest:BitmapRegion, destChannel:ImageChannel, source:BitmapRegion, sourceChannel:ImageChannel):Void {
#if hl
	flight._hl._fn.Bitmap.copyBitmapChannel(dest, destChannel, source, sourceChannel);
#elseif cpp
	flight._cpp._fn.Bitmap.copyBitmapChannel(dest, destChannel, source, sourceChannel);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.copyBitmapChannel(dest, destChannel, source, sourceChannel);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function copyBitmapPixels(dest:BitmapRegion, source:BitmapRegion, composite:Bool):Void {
	flight._js._fn.Bitmap.copyBitmapPixels(dest, source, composite);
}
#else
extern inline function copyBitmapPixels(dest:BitmapRegion, source:BitmapRegion, composite:Bool):Void {
#if hl
	flight._hl._fn.Bitmap.copyBitmapPixels(dest, source, composite);
#elseif cpp
	flight._cpp._fn.Bitmap.copyBitmapPixels(dest, source, composite);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.copyBitmapPixels(dest, source, composite);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapCoverage(source:Bitmap, backgroundColor:Int, channelTolerance:Int):Float {
	return flight._js._fn.Bitmap.getBitmapCoverage(source, backgroundColor, channelTolerance);
}
#else
extern inline function getBitmapCoverage(source:Bitmap, backgroundColor:Int, channelTolerance:Int):Float {
#if hl
	return flight._hl._fn.Bitmap.getBitmapCoverage(source, backgroundColor, channelTolerance);
#elseif cpp
	return flight._cpp._fn.Bitmap.getBitmapCoverage(source, backgroundColor, channelTolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.getBitmapCoverage(source, backgroundColor, channelTolerance);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function extendBitmap(source:Bitmap, left:Int, top:Int, right:Int, bottom:Int, edgeMode:Dynamic, fillColor:Int):Bitmap {
	return flight._js._fn.Bitmap.extendBitmap(source, left, top, right, bottom, edgeMode, fillColor);
}
#else
extern inline function extendBitmap(source:Bitmap, left:Int, top:Int, right:Int, bottom:Int, edgeMode:flight.BitmapEdgeMode, fillColor:Int):Bitmap {
#if hl
	return flight._hl._fn.Bitmap.extendBitmap(source, left, top, right, bottom, edgeMode, fillColor);
#elseif cpp
	return flight._cpp._fn.Bitmap.extendBitmap(source, left, top, right, bottom, edgeMode, fillColor);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.extendBitmap(source, left, top, right, bottom, edgeMode, fillColor);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function trimBitmap(source:Bitmap):Bitmap {
	return flight._js._fn.Bitmap.trimBitmap(source);
}
#else
extern inline function trimBitmap(source:Bitmap):Bitmap {
#if hl
	return flight._hl._fn.Bitmap.trimBitmap(source);
#elseif cpp
	return flight._cpp._fn.Bitmap.trimBitmap(source);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.trimBitmap(source);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function displaceBitmap(out:Dynamic, source:BitmapRegion, options:BitmapDisplacementMapOptions):Void {
	flight._js._fn.Bitmap.displaceBitmap(out, source, options);
}
#else
extern inline function displaceBitmap(out:Dynamic, outLen:Int, source:BitmapRegion, options:BitmapDisplacementMapOptions):Void {
#if hl
	flight._hl._fn.Bitmap.displaceBitmap(out, outLen, source, options);
#elseif cpp
	flight._cpp._fn.Bitmap.displaceBitmap(out, outLen, source, options);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.displaceBitmap(out, outLen, source, options);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dissolveBitmapPixels(dest:BitmapRegion, source:BitmapRegion, seed:Int, pixelCount:Int, fillColor:Int):Int {
	return flight._js._fn.Bitmap.dissolveBitmapPixels(dest, source, seed, pixelCount, fillColor);
}
#else
extern inline function dissolveBitmapPixels(dest:BitmapRegion, source:BitmapRegion, seed:Int, pixelCount:Int, fillColor:Int):Int {
#if hl
	return flight._hl._fn.Bitmap.dissolveBitmapPixels(dest, source, seed, pixelCount, fillColor);
#elseif cpp
	return flight._cpp._fn.Bitmap.dissolveBitmapPixels(dest, source, seed, pixelCount, fillColor);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.dissolveBitmapPixels(dest, source, seed, pixelCount, fillColor);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function encodeBitmap(hostBitmapEncode:HostBitmapEncodeCapability, source:Bitmap, format:Null<Dynamic>, quality:Null<Float>):Null<Dynamic> {
	return flight._js._fn.Bitmap.encodeBitmap(hostBitmapEncode, source, format, quality);
}
#else
extern inline function encodeBitmap(hostBitmapEncode:HostBitmapEncodeCapability, source:Bitmap, format:Int, quality:Float):Null<flight.NativeByteBuffer> {
#if hl
	return flight._hl._fn.Bitmap.encodeBitmap(hostBitmapEncode, source, format, quality);
#elseif cpp
	return flight._cpp._fn.Bitmap.encodeBitmap(hostBitmapEncode, source, format, quality);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.encodeBitmap(hostBitmapEncode, source, format, quality);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainBitmapEncodeFailure(hostBitmapEncode:HostBitmapEncodeCapability, format:Dynamic):Null<BitmapEncodeFailureExplanation> {
	return flight._js._fn.Bitmap.explainBitmapEncodeFailure(hostBitmapEncode, format);
}
#else
extern inline function explainBitmapEncodeFailure(hostBitmapEncode:HostBitmapEncodeCapability, format:flight.ImageFormat):BitmapEncodeFailureExplanation {
#if hl
	return flight._hl._fn.Bitmap.explainBitmapEncodeFailure(hostBitmapEncode, format);
#elseif cpp
	return flight._cpp._fn.Bitmap.explainBitmapEncodeFailure(hostBitmapEncode, format);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.explainBitmapEncodeFailure(hostBitmapEncode, format);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function fillBitmapRectangle(dest:BitmapRegion, color:Int):Void {
	flight._js._fn.Bitmap.fillBitmapRectangle(dest, color);
}
#else
extern inline function fillBitmapRectangle(dest:BitmapRegion, color:Int):Void {
#if hl
	flight._hl._fn.Bitmap.fillBitmapRectangle(dest, color);
#elseif cpp
	flight._cpp._fn.Bitmap.fillBitmapRectangle(dest, color);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.fillBitmapRectangle(dest, color);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function floodFillBitmap(out:Bitmap, x:Int, y:Int, color:Int):Void {
	flight._js._fn.Bitmap.floodFillBitmap(out, x, y, color);
}
#else
extern inline function floodFillBitmap(out:Bitmap, x:Int, y:Int, color:Int):Void {
#if hl
	flight._hl._fn.Bitmap.floodFillBitmap(out, x, y, color);
#elseif cpp
	flight._cpp._fn.Bitmap.floodFillBitmap(out, x, y, color);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.floodFillBitmap(out, x, y, color);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createBitmapFingerprint(source:Bitmap, gridSize:Int):BitmapFingerprint {
	return flight._js._fn.Bitmap.createBitmapFingerprint(source, gridSize);
}
#else
extern inline function createBitmapFingerprint(source:Bitmap, gridSize:Int):BitmapFingerprint {
#if hl
	return flight._hl._fn.Bitmap.createBitmapFingerprint(source, gridSize);
#elseif cpp
	return flight._cpp._fn.Bitmap.createBitmapFingerprint(source, gridSize);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.createBitmapFingerprint(source, gridSize);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function compareBitmapFingerprints(a:BitmapFingerprint, b:BitmapFingerprint):Float {
	return flight._js._fn.Bitmap.compareBitmapFingerprints(a, b);
}
#else
extern inline function compareBitmapFingerprints(a:BitmapFingerprint, b:BitmapFingerprint):Float {
#if hl
	return flight._hl._fn.Bitmap.compareBitmapFingerprints(a, b);
#elseif cpp
	return flight._cpp._fn.Bitmap.compareBitmapFingerprints(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.compareBitmapFingerprints(a, b);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function formatBitmapFingerprint(fingerprint:BitmapFingerprint):String {
	return flight._js._fn.Bitmap.formatBitmapFingerprint(fingerprint);
}
#else
extern inline function formatBitmapFingerprint(fingerprint:BitmapFingerprint):String {
#if hl
	return cast flight._hl._fn.Bitmap.formatBitmapFingerprint(fingerprint);
#elseif cpp
	return cast flight._cpp._fn.Bitmap.formatBitmapFingerprint(fingerprint);
#elseif (js && flight_esm)
	return cast flight._js._fn.Bitmap.formatBitmapFingerprint(fingerprint);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseBitmapFingerprint(text:String):Null<BitmapFingerprint> {
	return flight._js._fn.Bitmap.parseBitmapFingerprint(text);
}
#else
extern inline function parseBitmapFingerprint(text:String):BitmapFingerprint {
#if hl
	return flight._hl._fn.Bitmap.parseBitmapFingerprint(cast text);
#elseif cpp
	return flight._cpp._fn.Bitmap.parseBitmapFingerprint(cast text);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.parseBitmapFingerprint(text);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function flipBitmapHorizontal(dest:BitmapRegion, source:BitmapRegion):Void {
	flight._js._fn.Bitmap.flipBitmapHorizontal(dest, source);
}
#else
extern inline function flipBitmapHorizontal(dest:BitmapRegion, source:BitmapRegion):Void {
#if hl
	flight._hl._fn.Bitmap.flipBitmapHorizontal(dest, source);
#elseif cpp
	flight._cpp._fn.Bitmap.flipBitmapHorizontal(dest, source);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.flipBitmapHorizontal(dest, source);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function flipBitmapVertical(dest:BitmapRegion, source:BitmapRegion):Void {
	flight._js._fn.Bitmap.flipBitmapVertical(dest, source);
}
#else
extern inline function flipBitmapVertical(dest:BitmapRegion, source:BitmapRegion):Void {
#if hl
	flight._hl._fn.Bitmap.flipBitmapVertical(dest, source);
#elseif cpp
	flight._cpp._fn.Bitmap.flipBitmapVertical(dest, source);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.flipBitmapVertical(dest, source);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function convertBitmapPixelOrder(out:Dynamic, source:Dynamic, length:Int, from:Dynamic, to:Dynamic):Void {
	flight._js._fn.Bitmap.convertBitmapPixelOrder(out, source, length, from, to);
}
#else
extern inline function convertBitmapPixelOrder(out:Dynamic, outLen:Int, source:Dynamic, sourceLen:Int, length:Int, from:flight.PixelOrder, to:flight.PixelOrder):Void {
#if hl
	flight._hl._fn.Bitmap.convertBitmapPixelOrder(out, outLen, source, sourceLen, length, from, to);
#elseif cpp
	flight._cpp._fn.Bitmap.convertBitmapPixelOrder(out, outLen, source, sourceLen, length, from, to);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.convertBitmapPixelOrder(out, outLen, source, sourceLen, length, from, to);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function premultiplyBitmapPixels(out:Dynamic, source:Dynamic, length:Int):Void {
	flight._js._fn.Bitmap.premultiplyBitmapPixels(out, source, length);
}
#else
extern inline function premultiplyBitmapPixels(out:Dynamic, outLen:Int, source:Dynamic, sourceLen:Int, length:Int):Void {
#if hl
	flight._hl._fn.Bitmap.premultiplyBitmapPixels(out, outLen, source, sourceLen, length);
#elseif cpp
	flight._cpp._fn.Bitmap.premultiplyBitmapPixels(out, outLen, source, sourceLen, length);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.premultiplyBitmapPixels(out, outLen, source, sourceLen, length);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unpremultiplyBitmapPixels(out:Dynamic, source:Dynamic, length:Int):Void {
	flight._js._fn.Bitmap.unpremultiplyBitmapPixels(out, source, length);
}
#else
extern inline function unpremultiplyBitmapPixels(out:Dynamic, outLen:Int, source:Dynamic, sourceLen:Int, length:Int):Void {
#if hl
	flight._hl._fn.Bitmap.unpremultiplyBitmapPixels(out, outLen, source, sourceLen, length);
#elseif cpp
	flight._cpp._fn.Bitmap.unpremultiplyBitmapPixels(out, outLen, source, sourceLen, length);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.unpremultiplyBitmapPixels(out, outLen, source, sourceLen, length);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function buildBitmapGradientRamp(out:Dynamic, colors:Dynamic, alphas:Dynamic, ratios:Dynamic):Void {
	flight._js._fn.Bitmap.buildBitmapGradientRamp(out, colors, alphas, ratios);
}
#else
extern inline function buildBitmapGradientRamp(out:Dynamic, outLen:Int, colors:Dynamic, colorsLen:Int, alphas:Dynamic, alphasLen:Int, ratios:Dynamic, ratiosLen:Int):Void {
#if hl
	flight._hl._fn.Bitmap.buildBitmapGradientRamp(out, outLen, colors, colorsLen, alphas, alphasLen, ratios, ratiosLen);
#elseif cpp
	flight._cpp._fn.Bitmap.buildBitmapGradientRamp(out, outLen, colors, colorsLen, alphas, alphasLen, ratios, ratiosLen);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.buildBitmapGradientRamp(out, outLen, colors, colorsLen, alphas, alphasLen, ratios, ratiosLen);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function gradientBevelBitmap(out:Dynamic, scratch:Dynamic, source:BitmapRegion, ramp:Dynamic, options:BitmapGradientBevelOptions):Void {
	flight._js._fn.Bitmap.gradientBevelBitmap(out, scratch, source, ramp, options);
}
#else
extern inline function gradientBevelBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:BitmapRegion, ramp:Dynamic, rampLen:Int, options:BitmapGradientBevelOptions):Void {
#if hl
	flight._hl._fn.Bitmap.gradientBevelBitmap(out, outLen, scratch, scratchLen, source, ramp, rampLen, options);
#elseif cpp
	flight._cpp._fn.Bitmap.gradientBevelBitmap(out, outLen, scratch, scratchLen, source, ramp, rampLen, options);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.gradientBevelBitmap(out, outLen, scratch, scratchLen, source, ramp, rampLen, options);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function gradientGlowBitmap(out:Dynamic, scratch:Dynamic, source:BitmapRegion, ramp:Dynamic, options:BitmapGradientGlowOptions):Void {
	flight._js._fn.Bitmap.gradientGlowBitmap(out, scratch, source, ramp, options);
}
#else
extern inline function gradientGlowBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:BitmapRegion, ramp:Dynamic, rampLen:Int, options:BitmapGradientGlowOptions):Void {
#if hl
	flight._hl._fn.Bitmap.gradientGlowBitmap(out, outLen, scratch, scratchLen, source, ramp, rampLen, options);
#elseif cpp
	flight._cpp._fn.Bitmap.gradientGlowBitmap(out, outLen, scratch, scratchLen, source, ramp, rampLen, options);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.gradientGlowBitmap(out, outLen, scratch, scratchLen, source, ramp, rampLen, options);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function fillBitmapLinearGradient(dest:BitmapRegion, ramp:Dynamic, x0:Float, y0:Float, x1:Float, y1:Float, spread:Dynamic):Void {
	flight._js._fn.Bitmap.fillBitmapLinearGradient(dest, ramp, x0, y0, x1, y1, spread);
}
#else
extern inline function fillBitmapLinearGradient(dest:BitmapRegion, ramp:Dynamic, rampLen:Int, x0:Float, y0:Float, x1:Float, y1:Float, spread:flight.GradientSpread):Void {
#if hl
	flight._hl._fn.Bitmap.fillBitmapLinearGradient(dest, ramp, rampLen, x0, y0, x1, y1, spread);
#elseif cpp
	flight._cpp._fn.Bitmap.fillBitmapLinearGradient(dest, ramp, rampLen, x0, y0, x1, y1, spread);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.fillBitmapLinearGradient(dest, ramp, rampLen, x0, y0, x1, y1, spread);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function fillBitmapRadialGradient(dest:BitmapRegion, ramp:Dynamic, cx:Float, cy:Float, radius:Float, focalX:Float, focalY:Float, spread:Dynamic):Void {
	flight._js._fn.Bitmap.fillBitmapRadialGradient(dest, ramp, cx, cy, radius, focalX, focalY, spread);
}
#else
extern inline function fillBitmapRadialGradient(dest:BitmapRegion, ramp:Dynamic, rampLen:Int, cx:Float, cy:Float, radius:Float, focalX:Float, focalY:Float, spread:flight.GradientSpread):Void {
#if hl
	flight._hl._fn.Bitmap.fillBitmapRadialGradient(dest, ramp, rampLen, cx, cy, radius, focalX, focalY, spread);
#elseif cpp
	flight._cpp._fn.Bitmap.fillBitmapRadialGradient(dest, ramp, rampLen, cx, cy, radius, focalX, focalY, spread);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.fillBitmapRadialGradient(dest, ramp, rampLen, cx, cy, radius, focalX, focalY, spread);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function equalizeBitmapHistogram(dest:BitmapRegion, source:BitmapRegion):Void {
	flight._js._fn.Bitmap.equalizeBitmapHistogram(dest, source);
}
#else
extern inline function equalizeBitmapHistogram(dest:BitmapRegion, source:BitmapRegion):Void {
#if hl
	flight._hl._fn.Bitmap.equalizeBitmapHistogram(dest, source);
#elseif cpp
	flight._cpp._fn.Bitmap.equalizeBitmapHistogram(dest, source);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.equalizeBitmapHistogram(dest, source);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapHistogram(source:BitmapRegion):BitmapHistogram {
	return flight._js._fn.Bitmap.getBitmapHistogram(source);
}
#else
extern inline function getBitmapHistogram(source:BitmapRegion):BitmapHistogram {
#if hl
	return flight._hl._fn.Bitmap.getBitmapHistogram(source);
#elseif cpp
	return flight._cpp._fn.Bitmap.getBitmapHistogram(source);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.getBitmapHistogram(source);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function medianBitmap(out:Dynamic, source:BitmapRegion, radius:Int):Void {
	flight._js._fn.Bitmap.medianBitmap(out, source, radius);
}
#else
extern inline function medianBitmap(out:Dynamic, outLen:Int, source:BitmapRegion, radius:Int):Void {
#if hl
	flight._hl._fn.Bitmap.medianBitmap(out, outLen, source, radius);
#elseif cpp
	flight._cpp._fn.Bitmap.medianBitmap(out, outLen, source, radius);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.medianBitmap(out, outLen, source, radius);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dilateBitmap(out:Dynamic, source:BitmapRegion, radius:Int):Void {
	flight._js._fn.Bitmap.dilateBitmap(out, source, radius);
}
#else
extern inline function dilateBitmap(out:Dynamic, outLen:Int, source:BitmapRegion, radius:Int):Void {
#if hl
	flight._hl._fn.Bitmap.dilateBitmap(out, outLen, source, radius);
#elseif cpp
	flight._cpp._fn.Bitmap.dilateBitmap(out, outLen, source, radius);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.dilateBitmap(out, outLen, source, radius);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function erodeBitmap(out:Dynamic, source:BitmapRegion, radius:Int):Void {
	flight._js._fn.Bitmap.erodeBitmap(out, source, radius);
}
#else
extern inline function erodeBitmap(out:Dynamic, outLen:Int, source:BitmapRegion, radius:Int):Void {
#if hl
	flight._hl._fn.Bitmap.erodeBitmap(out, outLen, source, radius);
#elseif cpp
	flight._cpp._fn.Bitmap.erodeBitmap(out, outLen, source, radius);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.erodeBitmap(out, outLen, source, radius);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function fillBitmapNoise(dest:BitmapRegion, seed:Int, low:Int, high:Int, grayScale:Bool):Void {
	flight._js._fn.Bitmap.fillBitmapNoise(dest, seed, low, high, grayScale);
}
#else
extern inline function fillBitmapNoise(dest:BitmapRegion, seed:Int, low:Int, high:Int, grayScale:Bool):Void {
#if hl
	flight._hl._fn.Bitmap.fillBitmapNoise(dest, seed, low, high, grayScale);
#elseif cpp
	flight._cpp._fn.Bitmap.fillBitmapNoise(dest, seed, low, high, grayScale);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.fillBitmapNoise(dest, seed, low, high, grayScale);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function fillBitmapPerlinNoise(dest:BitmapRegion, baseX:Float, baseY:Float, octaves:Int, seed:Int, grayScale:Bool, stitch:Bool, channelOptions:Int):Void {
	flight._js._fn.Bitmap.fillBitmapPerlinNoise(dest, baseX, baseY, octaves, seed, grayScale, stitch, channelOptions);
}
#else
extern inline function fillBitmapPerlinNoise(dest:BitmapRegion, baseX:Float, baseY:Float, octaves:Int, seed:Int, grayScale:Bool, stitch:Bool, channelOptions:Int):Void {
#if hl
	flight._hl._fn.Bitmap.fillBitmapPerlinNoise(dest, baseX, baseY, octaves, seed, grayScale, stitch, channelOptions);
#elseif cpp
	flight._cpp._fn.Bitmap.fillBitmapPerlinNoise(dest, baseX, baseY, octaves, seed, grayScale, stitch, channelOptions);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.fillBitmapPerlinNoise(dest, baseX, baseY, octaves, seed, grayScale, stitch, channelOptions);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function fillBitmapTurbulence(dest:BitmapRegion, baseX:Float, baseY:Float, octaves:Int, seed:Int, grayScale:Bool, stitch:Bool, channelOptions:Int):Void {
	flight._js._fn.Bitmap.fillBitmapTurbulence(dest, baseX, baseY, octaves, seed, grayScale, stitch, channelOptions);
}
#else
extern inline function fillBitmapTurbulence(dest:BitmapRegion, baseX:Float, baseY:Float, octaves:Int, seed:Int, grayScale:Bool, stitch:Bool, channelOptions:Int):Void {
#if hl
	flight._hl._fn.Bitmap.fillBitmapTurbulence(dest, baseX, baseY, octaves, seed, grayScale, stitch, channelOptions);
#elseif cpp
	flight._cpp._fn.Bitmap.fillBitmapTurbulence(dest, baseX, baseY, octaves, seed, grayScale, stitch, channelOptions);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.fillBitmapTurbulence(dest, baseX, baseY, octaves, seed, grayScale, stitch, channelOptions);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyBitmapPaletteMap(dest:BitmapRegion, source:BitmapRegion, redMap:Null<Dynamic>, greenMap:Null<Dynamic>, blueMap:Null<Dynamic>, alphaMap:Null<Dynamic>):Void {
	flight._js._fn.Bitmap.applyBitmapPaletteMap(dest, source, redMap, greenMap, blueMap, alphaMap);
}
#else
extern inline function applyBitmapPaletteMap(dest:BitmapRegion, source:BitmapRegion, redMap:Dynamic, redMapLen:Int, greenMap:Dynamic, greenMapLen:Int, blueMap:Dynamic, blueMapLen:Int, alphaMap:Dynamic, alphaMapLen:Int):Void {
#if hl
	flight._hl._fn.Bitmap.applyBitmapPaletteMap(dest, source, redMap, redMapLen, greenMap, greenMapLen, blueMap, blueMapLen, alphaMap, alphaMapLen);
#elseif cpp
	flight._cpp._fn.Bitmap.applyBitmapPaletteMap(dest, source, redMap, redMapLen, greenMap, greenMapLen, blueMap, blueMapLen, alphaMap, alphaMapLen);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.applyBitmapPaletteMap(dest, source, redMap, redMapLen, greenMap, greenMapLen, blueMap, blueMapLen, alphaMap, alphaMapLen);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapPixel(source:Bitmap, x:Int, y:Int):Int {
	return flight._js._fn.Bitmap.getBitmapPixel(source, x, y);
}
#else
extern inline function getBitmapPixel(source:Bitmap, x:Int, y:Int):Int {
#if hl
	return flight._hl._fn.Bitmap.getBitmapPixel(source, x, y);
#elseif cpp
	return flight._cpp._fn.Bitmap.getBitmapPixel(source, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.getBitmapPixel(source, x, y);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapPixelChannel(source:Bitmap, x:Int, y:Int, channel:ImageChannel):Int {
	return flight._js._fn.Bitmap.getBitmapPixelChannel(source, x, y, channel);
}
#else
extern inline function getBitmapPixelChannel(source:Bitmap, x:Int, y:Int, channel:ImageChannel):Int {
#if hl
	return flight._hl._fn.Bitmap.getBitmapPixelChannel(source, x, y, channel);
#elseif cpp
	return flight._cpp._fn.Bitmap.getBitmapPixelChannel(source, x, y, channel);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.getBitmapPixelChannel(source, x, y, channel);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapPixelLuminance(source:Bitmap, x:Int, y:Int):Int {
	return flight._js._fn.Bitmap.getBitmapPixelLuminance(source, x, y);
}
#else
extern inline function getBitmapPixelLuminance(source:Bitmap, x:Int, y:Int):Int {
#if hl
	return flight._hl._fn.Bitmap.getBitmapPixelLuminance(source, x, y);
#elseif cpp
	return flight._cpp._fn.Bitmap.getBitmapPixelLuminance(source, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.getBitmapPixelLuminance(source, x, y);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapPixelRgb(source:Bitmap, x:Int, y:Int):Int {
	return flight._js._fn.Bitmap.getBitmapPixelRgb(source, x, y);
}
#else
extern inline function getBitmapPixelRgb(source:Bitmap, x:Int, y:Int):Int {
#if hl
	return flight._hl._fn.Bitmap.getBitmapPixelRgb(source, x, y);
#elseif cpp
	return flight._cpp._fn.Bitmap.getBitmapPixelRgb(source, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.getBitmapPixelRgb(source, x, y);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setBitmapPixel(out:Bitmap, x:Int, y:Int, color:Int):Void {
	flight._js._fn.Bitmap.setBitmapPixel(out, x, y, color);
}
#else
extern inline function setBitmapPixel(out:Bitmap, x:Int, y:Int, color:Int):Void {
#if hl
	flight._hl._fn.Bitmap.setBitmapPixel(out, x, y, color);
#elseif cpp
	flight._cpp._fn.Bitmap.setBitmapPixel(out, x, y, color);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.setBitmapPixel(out, x, y, color);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setBitmapPixelRgb(out:Bitmap, x:Int, y:Int, color:Int):Void {
	flight._js._fn.Bitmap.setBitmapPixelRgb(out, x, y, color);
}
#else
extern inline function setBitmapPixelRgb(out:Bitmap, x:Int, y:Int, color:Int):Void {
#if hl
	flight._hl._fn.Bitmap.setBitmapPixelRgb(out, x, y, color);
#elseif cpp
	flight._cpp._fn.Bitmap.setBitmapPixelRgb(out, x, y, color);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.setBitmapPixelRgb(out, x, y, color);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function toClampedU8(value:Float):Int {
	return flight._js._fn.Bitmap.toClampedU8(value);
}
#else
extern inline function toClampedU8(value:Float):Int {
#if hl
	return flight._hl._fn.Bitmap.toClampedU8(value);
#elseif cpp
	return flight._cpp._fn.Bitmap.toClampedU8(value);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.toClampedU8(value);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function pixelateBitmap(out:Dynamic, source:BitmapRegion, blockSize:Int):Void {
	flight._js._fn.Bitmap.pixelateBitmap(out, source, blockSize);
}
#else
extern inline function pixelateBitmap(out:Dynamic, outLen:Int, source:BitmapRegion, blockSize:Int):Void {
#if hl
	flight._hl._fn.Bitmap.pixelateBitmap(out, outLen, source, blockSize);
#elseif cpp
	flight._cpp._fn.Bitmap.pixelateBitmap(out, outLen, source, blockSize);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.pixelateBitmap(out, outLen, source, blockSize);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createBitmapRegion(bitmap:Bitmap, x:Int, y:Int, width:Int, height:Int):BitmapRegion {
	return flight._js._fn.Bitmap.createBitmapRegion(bitmap, x, y, width, height);
}
#else
extern inline function createBitmapRegion(bitmap:Bitmap, x:Int, y:Int, width:Int, height:Int):BitmapRegion {
#if hl
	return flight._hl._fn.Bitmap.createBitmapRegion(bitmap, x, y, width, height);
#elseif cpp
	return flight._cpp._fn.Bitmap.createBitmapRegion(bitmap, x, y, width, height);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.createBitmapRegion(bitmap, x, y, width, height);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setBitmapRegion(out:BitmapRegion, bitmap:Bitmap, x:Int, y:Int, width:Int, height:Int):Void {
	flight._js._fn.Bitmap.setBitmapRegion(out, bitmap, x, y, width, height);
}
#else
extern inline function setBitmapRegion(out:BitmapRegion, bitmap:Bitmap, x:Int, y:Int, width:Int, height:Int):Void {
#if hl
	flight._hl._fn.Bitmap.setBitmapRegion(out, bitmap, x, y, width, height);
#elseif cpp
	flight._cpp._fn.Bitmap.setBitmapRegion(out, bitmap, x, y, width, height);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.setBitmapRegion(out, bitmap, x, y, width, height);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function resizeBitmap(dest:BitmapRegion, source:BitmapRegion, mode:Dynamic, edgeMode:Dynamic, premultiplied:Bool):Void {
	flight._js._fn.Bitmap.resizeBitmap(dest, source, mode, edgeMode, premultiplied);
}
#else
extern inline function resizeBitmap(dest:BitmapRegion, source:BitmapRegion, mode:flight.BitmapResizeMode, edgeMode:flight.BitmapEdgeMode, premultiplied:Bool):Void {
#if hl
	flight._hl._fn.Bitmap.resizeBitmap(dest, source, mode, edgeMode, premultiplied);
#elseif cpp
	flight._cpp._fn.Bitmap.resizeBitmap(dest, source, mode, edgeMode, premultiplied);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.resizeBitmap(dest, source, mode, edgeMode, premultiplied);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function rotateBitmap(dest:BitmapRegion, source:BitmapRegion, angle:Float, pivotX:Float, pivotY:Float, edgeMode:Dynamic, sampleMode:Dynamic):Void {
	flight._js._fn.Bitmap.rotateBitmap(dest, source, angle, pivotX, pivotY, edgeMode, sampleMode);
}
#else
extern inline function rotateBitmap(dest:BitmapRegion, source:BitmapRegion, angle:Float, pivotX:Float, pivotY:Float, edgeMode:flight.BitmapEdgeMode, sampleMode:flight.BitmapResizeMode):Void {
#if hl
	flight._hl._fn.Bitmap.rotateBitmap(dest, source, angle, pivotX, pivotY, edgeMode, sampleMode);
#elseif cpp
	flight._cpp._fn.Bitmap.rotateBitmap(dest, source, angle, pivotX, pivotY, edgeMode, sampleMode);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.rotateBitmap(dest, source, angle, pivotX, pivotY, edgeMode, sampleMode);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function rotateBitmap180(dest:BitmapRegion, source:BitmapRegion):Void {
	flight._js._fn.Bitmap.rotateBitmap180(dest, source);
}
#else
extern inline function rotateBitmap180(dest:BitmapRegion, source:BitmapRegion):Void {
#if hl
	flight._hl._fn.Bitmap.rotateBitmap180(dest, source);
#elseif cpp
	flight._cpp._fn.Bitmap.rotateBitmap180(dest, source);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.rotateBitmap180(dest, source);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function rotateBitmapClockwise(dest:BitmapRegion, source:BitmapRegion):Void {
	flight._js._fn.Bitmap.rotateBitmapClockwise(dest, source);
}
#else
extern inline function rotateBitmapClockwise(dest:BitmapRegion, source:BitmapRegion):Void {
#if hl
	flight._hl._fn.Bitmap.rotateBitmapClockwise(dest, source);
#elseif cpp
	flight._cpp._fn.Bitmap.rotateBitmapClockwise(dest, source);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.rotateBitmapClockwise(dest, source);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function rotateBitmapCounterClockwise(dest:BitmapRegion, source:BitmapRegion):Void {
	flight._js._fn.Bitmap.rotateBitmapCounterClockwise(dest, source);
}
#else
extern inline function rotateBitmapCounterClockwise(dest:BitmapRegion, source:BitmapRegion):Void {
#if hl
	flight._hl._fn.Bitmap.rotateBitmapCounterClockwise(dest, source);
#elseif cpp
	flight._cpp._fn.Bitmap.rotateBitmapCounterClockwise(dest, source);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.rotateBitmapCounterClockwise(dest, source);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dropShadowBitmap(out:Dynamic, scratch:Dynamic, source:BitmapRegion, options:BitmapDropShadowOptions):Void {
	flight._js._fn.Bitmap.dropShadowBitmap(out, scratch, source, options);
}
#else
extern inline function dropShadowBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:BitmapRegion, options:BitmapDropShadowOptions):Void {
#if hl
	flight._hl._fn.Bitmap.dropShadowBitmap(out, outLen, scratch, scratchLen, source, options);
#elseif cpp
	flight._cpp._fn.Bitmap.dropShadowBitmap(out, outLen, scratch, scratchLen, source, options);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.dropShadowBitmap(out, outLen, scratch, scratchLen, source, options);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function glowBitmap(out:Dynamic, scratch:Dynamic, source:BitmapRegion, options:BitmapGlowOptions):Void {
	flight._js._fn.Bitmap.glowBitmap(out, scratch, source, options);
}
#else
extern inline function glowBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:BitmapRegion, options:BitmapGlowOptions):Void {
#if hl
	flight._hl._fn.Bitmap.glowBitmap(out, outLen, scratch, scratchLen, source, options);
#elseif cpp
	flight._cpp._fn.Bitmap.glowBitmap(out, outLen, scratch, scratchLen, source, options);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.glowBitmap(out, outLen, scratch, scratchLen, source, options);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function innerGlowBitmap(out:Dynamic, scratch:Dynamic, source:BitmapRegion, options:BitmapInnerGlowOptions):Void {
	flight._js._fn.Bitmap.innerGlowBitmap(out, scratch, source, options);
}
#else
extern inline function innerGlowBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:BitmapRegion, options:BitmapInnerGlowOptions):Void {
#if hl
	flight._hl._fn.Bitmap.innerGlowBitmap(out, outLen, scratch, scratchLen, source, options);
#elseif cpp
	flight._cpp._fn.Bitmap.innerGlowBitmap(out, outLen, scratch, scratchLen, source, options);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.innerGlowBitmap(out, outLen, scratch, scratchLen, source, options);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function innerShadowBitmap(out:Dynamic, scratch:Dynamic, source:BitmapRegion, options:BitmapInnerShadowOptions):Void {
	flight._js._fn.Bitmap.innerShadowBitmap(out, scratch, source, options);
}
#else
extern inline function innerShadowBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:BitmapRegion, options:BitmapInnerShadowOptions):Void {
#if hl
	flight._hl._fn.Bitmap.innerShadowBitmap(out, outLen, scratch, scratchLen, source, options);
#elseif cpp
	flight._cpp._fn.Bitmap.innerShadowBitmap(out, outLen, scratch, scratchLen, source, options);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.innerShadowBitmap(out, outLen, scratch, scratchLen, source, options);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function sharpenBitmap(out:Dynamic, scratch:Dynamic, source:BitmapRegion, options:BitmapSharpenOptions):Void {
	flight._js._fn.Bitmap.sharpenBitmap(out, scratch, source, options);
}
#else
extern inline function sharpenBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:BitmapRegion, options:BitmapSharpenOptions):Void {
#if hl
	flight._hl._fn.Bitmap.sharpenBitmap(out, outLen, scratch, scratchLen, source, options);
#elseif cpp
	flight._cpp._fn.Bitmap.sharpenBitmap(out, outLen, scratch, scratchLen, source, options);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.sharpenBitmap(out, outLen, scratch, scratchLen, source, options);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyBitmapCurve(out:BitmapRegion, source:BitmapRegion, redLut:Null<Dynamic>, greenLut:Null<Dynamic>, blueLut:Null<Dynamic>, alphaLut:Null<Dynamic>):Void {
	flight._js._fn.Bitmap.applyBitmapCurve(out, source, redLut, greenLut, blueLut, alphaLut);
}
#else
extern inline function applyBitmapCurve(out:BitmapRegion, source:BitmapRegion, redLut:Dynamic, redLutLen:Int, greenLut:Dynamic, greenLutLen:Int, blueLut:Dynamic, blueLutLen:Int, alphaLut:Dynamic, alphaLutLen:Int):Void {
#if hl
	flight._hl._fn.Bitmap.applyBitmapCurve(out, source, redLut, redLutLen, greenLut, greenLutLen, blueLut, blueLutLen, alphaLut, alphaLutLen);
#elseif cpp
	flight._cpp._fn.Bitmap.applyBitmapCurve(out, source, redLut, redLutLen, greenLut, greenLutLen, blueLut, blueLutLen, alphaLut, alphaLutLen);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.applyBitmapCurve(out, source, redLut, redLutLen, greenLut, greenLutLen, blueLut, blueLutLen, alphaLut, alphaLutLen);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyBitmapLevels(out:BitmapRegion, source:BitmapRegion, blackPoint:Float, whitePoint:Float, gamma:Float):Void {
	flight._js._fn.Bitmap.applyBitmapLevels(out, source, blackPoint, whitePoint, gamma);
}
#else
extern inline function applyBitmapLevels(out:BitmapRegion, source:BitmapRegion, blackPoint:Float, whitePoint:Float, gamma:Float):Void {
#if hl
	flight._hl._fn.Bitmap.applyBitmapLevels(out, source, blackPoint, whitePoint, gamma);
#elseif cpp
	flight._cpp._fn.Bitmap.applyBitmapLevels(out, source, blackPoint, whitePoint, gamma);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.applyBitmapLevels(out, source, blackPoint, whitePoint, gamma);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyBitmapColorScaleBias(dest:BitmapRegion, source:BitmapRegion, ct:ColorScaleBias):Void {
	flight._js._fn.Bitmap.applyBitmapColorScaleBias(dest, source, ct);
}
#else
extern inline function applyBitmapColorScaleBias(dest:BitmapRegion, source:BitmapRegion, ct:ColorScaleBias):Void {
#if hl
	flight._hl._fn.Bitmap.applyBitmapColorScaleBias(dest, source, ct);
#elseif cpp
	flight._cpp._fn.Bitmap.applyBitmapColorScaleBias(dest, source, ct);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.applyBitmapColorScaleBias(dest, source, ct);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyBitmapThreshold(dest:BitmapRegion, source:BitmapRegion, operation:Dynamic, thresholdValue:Int, color:Int, mask:Int, copySource:Bool):Int {
	return flight._js._fn.Bitmap.applyBitmapThreshold(dest, source, operation, thresholdValue, color, mask, copySource);
}
#else
extern inline function applyBitmapThreshold(dest:BitmapRegion, source:BitmapRegion, operation:flight.ThresholdOperation, thresholdValue:Int, color:Int, mask:Int, copySource:Bool):Int {
#if hl
	return flight._hl._fn.Bitmap.applyBitmapThreshold(dest, source, operation, thresholdValue, color, mask, copySource);
#elseif cpp
	return flight._cpp._fn.Bitmap.applyBitmapThreshold(dest, source, operation, thresholdValue, color, mask, copySource);
#elseif (js && flight_esm)
	return flight._js._fn.Bitmap.applyBitmapThreshold(dest, source, operation, thresholdValue, color, mask, copySource);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function mergeBitmap(dest:BitmapRegion, source:BitmapRegion, redScale:Float, greenScale:Float, blueScale:Float, alphaScale:Float):Void {
	flight._js._fn.Bitmap.mergeBitmap(dest, source, redScale, greenScale, blueScale, alphaScale);
}
#else
extern inline function mergeBitmap(dest:BitmapRegion, source:BitmapRegion, redScale:Float, greenScale:Float, blueScale:Float, alphaScale:Float):Void {
#if hl
	flight._hl._fn.Bitmap.mergeBitmap(dest, source, redScale, greenScale, blueScale, alphaScale);
#elseif cpp
	flight._cpp._fn.Bitmap.mergeBitmap(dest, source, redScale, greenScale, blueScale, alphaScale);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.mergeBitmap(dest, source, redScale, greenScale, blueScale, alphaScale);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function scrollBitmap(out:Bitmap, dx:Int, dy:Int):Void {
	flight._js._fn.Bitmap.scrollBitmap(out, dx, dy);
}
#else
extern inline function scrollBitmap(out:Bitmap, dx:Int, dy:Int):Void {
#if hl
	flight._hl._fn.Bitmap.scrollBitmap(out, dx, dy);
#elseif cpp
	flight._cpp._fn.Bitmap.scrollBitmap(out, dx, dy);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.scrollBitmap(out, dx, dy);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function warpBitmap(dest:BitmapRegion, source:BitmapRegion, matrix:Dynamic, edgeMode:Dynamic, sampleMode:Dynamic):Void {
	flight._js._fn.Bitmap.warpBitmap(dest, source, matrix, edgeMode, sampleMode);
}
#else
extern inline function warpBitmap(dest:BitmapRegion, source:BitmapRegion, matrix:Dynamic, edgeMode:flight.BitmapEdgeMode, sampleMode:flight.BitmapResizeMode):Void {
#if hl
	flight._hl._fn.Bitmap.warpBitmap(dest, source, matrix, edgeMode, sampleMode);
#elseif cpp
	flight._cpp._fn.Bitmap.warpBitmap(dest, source, matrix, edgeMode, sampleMode);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.warpBitmap(dest, source, matrix, edgeMode, sampleMode);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function warpBitmapQuad(dest:BitmapRegion, source:BitmapRegion, dstQuad:Dynamic, edgeMode:Dynamic, sampleMode:Dynamic):Void {
	flight._js._fn.Bitmap.warpBitmapQuad(dest, source, dstQuad, edgeMode, sampleMode);
}
#else
extern inline function warpBitmapQuad(dest:BitmapRegion, source:BitmapRegion, dstQuad:Dynamic, edgeMode:flight.BitmapEdgeMode, sampleMode:flight.BitmapResizeMode):Void {
#if hl
	flight._hl._fn.Bitmap.warpBitmapQuad(dest, source, dstQuad, edgeMode, sampleMode);
#elseif cpp
	flight._cpp._fn.Bitmap.warpBitmapQuad(dest, source, dstQuad, edgeMode, sampleMode);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.warpBitmapQuad(dest, source, dstQuad, edgeMode, sampleMode);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBitmap(ptr:Bitmap):Void {
	flight._js._fn.Bitmap.freeBitmap(ptr);
}
#else
extern inline function freeBitmap(ptr:Bitmap):Void {
#if hl
	flight._hl._fn.Bitmap.freeBitmap(ptr);
#elseif cpp
	flight._cpp._fn.Bitmap.freeBitmap(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.freeBitmap(ptr);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBitmapMismatch(ptr:BitmapMismatch):Void {
	flight._js._fn.Bitmap.freeBitmapMismatch(ptr);
}
#else
extern inline function freeBitmapMismatch(ptr:BitmapMismatch):Void {
#if hl
	flight._hl._fn.Bitmap.freeBitmapMismatch(ptr);
#elseif cpp
	flight._cpp._fn.Bitmap.freeBitmapMismatch(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.freeBitmapMismatch(ptr);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBitmapEncodeFailureExplanation(ptr:BitmapEncodeFailureExplanation):Void {
	flight._js._fn.Bitmap.freeBitmapEncodeFailureExplanation(ptr);
}
#else
extern inline function freeBitmapEncodeFailureExplanation(ptr:BitmapEncodeFailureExplanation):Void {
#if hl
	flight._hl._fn.Bitmap.freeBitmapEncodeFailureExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Bitmap.freeBitmapEncodeFailureExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.freeBitmapEncodeFailureExplanation(ptr);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBitmapFingerprint(ptr:BitmapFingerprint):Void {
	flight._js._fn.Bitmap.freeBitmapFingerprint(ptr);
}
#else
extern inline function freeBitmapFingerprint(ptr:BitmapFingerprint):Void {
#if hl
	flight._hl._fn.Bitmap.freeBitmapFingerprint(ptr);
#elseif cpp
	flight._cpp._fn.Bitmap.freeBitmapFingerprint(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.freeBitmapFingerprint(ptr);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBitmapHistogram(ptr:BitmapHistogram):Void {
	flight._js._fn.Bitmap.freeBitmapHistogram(ptr);
}
#else
extern inline function freeBitmapHistogram(ptr:BitmapHistogram):Void {
#if hl
	flight._hl._fn.Bitmap.freeBitmapHistogram(ptr);
#elseif cpp
	flight._cpp._fn.Bitmap.freeBitmapHistogram(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.freeBitmapHistogram(ptr);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBitmapRegion(ptr:BitmapRegion):Void {
	flight._js._fn.Bitmap.freeBitmapRegion(ptr);
}
#else
extern inline function freeBitmapRegion(ptr:BitmapRegion):Void {
#if hl
	flight._hl._fn.Bitmap.freeBitmapRegion(ptr);
#elseif cpp
	flight._cpp._fn.Bitmap.freeBitmapRegion(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Bitmap.freeBitmapRegion(ptr);
#else
	#error "flight.Bitmap: no backend for this target."
#end
}
#end
