package flight._js._fn;

@:jsRequire("flight")
extern class Bitmap {
	@:native("flight_create_bitmap")
	public static function createBitmap(width:Int, height:Int, color:haxe.Int64):flight._js.Bitmap;
	@:native("flight_clone_bitmap")
	public static function cloneBitmap(source:flight._js.Bitmap):flight._js.Bitmap;
	@:native("flight_convert_bitmap_alpha_type")
	public static function convertBitmapAlphaType(out:flight._js.Bitmap, target:Int):Void;
	@:native("flight_invalidate_bitmap")
	public static function invalidateBitmap(bitmap:flight._js.Bitmap):Void;
	@:native("flight_transform_bitmap")
	public static function transformBitmap(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, matrix:Dynamic, edgeMode:Int, sampleMode:Int):Void;
	@:native("flight_copy_bitmap_alpha")
	public static function copyBitmapAlpha(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion):Void;
	@:native("flight_multiply_bitmap_alpha")
	public static function multiplyBitmapAlpha(out:flight._js.BitmapRegion, factor:Float):Void;
	@:native("flight_set_bitmap_alpha")
	public static function setBitmapAlpha(out:flight._js.BitmapRegion, alpha:Float):Void;
	@:native("flight_bevel_bitmap")
	public static function bevelBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:flight._js.BitmapRegion, options:flight._js.BitmapBevelOptions):Void;
	@:native("flight_blur_bitmap_pixels_horizontal")
	public static function blurBitmapPixelsHorizontal(out:Dynamic, outLen:Int, source:Dynamic, sourceLen:Int, width:Int, height:Int, radius:Int):Void;
	@:native("flight_blur_bitmap_pixels_horizontal_weighted")
	public static function blurBitmapPixelsHorizontalWeighted(out:Dynamic, outLen:Int, source:Dynamic, sourceLen:Int, width:Int, height:Int, kernel:Dynamic, kernelLen:Int):Void;
	@:native("flight_blur_bitmap_pixels_vertical")
	public static function blurBitmapPixelsVertical(out:Dynamic, outLen:Int, source:Dynamic, sourceLen:Int, width:Int, height:Int, radius:Int):Void;
	@:native("flight_blur_bitmap_pixels_vertical_weighted")
	public static function blurBitmapPixelsVerticalWeighted(out:Dynamic, outLen:Int, source:Dynamic, sourceLen:Int, width:Int, height:Int, kernel:Dynamic, kernelLen:Int):Void;
	@:native("flight_box_blur_bitmap")
	public static function boxBlurBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:flight._js.BitmapRegion, options:flight._js.BitmapBoxBlurOptions):Void;
	@:native("flight_compute_gaussian_kernel")
	public static function computeGaussianKernel(out:Dynamic, outLen:Int, radius:Int, sigma:Float):Void;
	@:native("flight_gaussian_blur_bitmap")
	public static function gaussianBlurBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:flight._js.BitmapRegion, sigmaX:Float, sigmaY:Float, passes:Int):Void;
	@:native("flight_merge_bitmap_channels")
	public static function mergeBitmapChannels(out:flight._js.BitmapRegion, r:flight._js.BitmapRegion, g:flight._js.BitmapRegion, b:flight._js.BitmapRegion, a:flight._js.BitmapRegion):Void;
	@:native("flight_build_bitmap_brightness_color_matrix")
	public static function buildBitmapBrightnessColorMatrix(out:Dynamic, amount:Float):Void;
	@:native("flight_build_bitmap_contrast_color_matrix")
	public static function buildBitmapContrastColorMatrix(out:Dynamic, amount:Float):Void;
	@:native("flight_build_bitmap_grayscale_color_matrix")
	public static function buildBitmapGrayscaleColorMatrix(out:Dynamic):Void;
	@:native("flight_build_bitmap_hue_rotation_color_matrix")
	public static function buildBitmapHueRotationColorMatrix(out:Dynamic, degrees:Float):Void;
	@:native("flight_build_bitmap_invert_color_matrix")
	public static function buildBitmapInvertColorMatrix(out:Dynamic):Void;
	@:native("flight_build_bitmap_saturation_color_matrix")
	public static function buildBitmapSaturationColorMatrix(out:Dynamic, amount:Float):Void;
	@:native("flight_build_bitmap_sepia_color_matrix")
	public static function buildBitmapSepiaColorMatrix(out:Dynamic):Void;
	@:native("flight_color_matrix_bitmap")
	public static function colorMatrixBitmap(out:Dynamic, outLen:Int, source:flight._js.BitmapRegion, matrix:Dynamic, matrixLen:Int):Void;
	@:native("flight_concat_bitmap_color_matrix")
	public static function concatBitmapColorMatrix(out:Dynamic, first:Dynamic, second:Dynamic):Void;
	@:native("flight_set_bitmap_color_matrix_identity")
	public static function setBitmapColorMatrixIdentity(out:Dynamic):Void;
	@:native("flight_compare_bitmap")
	public static function compareBitmap(source:flight._js.Bitmap, other:flight._js.Bitmap):Dynamic;
	@:native("flight_get_bitmap_mismatch")
	public static function getBitmapMismatch(source:flight._js.Bitmap, other:flight._js.Bitmap, channelTolerance:Int):flight._js.BitmapMismatch;
	@:native("flight_composite_bitmap_pixels")
	public static function compositeBitmapPixels(dest:flight._js.BitmapRegion, pixels:Dynamic, pixelsLen:Int, mode:flight._js.BitmapCompositeMode):Void;
	@:native("flight_composite_bitmap_region")
	public static function compositeBitmapRegion(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, mode:flight._js.BitmapCompositeMode):Void;
	@:native("flight_extract_bitmap_pixels")
	public static function extractBitmapPixels(out:Dynamic, outLen:Int, source:flight._js.BitmapRegion):Void;
	@:native("flight_extract_bitmap_pixels32")
	public static function extractBitmapPixels32(out:Dynamic, outLen:Int, source:flight._js.BitmapRegion):Void;
	@:native("flight_write_bitmap_pixels")
	public static function writeBitmapPixels(dest:flight._js.BitmapRegion, pixels:Dynamic, pixelsLen:Int):Void;
	@:native("flight_write_bitmap_pixels32")
	public static function writeBitmapPixels32(dest:flight._js.BitmapRegion, pixels:Dynamic, pixelsLen:Int):Void;
	@:native("flight_convolve_bitmap")
	public static function convolveBitmap(out:Dynamic, outLen:Int, source:flight._js.BitmapRegion, options:flight._js.BitmapConvolutionOptions):Void;
	@:native("flight_copy_bitmap_channel")
	public static function copyBitmapChannel(dest:flight._js.BitmapRegion, destChannel:flight._js.ImageChannel, source:flight._js.BitmapRegion, sourceChannel:flight._js.ImageChannel):Void;
	@:native("flight_copy_bitmap_pixels")
	public static function copyBitmapPixels(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, composite:Bool):Void;
	@:native("flight_get_bitmap_coverage")
	public static function getBitmapCoverage(source:flight._js.Bitmap, backgroundColor:Int, channelTolerance:Int):Float;
	@:native("flight_extend_bitmap")
	public static function extendBitmap(source:flight._js.Bitmap, left:Int, top:Int, right:Int, bottom:Int, edgeMode:Int, fillColor:Int):flight._js.Bitmap;
	@:native("flight_trim_bitmap")
	public static function trimBitmap(source:flight._js.Bitmap):flight._js.Bitmap;
	@:native("flight_displace_bitmap")
	public static function displaceBitmap(out:Dynamic, outLen:Int, source:flight._js.BitmapRegion, options:flight._js.BitmapDisplacementMapOptions):Void;
	@:native("flight_dissolve_bitmap_pixels")
	public static function dissolveBitmapPixels(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, seed:Int, pixelCount:Int, fillColor:Int):Int;
	@:native("flight_encode_bitmap")
	public static function encodeBitmap(hostBitmapEncode:flight._js.HostBitmapEncodeCapability, source:flight._js.Bitmap, format:Int, quality:Float):Dynamic;
	@:native("flight_explain_bitmap_encode_failure")
	public static function explainBitmapEncodeFailure(hostBitmapEncode:flight._js.HostBitmapEncodeCapability, format:Int):Dynamic;
	@:native("flight_fill_bitmap_rectangle")
	public static function fillBitmapRectangle(dest:flight._js.BitmapRegion, color:Int):Void;
	@:native("flight_flood_fill_bitmap")
	public static function floodFillBitmap(out:flight._js.Bitmap, x:Int, y:Int, color:Int):Void;
	@:native("flight_create_bitmap_fingerprint")
	public static function createBitmapFingerprint(source:flight._js.Bitmap, gridSize:Int):flight._js.BitmapFingerprint;
	@:native("flight_compare_bitmap_fingerprints")
	public static function compareBitmapFingerprints(a:flight._js.BitmapFingerprint, b:flight._js.BitmapFingerprint):Float;
	@:native("flight_format_bitmap_fingerprint")
	public static function formatBitmapFingerprint(fingerprint:flight._js.BitmapFingerprint):String;
	@:native("flight_parse_bitmap_fingerprint")
	public static function parseBitmapFingerprint(text:String):Dynamic;
	@:native("flight_flip_bitmap_horizontal")
	public static function flipBitmapHorizontal(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion):Void;
	@:native("flight_flip_bitmap_vertical")
	public static function flipBitmapVertical(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion):Void;
	@:native("flight_convert_bitmap_pixel_order")
	public static function convertBitmapPixelOrder(out:Dynamic, outLen:Int, source:Dynamic, sourceLen:Int, length:Int, from:Int, to:Int):Void;
	@:native("flight_premultiply_bitmap_pixels")
	public static function premultiplyBitmapPixels(out:Dynamic, outLen:Int, source:Dynamic, sourceLen:Int, length:Int):Void;
	@:native("flight_unpremultiply_bitmap_pixels")
	public static function unpremultiplyBitmapPixels(out:Dynamic, outLen:Int, source:Dynamic, sourceLen:Int, length:Int):Void;
	@:native("flight_build_bitmap_gradient_ramp")
	public static function buildBitmapGradientRamp(out:Dynamic, outLen:Int, colors:Dynamic, colorsLen:Int, alphas:Dynamic, alphasLen:Int, ratios:Dynamic, ratiosLen:Int):Void;
	@:native("flight_gradient_bevel_bitmap")
	public static function gradientBevelBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:flight._js.BitmapRegion, ramp:Dynamic, rampLen:Int, options:flight._js.BitmapGradientBevelOptions):Void;
	@:native("flight_gradient_glow_bitmap")
	public static function gradientGlowBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:flight._js.BitmapRegion, ramp:Dynamic, rampLen:Int, options:flight._js.BitmapGradientGlowOptions):Void;
	@:native("flight_fill_bitmap_linear_gradient")
	public static function fillBitmapLinearGradient(dest:flight._js.BitmapRegion, ramp:Dynamic, rampLen:Int, x0:Float, y0:Float, x1:Float, y1:Float, spread:Int):Void;
	@:native("flight_fill_bitmap_radial_gradient")
	public static function fillBitmapRadialGradient(dest:flight._js.BitmapRegion, ramp:Dynamic, rampLen:Int, cx:Float, cy:Float, radius:Float, focalX:Float, focalY:Float, spread:Int):Void;
	@:native("flight_equalize_bitmap_histogram")
	public static function equalizeBitmapHistogram(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion):Void;
	@:native("flight_get_bitmap_histogram")
	public static function getBitmapHistogram(source:flight._js.BitmapRegion):flight._js.BitmapHistogram;
	@:native("flight_median_bitmap")
	public static function medianBitmap(out:Dynamic, outLen:Int, source:flight._js.BitmapRegion, radius:Int):Void;
	@:native("flight_dilate_bitmap")
	public static function dilateBitmap(out:Dynamic, outLen:Int, source:flight._js.BitmapRegion, radius:Int):Void;
	@:native("flight_erode_bitmap")
	public static function erodeBitmap(out:Dynamic, outLen:Int, source:flight._js.BitmapRegion, radius:Int):Void;
	@:native("flight_fill_bitmap_noise")
	public static function fillBitmapNoise(dest:flight._js.BitmapRegion, seed:Int, low:Int, high:Int, grayScale:Bool):Void;
	@:native("flight_fill_bitmap_perlin_noise")
	public static function fillBitmapPerlinNoise(dest:flight._js.BitmapRegion, baseX:Float, baseY:Float, octaves:Int, seed:Int, grayScale:Bool, stitch:Bool, channelOptions:Int):Void;
	@:native("flight_fill_bitmap_turbulence")
	public static function fillBitmapTurbulence(dest:flight._js.BitmapRegion, baseX:Float, baseY:Float, octaves:Int, seed:Int, grayScale:Bool, stitch:Bool, channelOptions:Int):Void;
	@:native("flight_apply_bitmap_palette_map")
	public static function applyBitmapPaletteMap(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, redMap:Dynamic, redMapLen:Int, greenMap:Dynamic, greenMapLen:Int, blueMap:Dynamic, blueMapLen:Int, alphaMap:Dynamic, alphaMapLen:Int):Void;
	@:native("flight_get_bitmap_pixel")
	public static function getBitmapPixel(source:flight._js.Bitmap, x:Int, y:Int):Int;
	@:native("flight_get_bitmap_pixel_channel")
	public static function getBitmapPixelChannel(source:flight._js.Bitmap, x:Int, y:Int, channel:flight._js.ImageChannel):Int;
	@:native("flight_get_bitmap_pixel_luminance")
	public static function getBitmapPixelLuminance(source:flight._js.Bitmap, x:Int, y:Int):Int;
	@:native("flight_get_bitmap_pixel_rgb")
	public static function getBitmapPixelRgb(source:flight._js.Bitmap, x:Int, y:Int):Int;
	@:native("flight_set_bitmap_pixel")
	public static function setBitmapPixel(out:flight._js.Bitmap, x:Int, y:Int, color:Int):Void;
	@:native("flight_set_bitmap_pixel_rgb")
	public static function setBitmapPixelRgb(out:flight._js.Bitmap, x:Int, y:Int, color:Int):Void;
	@:native("flight_to_clamped_u8")
	public static function toClampedU8(value:Float):Int;
	@:native("flight_pixelate_bitmap")
	public static function pixelateBitmap(out:Dynamic, outLen:Int, source:flight._js.BitmapRegion, blockSize:Int):Void;
	@:native("flight_create_bitmap_region")
	public static function createBitmapRegion(bitmap:flight._js.Bitmap, x:Int, y:Int, width:Int, height:Int):flight._js.BitmapRegion;
	@:native("flight_set_bitmap_region")
	public static function setBitmapRegion(out:flight._js.BitmapRegion, bitmap:flight._js.Bitmap, x:Int, y:Int, width:Int, height:Int):Void;
	@:native("flight_resize_bitmap")
	public static function resizeBitmap(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, mode:Int, edgeMode:Int, premultiplied:Bool):Void;
	@:native("flight_rotate_bitmap")
	public static function rotateBitmap(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, angle:Float, pivotX:Float, pivotY:Float, edgeMode:Int, sampleMode:Int):Void;
	@:native("flight_rotate_bitmap_180")
	public static function rotateBitmap180(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion):Void;
	@:native("flight_rotate_bitmap_clockwise")
	public static function rotateBitmapClockwise(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion):Void;
	@:native("flight_rotate_bitmap_counter_clockwise")
	public static function rotateBitmapCounterClockwise(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion):Void;
	@:native("flight_drop_shadow_bitmap")
	public static function dropShadowBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:flight._js.BitmapRegion, options:flight._js.BitmapDropShadowOptions):Void;
	@:native("flight_glow_bitmap")
	public static function glowBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:flight._js.BitmapRegion, options:flight._js.BitmapGlowOptions):Void;
	@:native("flight_inner_glow_bitmap")
	public static function innerGlowBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:flight._js.BitmapRegion, options:flight._js.BitmapInnerGlowOptions):Void;
	@:native("flight_inner_shadow_bitmap")
	public static function innerShadowBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:flight._js.BitmapRegion, options:flight._js.BitmapInnerShadowOptions):Void;
	@:native("flight_sharpen_bitmap")
	public static function sharpenBitmap(out:Dynamic, outLen:Int, scratch:Dynamic, scratchLen:Int, source:flight._js.BitmapRegion, options:flight._js.BitmapSharpenOptions):Void;
	@:native("flight_apply_bitmap_curve")
	public static function applyBitmapCurve(out:flight._js.BitmapRegion, source:flight._js.BitmapRegion, redLut:Dynamic, redLutLen:Int, greenLut:Dynamic, greenLutLen:Int, blueLut:Dynamic, blueLutLen:Int, alphaLut:Dynamic, alphaLutLen:Int):Void;
	@:native("flight_apply_bitmap_levels")
	public static function applyBitmapLevels(out:flight._js.BitmapRegion, source:flight._js.BitmapRegion, blackPoint:Float, whitePoint:Float, gamma:Float):Void;
	@:native("flight_apply_bitmap_color_scale_bias")
	public static function applyBitmapColorScaleBias(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, ct:flight._js.ColorScaleBias):Void;
	@:native("flight_apply_bitmap_threshold")
	public static function applyBitmapThreshold(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, operation:Int, thresholdValue:Int, color:Int, mask:Int, copySource:Bool):Int;
	@:native("flight_merge_bitmap")
	public static function mergeBitmap(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, redScale:Float, greenScale:Float, blueScale:Float, alphaScale:Float):Void;
	@:native("flight_scroll_bitmap")
	public static function scrollBitmap(out:flight._js.Bitmap, dx:Int, dy:Int):Void;
	@:native("flight_warp_bitmap")
	public static function warpBitmap(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, matrix:Dynamic, edgeMode:Int, sampleMode:Int):Void;
	@:native("flight_warp_bitmap_quad")
	public static function warpBitmapQuad(dest:flight._js.BitmapRegion, source:flight._js.BitmapRegion, dstQuad:Dynamic, edgeMode:Int, sampleMode:Int):Void;
	@:native("flight_free_bitmap")
	public static function freeBitmap(ptr:flight._js.Bitmap):Void;
	@:native("flight_free_bitmap_mismatch")
	public static function freeBitmapMismatch(ptr:flight._js.BitmapMismatch):Void;
	@:native("flight_free_bitmap_encode_failure_explanation")
	public static function freeBitmapEncodeFailureExplanation(ptr:flight._js.BitmapEncodeFailureExplanation):Void;
	@:native("flight_free_bitmap_fingerprint")
	public static function freeBitmapFingerprint(ptr:flight._js.BitmapFingerprint):Void;
	@:native("flight_free_bitmap_histogram")
	public static function freeBitmapHistogram(ptr:flight._js.BitmapHistogram):Void;
	@:native("flight_free_bitmap_region")
	public static function freeBitmapRegion(ptr:flight._js.BitmapRegion):Void;
}
