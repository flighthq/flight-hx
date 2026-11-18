package flight._cpp._fn;

extern class Bitmap {
	@:native("flight_create_bitmap")
	public static function createBitmap(width:Int, height:Int, color:haxe.Int64):flight._cpp.Bitmap;
	@:native("flight_clone_bitmap")
	public static function cloneBitmap(source:flight._cpp.Bitmap):flight._cpp.Bitmap;
	@:native("flight_convert_bitmap_alpha_type")
	public static function convertBitmapAlphaType(out:flight._cpp.Bitmap, target:Int):Void;
	@:native("flight_invalidate_bitmap")
	public static function invalidateBitmap(bitmap:flight._cpp.Bitmap):Void;
	@:native("flight_transform_bitmap")
	public static function transformBitmap(dest:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion, matrix:cpp.Star<cpp.Void>, edgeMode:Int, sampleMode:Int):Void;
	@:native("flight_copy_bitmap_alpha")
	public static function copyBitmapAlpha(dest:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion):Void;
	@:native("flight_multiply_bitmap_alpha")
	public static function multiplyBitmapAlpha(out:flight._cpp.BitmapRegion, factor:Single):Void;
	@:native("flight_set_bitmap_alpha")
	public static function setBitmapAlpha(out:flight._cpp.BitmapRegion, alpha:Single):Void;
	@:native("flight_bevel_bitmap")
	public static function bevelBitmap(out:cpp.Star<cpp.Void>, outLen:Int, scratch:cpp.Star<cpp.Void>, scratchLen:Int, source:flight._cpp.BitmapRegion, options:flight._cpp.BitmapBevelOptions):Void;
	@:native("flight_blur_bitmap_pixels_horizontal")
	public static function blurBitmapPixelsHorizontal(out:cpp.Star<cpp.Void>, outLen:Int, source:cpp.Star<cpp.Void>, sourceLen:Int, width:Int, height:Int, radius:Int):Void;
	@:native("flight_blur_bitmap_pixels_horizontal_weighted")
	public static function blurBitmapPixelsHorizontalWeighted(out:cpp.Star<cpp.Void>, outLen:Int, source:cpp.Star<cpp.Void>, sourceLen:Int, width:Int, height:Int, kernel:cpp.Star<cpp.Void>, kernelLen:Int):Void;
	@:native("flight_blur_bitmap_pixels_vertical")
	public static function blurBitmapPixelsVertical(out:cpp.Star<cpp.Void>, outLen:Int, source:cpp.Star<cpp.Void>, sourceLen:Int, width:Int, height:Int, radius:Int):Void;
	@:native("flight_blur_bitmap_pixels_vertical_weighted")
	public static function blurBitmapPixelsVerticalWeighted(out:cpp.Star<cpp.Void>, outLen:Int, source:cpp.Star<cpp.Void>, sourceLen:Int, width:Int, height:Int, kernel:cpp.Star<cpp.Void>, kernelLen:Int):Void;
	@:native("flight_box_blur_bitmap")
	public static function boxBlurBitmap(out:cpp.Star<cpp.Void>, outLen:Int, scratch:cpp.Star<cpp.Void>, scratchLen:Int, source:flight._cpp.BitmapRegion, options:flight._cpp.BitmapBoxBlurOptions):Void;
	@:native("flight_compute_gaussian_kernel")
	public static function computeGaussianKernel(out:cpp.Star<cpp.Void>, outLen:Int, radius:Int, sigma:Single):Void;
	@:native("flight_gaussian_blur_bitmap")
	public static function gaussianBlurBitmap(out:cpp.Star<cpp.Void>, outLen:Int, scratch:cpp.Star<cpp.Void>, scratchLen:Int, source:flight._cpp.BitmapRegion, sigmaX:Single, sigmaY:Single, passes:Int):Void;
	@:native("flight_merge_bitmap_channels")
	public static function mergeBitmapChannels(out:flight._cpp.BitmapRegion, r:flight._cpp.BitmapRegion, g:flight._cpp.BitmapRegion, b:flight._cpp.BitmapRegion, a:flight._cpp.BitmapRegion):Void;
	@:native("flight_build_bitmap_brightness_color_matrix")
	public static function buildBitmapBrightnessColorMatrix(out:cpp.Star<cpp.Void>, amount:Single):Void;
	@:native("flight_build_bitmap_contrast_color_matrix")
	public static function buildBitmapContrastColorMatrix(out:cpp.Star<cpp.Void>, amount:Single):Void;
	@:native("flight_build_bitmap_grayscale_color_matrix")
	public static function buildBitmapGrayscaleColorMatrix(out:cpp.Star<cpp.Void>):Void;
	@:native("flight_build_bitmap_hue_rotation_color_matrix")
	public static function buildBitmapHueRotationColorMatrix(out:cpp.Star<cpp.Void>, degrees:Single):Void;
	@:native("flight_build_bitmap_invert_color_matrix")
	public static function buildBitmapInvertColorMatrix(out:cpp.Star<cpp.Void>):Void;
	@:native("flight_build_bitmap_saturation_color_matrix")
	public static function buildBitmapSaturationColorMatrix(out:cpp.Star<cpp.Void>, amount:Single):Void;
	@:native("flight_build_bitmap_sepia_color_matrix")
	public static function buildBitmapSepiaColorMatrix(out:cpp.Star<cpp.Void>):Void;
	@:native("flight_color_matrix_bitmap")
	public static function colorMatrixBitmap(out:cpp.Star<cpp.Void>, outLen:Int, source:flight._cpp.BitmapRegion, matrix:cpp.Star<cpp.Void>, matrixLen:Int):Void;
	@:native("flight_concat_bitmap_color_matrix")
	public static function concatBitmapColorMatrix(out:cpp.Star<cpp.Void>, first:cpp.Star<cpp.Void>, second:cpp.Star<cpp.Void>):Void;
	@:native("flight_set_bitmap_color_matrix_identity")
	public static function setBitmapColorMatrixIdentity(out:cpp.Star<cpp.Void>):Void;
	@:native("flight_compare_bitmap")
	public static function compareBitmap(source:flight._cpp.Bitmap, other:flight._cpp.Bitmap):flight._cpp.Bitmap;
	@:native("flight_get_bitmap_mismatch")
	public static function getBitmapMismatch(source:flight._cpp.Bitmap, other:flight._cpp.Bitmap, channelTolerance:Int):flight._cpp.BitmapMismatch;
	@:native("flight_composite_bitmap_pixels")
	public static function compositeBitmapPixels(dest:flight._cpp.BitmapRegion, pixels:cpp.Star<cpp.Void>, pixelsLen:Int, mode:flight._cpp.BitmapCompositeMode):Void;
	@:native("flight_composite_bitmap_region")
	public static function compositeBitmapRegion(dest:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion, mode:flight._cpp.BitmapCompositeMode):Void;
	@:native("flight_extract_bitmap_pixels")
	public static function extractBitmapPixels(out:cpp.Star<cpp.Void>, outLen:Int, source:flight._cpp.BitmapRegion):Void;
	@:native("flight_extract_bitmap_pixels32")
	public static function extractBitmapPixels32(out:cpp.Star<cpp.Void>, outLen:Int, source:flight._cpp.BitmapRegion):Void;
	@:native("flight_write_bitmap_pixels")
	public static function writeBitmapPixels(dest:flight._cpp.BitmapRegion, pixels:cpp.Star<cpp.Void>, pixelsLen:Int):Void;
	@:native("flight_write_bitmap_pixels32")
	public static function writeBitmapPixels32(dest:flight._cpp.BitmapRegion, pixels:cpp.Star<cpp.Void>, pixelsLen:Int):Void;
	@:native("flight_convolve_bitmap")
	public static function convolveBitmap(out:cpp.Star<cpp.Void>, outLen:Int, source:flight._cpp.BitmapRegion, options:flight._cpp.BitmapConvolutionOptions):Void;
	@:native("flight_copy_bitmap_channel")
	public static function copyBitmapChannel(dest:flight._cpp.BitmapRegion, destChannel:flight._cpp.ImageChannel, source:flight._cpp.BitmapRegion, sourceChannel:flight._cpp.ImageChannel):Void;
	@:native("flight_copy_bitmap_pixels")
	public static function copyBitmapPixels(dest:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion, composite:Bool):Void;
	@:native("flight_get_bitmap_coverage")
	public static function getBitmapCoverage(source:flight._cpp.Bitmap, backgroundColor:Int, channelTolerance:Int):Float;
	@:native("flight_crop_bitmap")
	public static function cropBitmap(source:flight._cpp.Bitmap, rect:flight._cpp.Rectangle):flight._cpp.Bitmap;
	@:native("flight_extend_bitmap")
	public static function extendBitmap(source:flight._cpp.Bitmap, left:Int, top:Int, right:Int, bottom:Int, edgeMode:Int, fillColor:Int):flight._cpp.Bitmap;
	@:native("flight_trim_bitmap")
	public static function trimBitmap(source:flight._cpp.Bitmap):flight._cpp.Bitmap;
	@:native("flight_displace_bitmap")
	public static function displaceBitmap(out:cpp.Star<cpp.Void>, outLen:Int, source:flight._cpp.BitmapRegion, options:flight._cpp.BitmapDisplacementMapOptions):Void;
	@:native("flight_dissolve_bitmap_pixels")
	public static function dissolveBitmapPixels(dest:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion, seed:Int, pixelCount:Int, fillColor:Int):Int;
	@:native("flight_encode_bitmap")
	public static function encodeBitmap(hostBitmapEncode:flight._cpp.HostBitmapEncodeCapability, source:flight._cpp.Bitmap, format:Int, quality:Single):Null<flight._cpp.NativeByteBuffer>;
	@:native("flight_explain_bitmap_encode_failure")
	public static function explainBitmapEncodeFailure(hostBitmapEncode:flight._cpp.HostBitmapEncodeCapability, format:Int):flight._cpp.BitmapEncodeFailureExplanation;
	@:native("flight_fill_bitmap_rectangle")
	public static function fillBitmapRectangle(dest:flight._cpp.BitmapRegion, color:Int):Void;
	@:native("flight_flood_fill_bitmap")
	public static function floodFillBitmap(out:flight._cpp.Bitmap, x:Int, y:Int, color:Int):Void;
	@:native("flight_create_bitmap_fingerprint")
	public static function createBitmapFingerprint(source:flight._cpp.Bitmap, gridSize:Int):flight._cpp.BitmapFingerprint;
	@:native("flight_compare_bitmap_fingerprints")
	public static function compareBitmapFingerprints(a:flight._cpp.BitmapFingerprint, b:flight._cpp.BitmapFingerprint):Float;
	@:native("flight_format_bitmap_fingerprint")
	public static function formatBitmapFingerprint(fingerprint:flight._cpp.BitmapFingerprint):cpp.ConstCharStar;
	@:native("flight_parse_bitmap_fingerprint")
	public static function parseBitmapFingerprint(text:cpp.ConstCharStar):flight._cpp.BitmapFingerprint;
	@:native("flight_flip_bitmap_horizontal")
	public static function flipBitmapHorizontal(dest:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion):Void;
	@:native("flight_flip_bitmap_vertical")
	public static function flipBitmapVertical(dest:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion):Void;
	@:native("flight_convert_bitmap_pixel_order")
	public static function convertBitmapPixelOrder(out:cpp.Star<cpp.Void>, outLen:Int, source:cpp.Star<cpp.Void>, sourceLen:Int, length:Int, from:Int, to:Int):Void;
	@:native("flight_premultiply_bitmap_pixels")
	public static function premultiplyBitmapPixels(out:cpp.Star<cpp.Void>, outLen:Int, source:cpp.Star<cpp.Void>, sourceLen:Int, length:Int):Void;
	@:native("flight_unpremultiply_bitmap_pixels")
	public static function unpremultiplyBitmapPixels(out:cpp.Star<cpp.Void>, outLen:Int, source:cpp.Star<cpp.Void>, sourceLen:Int, length:Int):Void;
	@:native("flight_build_bitmap_gradient_ramp")
	public static function buildBitmapGradientRamp(out:cpp.Star<cpp.Void>, outLen:Int, colors:cpp.Star<cpp.Void>, colorsLen:Int, alphas:cpp.Star<cpp.Void>, alphasLen:Int, ratios:cpp.Star<cpp.Void>, ratiosLen:Int):Void;
	@:native("flight_gradient_bevel_bitmap")
	public static function gradientBevelBitmap(out:cpp.Star<cpp.Void>, outLen:Int, scratch:cpp.Star<cpp.Void>, scratchLen:Int, source:flight._cpp.BitmapRegion, ramp:cpp.Star<cpp.Void>, rampLen:Int, options:flight._cpp.BitmapGradientBevelOptions):Void;
	@:native("flight_gradient_glow_bitmap")
	public static function gradientGlowBitmap(out:cpp.Star<cpp.Void>, outLen:Int, scratch:cpp.Star<cpp.Void>, scratchLen:Int, source:flight._cpp.BitmapRegion, ramp:cpp.Star<cpp.Void>, rampLen:Int, options:flight._cpp.BitmapGradientGlowOptions):Void;
	@:native("flight_fill_bitmap_linear_gradient")
	public static function fillBitmapLinearGradient(dest:flight._cpp.BitmapRegion, ramp:cpp.Star<cpp.Void>, rampLen:Int, x0:Single, y0:Single, x1:Single, y1:Single, spread:Int):Void;
	@:native("flight_fill_bitmap_radial_gradient")
	public static function fillBitmapRadialGradient(dest:flight._cpp.BitmapRegion, ramp:cpp.Star<cpp.Void>, rampLen:Int, cx:Single, cy:Single, radius:Single, focalX:Single, focalY:Single, spread:Int):Void;
	@:native("flight_equalize_bitmap_histogram")
	public static function equalizeBitmapHistogram(dest:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion):Void;
	@:native("flight_get_bitmap_histogram")
	public static function getBitmapHistogram(source:flight._cpp.BitmapRegion):flight._cpp.BitmapHistogram;
	@:native("flight_median_bitmap")
	public static function medianBitmap(out:cpp.Star<cpp.Void>, outLen:Int, source:flight._cpp.BitmapRegion, radius:Int):Void;
	@:native("flight_dilate_bitmap")
	public static function dilateBitmap(out:cpp.Star<cpp.Void>, outLen:Int, source:flight._cpp.BitmapRegion, radius:Int):Void;
	@:native("flight_erode_bitmap")
	public static function erodeBitmap(out:cpp.Star<cpp.Void>, outLen:Int, source:flight._cpp.BitmapRegion, radius:Int):Void;
	@:native("flight_fill_bitmap_noise")
	public static function fillBitmapNoise(dest:flight._cpp.BitmapRegion, seed:Int, low:Int, high:Int, grayScale:Bool):Void;
	@:native("flight_fill_bitmap_perlin_noise")
	public static function fillBitmapPerlinNoise(dest:flight._cpp.BitmapRegion, baseX:Float, baseY:Float, octaves:Int, seed:Int, grayScale:Bool, stitch:Bool, channelOptions:Int):Void;
	@:native("flight_fill_bitmap_turbulence")
	public static function fillBitmapTurbulence(dest:flight._cpp.BitmapRegion, baseX:Float, baseY:Float, octaves:Int, seed:Int, grayScale:Bool, stitch:Bool, channelOptions:Int):Void;
	@:native("flight_apply_bitmap_palette_map")
	public static function applyBitmapPaletteMap(dest:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion, redMap:cpp.Star<cpp.Void>, redMapLen:Int, greenMap:cpp.Star<cpp.Void>, greenMapLen:Int, blueMap:cpp.Star<cpp.Void>, blueMapLen:Int, alphaMap:cpp.Star<cpp.Void>, alphaMapLen:Int):Void;
	@:native("flight_get_bitmap_pixel")
	public static function getBitmapPixel(source:flight._cpp.Bitmap, x:Int, y:Int):Int;
	@:native("flight_get_bitmap_pixel_channel")
	public static function getBitmapPixelChannel(source:flight._cpp.Bitmap, x:Int, y:Int, channel:flight._cpp.ImageChannel):Int;
	@:native("flight_get_bitmap_pixel_luminance")
	public static function getBitmapPixelLuminance(source:flight._cpp.Bitmap, x:Int, y:Int):Int;
	@:native("flight_get_bitmap_pixel_rgb")
	public static function getBitmapPixelRgb(source:flight._cpp.Bitmap, x:Int, y:Int):Int;
	@:native("flight_set_bitmap_pixel")
	public static function setBitmapPixel(out:flight._cpp.Bitmap, x:Int, y:Int, color:Int):Void;
	@:native("flight_set_bitmap_pixel_rgb")
	public static function setBitmapPixelRgb(out:flight._cpp.Bitmap, x:Int, y:Int, color:Int):Void;
	@:native("flight_pixelate_bitmap")
	public static function pixelateBitmap(out:cpp.Star<cpp.Void>, outLen:Int, source:flight._cpp.BitmapRegion, blockSize:Int):Void;
	@:native("flight_get_bitmap_color_bounds_rectangle")
	public static function getBitmapColorBoundsRectangle(source:flight._cpp.BitmapRegion, mask:Int, color:Int, findColor:Bool):flight._cpp.Rectangle;
	@:native("flight_create_bitmap_region")
	public static function createBitmapRegion(bitmap:flight._cpp.Bitmap, x:Int, y:Int, width:Int, height:Int):flight._cpp.BitmapRegion;
	@:native("flight_set_bitmap_region")
	public static function setBitmapRegion(out:flight._cpp.BitmapRegion, bitmap:flight._cpp.Bitmap, x:Int, y:Int, width:Int, height:Int):Void;
	@:native("flight_resize_bitmap")
	public static function resizeBitmap(dest:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion, mode:Int, edgeMode:Int, premultiplied:Bool):Void;
	@:native("flight_rotate_bitmap")
	public static function rotateBitmap(dest:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion, angle:Float, pivotX:Float, pivotY:Float, edgeMode:Int, sampleMode:Int):Void;
	@:native("flight_rotate_bitmap_180")
	public static function rotateBitmap180(dest:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion):Void;
	@:native("flight_rotate_bitmap_clockwise")
	public static function rotateBitmapClockwise(dest:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion):Void;
	@:native("flight_rotate_bitmap_counter_clockwise")
	public static function rotateBitmapCounterClockwise(dest:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion):Void;
	@:native("flight_drop_shadow_bitmap")
	public static function dropShadowBitmap(out:cpp.Star<cpp.Void>, outLen:Int, scratch:cpp.Star<cpp.Void>, scratchLen:Int, source:flight._cpp.BitmapRegion, options:flight._cpp.BitmapDropShadowOptions):Void;
	@:native("flight_glow_bitmap")
	public static function glowBitmap(out:cpp.Star<cpp.Void>, outLen:Int, scratch:cpp.Star<cpp.Void>, scratchLen:Int, source:flight._cpp.BitmapRegion, options:flight._cpp.BitmapGlowOptions):Void;
	@:native("flight_inner_glow_bitmap")
	public static function innerGlowBitmap(out:cpp.Star<cpp.Void>, outLen:Int, scratch:cpp.Star<cpp.Void>, scratchLen:Int, source:flight._cpp.BitmapRegion, options:flight._cpp.BitmapInnerGlowOptions):Void;
	@:native("flight_inner_shadow_bitmap")
	public static function innerShadowBitmap(out:cpp.Star<cpp.Void>, outLen:Int, scratch:cpp.Star<cpp.Void>, scratchLen:Int, source:flight._cpp.BitmapRegion, options:flight._cpp.BitmapInnerShadowOptions):Void;
	@:native("flight_sharpen_bitmap")
	public static function sharpenBitmap(out:cpp.Star<cpp.Void>, outLen:Int, scratch:cpp.Star<cpp.Void>, scratchLen:Int, source:flight._cpp.BitmapRegion, options:flight._cpp.BitmapSharpenOptions):Void;
	@:native("flight_apply_bitmap_curve")
	public static function applyBitmapCurve(out:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion, redLut:cpp.Star<cpp.Void>, redLutLen:Int, greenLut:cpp.Star<cpp.Void>, greenLutLen:Int, blueLut:cpp.Star<cpp.Void>, blueLutLen:Int, alphaLut:cpp.Star<cpp.Void>, alphaLutLen:Int):Void;
	@:native("flight_apply_bitmap_levels")
	public static function applyBitmapLevels(out:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion, blackPoint:Single, whitePoint:Single, gamma:Single):Void;
	@:native("flight_apply_bitmap_color_scale_bias")
	public static function applyBitmapColorScaleBias(dest:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion, ct:flight._cpp.ColorScaleBias):Void;
	@:native("flight_apply_bitmap_threshold")
	public static function applyBitmapThreshold(dest:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion, operation:Int, thresholdValue:Int, color:Int, mask:Int, copySource:Bool):Int;
	@:native("flight_merge_bitmap")
	public static function mergeBitmap(dest:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion, redScale:Single, greenScale:Single, blueScale:Single, alphaScale:Single):Void;
	@:native("flight_scroll_bitmap")
	public static function scrollBitmap(out:flight._cpp.Bitmap, dx:Int, dy:Int):Void;
	@:native("flight_warp_bitmap")
	public static function warpBitmap(dest:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion, matrix:cpp.Star<cpp.Void>, edgeMode:Int, sampleMode:Int):Void;
	@:native("flight_warp_bitmap_quad")
	public static function warpBitmapQuad(dest:flight._cpp.BitmapRegion, source:flight._cpp.BitmapRegion, dstQuad:cpp.Star<cpp.Void>, edgeMode:Int, sampleMode:Int):Void;
	@:native("flight_free_bitmap")
	public static function freeBitmap(ptr:flight._cpp.Bitmap):Void;
	@:native("flight_free_bitmap_mismatch")
	public static function freeBitmapMismatch(ptr:flight._cpp.BitmapMismatch):Void;
	@:native("flight_free_bitmap_encode_failure_explanation")
	public static function freeBitmapEncodeFailureExplanation(ptr:flight._cpp.BitmapEncodeFailureExplanation):Void;
	@:native("flight_free_bitmap_fingerprint")
	public static function freeBitmapFingerprint(ptr:flight._cpp.BitmapFingerprint):Void;
	@:native("flight_free_bitmap_histogram")
	public static function freeBitmapHistogram(ptr:flight._cpp.BitmapHistogram):Void;
	@:native("flight_free_rectangle")
	public static function freeRectangle(ptr:flight._cpp.Rectangle):Void;
	@:native("flight_free_bitmap_region")
	public static function freeBitmapRegion(ptr:flight._cpp.BitmapRegion):Void;
}
