package flight._hl._fn;

extern class Bitmap {
	@:hlNative("flight", "flight_create_bitmap")
	public static function createBitmap(width:Int, height:Int, color:haxe.Int64):flight._hl.Bitmap;
	@:hlNative("flight", "flight_clone_bitmap")
	public static function cloneBitmap(source:flight._hl.Bitmap):flight._hl.Bitmap;
	@:hlNative("flight", "flight_convert_bitmap_alpha_type")
	public static function convertBitmapAlphaType(out:flight._hl.Bitmap, target:Int):Void;
	@:hlNative("flight", "flight_invalidate_bitmap")
	public static function invalidateBitmap(bitmap:flight._hl.Bitmap):Void;
	@:hlNative("flight", "flight_transform_bitmap")
	public static function transformBitmap(dest:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion, matrix:hl.Bytes, edgeMode:Int, sampleMode:Int):Void;
	@:hlNative("flight", "flight_copy_bitmap_alpha")
	public static function copyBitmapAlpha(dest:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion):Void;
	@:hlNative("flight", "flight_multiply_bitmap_alpha")
	public static function multiplyBitmapAlpha(out:flight._hl.BitmapRegion, factor:Single):Void;
	@:hlNative("flight", "flight_set_bitmap_alpha")
	public static function setBitmapAlpha(out:flight._hl.BitmapRegion, alpha:Single):Void;
	@:hlNative("flight", "flight_bevel_bitmap")
	public static function bevelBitmap(out:hl.Bytes, outLen:Int, scratch:hl.Bytes, scratchLen:Int, source:flight._hl.BitmapRegion, options:flight._hl.BitmapBevelOptions):Void;
	@:hlNative("flight", "flight_blur_bitmap_pixels_horizontal")
	public static function blurBitmapPixelsHorizontal(out:hl.Bytes, outLen:Int, source:hl.Bytes, sourceLen:Int, width:Int, height:Int, radius:Int):Void;
	@:hlNative("flight", "flight_blur_bitmap_pixels_horizontal_weighted")
	public static function blurBitmapPixelsHorizontalWeighted(out:hl.Bytes, outLen:Int, source:hl.Bytes, sourceLen:Int, width:Int, height:Int, kernel:hl.Bytes, kernelLen:Int):Void;
	@:hlNative("flight", "flight_blur_bitmap_pixels_vertical")
	public static function blurBitmapPixelsVertical(out:hl.Bytes, outLen:Int, source:hl.Bytes, sourceLen:Int, width:Int, height:Int, radius:Int):Void;
	@:hlNative("flight", "flight_blur_bitmap_pixels_vertical_weighted")
	public static function blurBitmapPixelsVerticalWeighted(out:hl.Bytes, outLen:Int, source:hl.Bytes, sourceLen:Int, width:Int, height:Int, kernel:hl.Bytes, kernelLen:Int):Void;
	@:hlNative("flight", "flight_box_blur_bitmap")
	public static function boxBlurBitmap(out:hl.Bytes, outLen:Int, scratch:hl.Bytes, scratchLen:Int, source:flight._hl.BitmapRegion, options:flight._hl.BitmapBoxBlurOptions):Void;
	@:hlNative("flight", "flight_compute_gaussian_kernel")
	public static function computeGaussianKernel(out:hl.Bytes, outLen:Int, radius:Int, sigma:Single):Void;
	@:hlNative("flight", "flight_gaussian_blur_bitmap")
	public static function gaussianBlurBitmap(out:hl.Bytes, outLen:Int, scratch:hl.Bytes, scratchLen:Int, source:flight._hl.BitmapRegion, sigmaX:Single, sigmaY:Single, passes:Int):Void;
	@:hlNative("flight", "flight_merge_bitmap_channels")
	public static function mergeBitmapChannels(out:flight._hl.BitmapRegion, r:flight._hl.BitmapRegion, g:flight._hl.BitmapRegion, b:flight._hl.BitmapRegion, a:flight._hl.BitmapRegion):Void;
	@:hlNative("flight", "flight_build_bitmap_brightness_color_matrix")
	public static function buildBitmapBrightnessColorMatrix(out:hl.Bytes, amount:Single):Void;
	@:hlNative("flight", "flight_build_bitmap_contrast_color_matrix")
	public static function buildBitmapContrastColorMatrix(out:hl.Bytes, amount:Single):Void;
	@:hlNative("flight", "flight_build_bitmap_grayscale_color_matrix")
	public static function buildBitmapGrayscaleColorMatrix(out:hl.Bytes):Void;
	@:hlNative("flight", "flight_build_bitmap_hue_rotation_color_matrix")
	public static function buildBitmapHueRotationColorMatrix(out:hl.Bytes, degrees:Single):Void;
	@:hlNative("flight", "flight_build_bitmap_invert_color_matrix")
	public static function buildBitmapInvertColorMatrix(out:hl.Bytes):Void;
	@:hlNative("flight", "flight_build_bitmap_saturation_color_matrix")
	public static function buildBitmapSaturationColorMatrix(out:hl.Bytes, amount:Single):Void;
	@:hlNative("flight", "flight_build_bitmap_sepia_color_matrix")
	public static function buildBitmapSepiaColorMatrix(out:hl.Bytes):Void;
	@:hlNative("flight", "flight_color_matrix_bitmap")
	public static function colorMatrixBitmap(out:hl.Bytes, outLen:Int, source:flight._hl.BitmapRegion, matrix:hl.Bytes, matrixLen:Int):Void;
	@:hlNative("flight", "flight_concat_bitmap_color_matrix")
	public static function concatBitmapColorMatrix(out:hl.Bytes, first:hl.Bytes, second:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_bitmap_color_matrix_identity")
	public static function setBitmapColorMatrixIdentity(out:hl.Bytes):Void;
	@:hlNative("flight", "flight_compare_bitmap")
	public static function compareBitmap(source:flight._hl.Bitmap, other:flight._hl.Bitmap):flight._hl.Bitmap;
	@:hlNative("flight", "flight_get_bitmap_mismatch")
	public static function getBitmapMismatch(source:flight._hl.Bitmap, other:flight._hl.Bitmap, channelTolerance:Int):flight._hl.BitmapMismatch;
	@:hlNative("flight", "flight_composite_bitmap_pixels")
	public static function compositeBitmapPixels(dest:flight._hl.BitmapRegion, pixels:hl.Bytes, pixelsLen:Int, mode:flight._hl.BitmapCompositeMode):Void;
	@:hlNative("flight", "flight_composite_bitmap_region")
	public static function compositeBitmapRegion(dest:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion, mode:flight._hl.BitmapCompositeMode):Void;
	@:hlNative("flight", "flight_extract_bitmap_pixels")
	public static function extractBitmapPixels(out:hl.Bytes, outLen:Int, source:flight._hl.BitmapRegion):Void;
	@:hlNative("flight", "flight_extract_bitmap_pixels32")
	public static function extractBitmapPixels32(out:hl.Bytes, outLen:Int, source:flight._hl.BitmapRegion):Void;
	@:hlNative("flight", "flight_write_bitmap_pixels")
	public static function writeBitmapPixels(dest:flight._hl.BitmapRegion, pixels:hl.Bytes, pixelsLen:Int):Void;
	@:hlNative("flight", "flight_write_bitmap_pixels32")
	public static function writeBitmapPixels32(dest:flight._hl.BitmapRegion, pixels:hl.Bytes, pixelsLen:Int):Void;
	@:hlNative("flight", "flight_convolve_bitmap")
	public static function convolveBitmap(out:hl.Bytes, outLen:Int, source:flight._hl.BitmapRegion, options:flight._hl.BitmapConvolutionOptions):Void;
	@:hlNative("flight", "flight_copy_bitmap_channel")
	public static function copyBitmapChannel(dest:flight._hl.BitmapRegion, destChannel:flight._hl.ImageChannel, source:flight._hl.BitmapRegion, sourceChannel:flight._hl.ImageChannel):Void;
	@:hlNative("flight", "flight_copy_bitmap_pixels")
	public static function copyBitmapPixels(dest:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion, composite:Bool):Void;
	@:hlNative("flight", "flight_get_bitmap_coverage")
	public static function getBitmapCoverage(source:flight._hl.Bitmap, backgroundColor:Int, channelTolerance:Int):Float;
	@:hlNative("flight", "flight_crop_bitmap")
	public static function cropBitmap(source:flight._hl.Bitmap, rect:flight._hl.Rectangle):flight._hl.Bitmap;
	@:hlNative("flight", "flight_extend_bitmap")
	public static function extendBitmap(source:flight._hl.Bitmap, left:Int, top:Int, right:Int, bottom:Int, edgeMode:Int, fillColor:Int):flight._hl.Bitmap;
	@:hlNative("flight", "flight_trim_bitmap")
	public static function trimBitmap(source:flight._hl.Bitmap):flight._hl.Bitmap;
	@:hlNative("flight", "flight_displace_bitmap")
	public static function displaceBitmap(out:hl.Bytes, outLen:Int, source:flight._hl.BitmapRegion, options:flight._hl.BitmapDisplacementMapOptions):Void;
	@:hlNative("flight", "flight_dissolve_bitmap_pixels")
	public static function dissolveBitmapPixels(dest:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion, seed:Int, pixelCount:Int, fillColor:Int):Int;
	@:hlNative("flight", "flight_encode_bitmap")
	public static function encodeBitmap(hostBitmapEncode:flight._hl.HostBitmapEncodeCapability, source:flight._hl.Bitmap, format:Int, quality:Single):Null<flight._hl.NativeByteBuffer>;
	@:hlNative("flight", "flight_explain_bitmap_encode_failure")
	public static function explainBitmapEncodeFailure(hostBitmapEncode:flight._hl.HostBitmapEncodeCapability, format:Int):flight._hl.BitmapEncodeFailureExplanation;
	@:hlNative("flight", "flight_fill_bitmap_rectangle")
	public static function fillBitmapRectangle(dest:flight._hl.BitmapRegion, color:Int):Void;
	@:hlNative("flight", "flight_flood_fill_bitmap")
	public static function floodFillBitmap(out:flight._hl.Bitmap, x:Int, y:Int, color:Int):Void;
	@:hlNative("flight", "flight_create_bitmap_fingerprint")
	public static function createBitmapFingerprint(source:flight._hl.Bitmap, gridSize:Int):flight._hl.BitmapFingerprint;
	@:hlNative("flight", "flight_compare_bitmap_fingerprints")
	public static function compareBitmapFingerprints(a:flight._hl.BitmapFingerprint, b:flight._hl.BitmapFingerprint):Float;
	@:hlNative("flight", "flight_format_bitmap_fingerprint")
	public static function formatBitmapFingerprint(fingerprint:flight._hl.BitmapFingerprint):hl.Bytes;
	@:hlNative("flight", "flight_parse_bitmap_fingerprint")
	public static function parseBitmapFingerprint(text:hl.Bytes):flight._hl.BitmapFingerprint;
	@:hlNative("flight", "flight_flip_bitmap_horizontal")
	public static function flipBitmapHorizontal(dest:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion):Void;
	@:hlNative("flight", "flight_flip_bitmap_vertical")
	public static function flipBitmapVertical(dest:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion):Void;
	@:hlNative("flight", "flight_convert_bitmap_pixel_order")
	public static function convertBitmapPixelOrder(out:hl.Bytes, outLen:Int, source:hl.Bytes, sourceLen:Int, length:Int, from:Int, to:Int):Void;
	@:hlNative("flight", "flight_premultiply_bitmap_pixels")
	public static function premultiplyBitmapPixels(out:hl.Bytes, outLen:Int, source:hl.Bytes, sourceLen:Int, length:Int):Void;
	@:hlNative("flight", "flight_unpremultiply_bitmap_pixels")
	public static function unpremultiplyBitmapPixels(out:hl.Bytes, outLen:Int, source:hl.Bytes, sourceLen:Int, length:Int):Void;
	@:hlNative("flight", "flight_build_bitmap_gradient_ramp")
	public static function buildBitmapGradientRamp(out:hl.Bytes, outLen:Int, colors:hl.Bytes, colorsLen:Int, alphas:hl.Bytes, alphasLen:Int, ratios:hl.Bytes, ratiosLen:Int):Void;
	@:hlNative("flight", "flight_gradient_bevel_bitmap")
	public static function gradientBevelBitmap(out:hl.Bytes, outLen:Int, scratch:hl.Bytes, scratchLen:Int, source:flight._hl.BitmapRegion, ramp:hl.Bytes, rampLen:Int, options:flight._hl.BitmapGradientBevelOptions):Void;
	@:hlNative("flight", "flight_gradient_glow_bitmap")
	public static function gradientGlowBitmap(out:hl.Bytes, outLen:Int, scratch:hl.Bytes, scratchLen:Int, source:flight._hl.BitmapRegion, ramp:hl.Bytes, rampLen:Int, options:flight._hl.BitmapGradientGlowOptions):Void;
	@:hlNative("flight", "flight_fill_bitmap_linear_gradient")
	public static function fillBitmapLinearGradient(dest:flight._hl.BitmapRegion, ramp:hl.Bytes, rampLen:Int, x0:Single, y0:Single, x1:Single, y1:Single, spread:Int):Void;
	@:hlNative("flight", "flight_fill_bitmap_radial_gradient")
	public static function fillBitmapRadialGradient(dest:flight._hl.BitmapRegion, ramp:hl.Bytes, rampLen:Int, cx:Single, cy:Single, radius:Single, focalX:Single, focalY:Single, spread:Int):Void;
	@:hlNative("flight", "flight_equalize_bitmap_histogram")
	public static function equalizeBitmapHistogram(dest:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion):Void;
	@:hlNative("flight", "flight_get_bitmap_histogram")
	public static function getBitmapHistogram(source:flight._hl.BitmapRegion):flight._hl.BitmapHistogram;
	@:hlNative("flight", "flight_median_bitmap")
	public static function medianBitmap(out:hl.Bytes, outLen:Int, source:flight._hl.BitmapRegion, radius:Int):Void;
	@:hlNative("flight", "flight_dilate_bitmap")
	public static function dilateBitmap(out:hl.Bytes, outLen:Int, source:flight._hl.BitmapRegion, radius:Int):Void;
	@:hlNative("flight", "flight_erode_bitmap")
	public static function erodeBitmap(out:hl.Bytes, outLen:Int, source:flight._hl.BitmapRegion, radius:Int):Void;
	@:hlNative("flight", "flight_fill_bitmap_noise")
	public static function fillBitmapNoise(dest:flight._hl.BitmapRegion, seed:Int, low:Int, high:Int, grayScale:Bool):Void;
	@:hlNative("flight", "flight_fill_bitmap_perlin_noise")
	public static function fillBitmapPerlinNoise(dest:flight._hl.BitmapRegion, baseX:Float, baseY:Float, octaves:Int, seed:Int, grayScale:Bool, stitch:Bool, channelOptions:Int):Void;
	@:hlNative("flight", "flight_fill_bitmap_turbulence")
	public static function fillBitmapTurbulence(dest:flight._hl.BitmapRegion, baseX:Float, baseY:Float, octaves:Int, seed:Int, grayScale:Bool, stitch:Bool, channelOptions:Int):Void;
	@:hlNative("flight", "flight_apply_bitmap_palette_map")
	public static function applyBitmapPaletteMap(dest:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion, redMap:hl.Bytes, redMapLen:Int, greenMap:hl.Bytes, greenMapLen:Int, blueMap:hl.Bytes, blueMapLen:Int, alphaMap:hl.Bytes, alphaMapLen:Int):Void;
	@:hlNative("flight", "flight_get_bitmap_pixel")
	public static function getBitmapPixel(source:flight._hl.Bitmap, x:Int, y:Int):Int;
	@:hlNative("flight", "flight_get_bitmap_pixel_channel")
	public static function getBitmapPixelChannel(source:flight._hl.Bitmap, x:Int, y:Int, channel:flight._hl.ImageChannel):Int;
	@:hlNative("flight", "flight_get_bitmap_pixel_luminance")
	public static function getBitmapPixelLuminance(source:flight._hl.Bitmap, x:Int, y:Int):Int;
	@:hlNative("flight", "flight_get_bitmap_pixel_rgb")
	public static function getBitmapPixelRgb(source:flight._hl.Bitmap, x:Int, y:Int):Int;
	@:hlNative("flight", "flight_set_bitmap_pixel")
	public static function setBitmapPixel(out:flight._hl.Bitmap, x:Int, y:Int, color:Int):Void;
	@:hlNative("flight", "flight_set_bitmap_pixel_rgb")
	public static function setBitmapPixelRgb(out:flight._hl.Bitmap, x:Int, y:Int, color:Int):Void;
	@:hlNative("flight", "flight_pixelate_bitmap")
	public static function pixelateBitmap(out:hl.Bytes, outLen:Int, source:flight._hl.BitmapRegion, blockSize:Int):Void;
	@:hlNative("flight", "flight_get_bitmap_color_bounds_rectangle")
	public static function getBitmapColorBoundsRectangle(source:flight._hl.BitmapRegion, mask:Int, color:Int, findColor:Bool):flight._hl.Rectangle;
	@:hlNative("flight", "flight_create_bitmap_region")
	public static function createBitmapRegion(bitmap:flight._hl.Bitmap, x:Int, y:Int, width:Int, height:Int):flight._hl.BitmapRegion;
	@:hlNative("flight", "flight_set_bitmap_region")
	public static function setBitmapRegion(out:flight._hl.BitmapRegion, bitmap:flight._hl.Bitmap, x:Int, y:Int, width:Int, height:Int):Void;
	@:hlNative("flight", "flight_resize_bitmap")
	public static function resizeBitmap(dest:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion, mode:Int, edgeMode:Int, premultiplied:Bool):Void;
	@:hlNative("flight", "flight_rotate_bitmap")
	public static function rotateBitmap(dest:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion, angle:Float, pivotX:Float, pivotY:Float, edgeMode:Int, sampleMode:Int):Void;
	@:hlNative("flight", "flight_rotate_bitmap_180")
	public static function rotateBitmap180(dest:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion):Void;
	@:hlNative("flight", "flight_rotate_bitmap_clockwise")
	public static function rotateBitmapClockwise(dest:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion):Void;
	@:hlNative("flight", "flight_rotate_bitmap_counter_clockwise")
	public static function rotateBitmapCounterClockwise(dest:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion):Void;
	@:hlNative("flight", "flight_drop_shadow_bitmap")
	public static function dropShadowBitmap(out:hl.Bytes, outLen:Int, scratch:hl.Bytes, scratchLen:Int, source:flight._hl.BitmapRegion, options:flight._hl.BitmapDropShadowOptions):Void;
	@:hlNative("flight", "flight_glow_bitmap")
	public static function glowBitmap(out:hl.Bytes, outLen:Int, scratch:hl.Bytes, scratchLen:Int, source:flight._hl.BitmapRegion, options:flight._hl.BitmapGlowOptions):Void;
	@:hlNative("flight", "flight_inner_glow_bitmap")
	public static function innerGlowBitmap(out:hl.Bytes, outLen:Int, scratch:hl.Bytes, scratchLen:Int, source:flight._hl.BitmapRegion, options:flight._hl.BitmapInnerGlowOptions):Void;
	@:hlNative("flight", "flight_inner_shadow_bitmap")
	public static function innerShadowBitmap(out:hl.Bytes, outLen:Int, scratch:hl.Bytes, scratchLen:Int, source:flight._hl.BitmapRegion, options:flight._hl.BitmapInnerShadowOptions):Void;
	@:hlNative("flight", "flight_sharpen_bitmap")
	public static function sharpenBitmap(out:hl.Bytes, outLen:Int, scratch:hl.Bytes, scratchLen:Int, source:flight._hl.BitmapRegion, options:flight._hl.BitmapSharpenOptions):Void;
	@:hlNative("flight", "flight_apply_bitmap_curve")
	public static function applyBitmapCurve(out:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion, redLut:hl.Bytes, redLutLen:Int, greenLut:hl.Bytes, greenLutLen:Int, blueLut:hl.Bytes, blueLutLen:Int, alphaLut:hl.Bytes, alphaLutLen:Int):Void;
	@:hlNative("flight", "flight_apply_bitmap_levels")
	public static function applyBitmapLevels(out:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion, blackPoint:Single, whitePoint:Single, gamma:Single):Void;
	@:hlNative("flight", "flight_apply_bitmap_color_scale_bias")
	public static function applyBitmapColorScaleBias(dest:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion, ct:flight._hl.ColorScaleBias):Void;
	@:hlNative("flight", "flight_apply_bitmap_threshold")
	public static function applyBitmapThreshold(dest:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion, operation:Int, thresholdValue:Int, color:Int, mask:Int, copySource:Bool):Int;
	@:hlNative("flight", "flight_merge_bitmap")
	public static function mergeBitmap(dest:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion, redScale:Single, greenScale:Single, blueScale:Single, alphaScale:Single):Void;
	@:hlNative("flight", "flight_scroll_bitmap")
	public static function scrollBitmap(out:flight._hl.Bitmap, dx:Int, dy:Int):Void;
	@:hlNative("flight", "flight_warp_bitmap")
	public static function warpBitmap(dest:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion, matrix:hl.Bytes, edgeMode:Int, sampleMode:Int):Void;
	@:hlNative("flight", "flight_warp_bitmap_quad")
	public static function warpBitmapQuad(dest:flight._hl.BitmapRegion, source:flight._hl.BitmapRegion, dstQuad:hl.Bytes, edgeMode:Int, sampleMode:Int):Void;
	@:hlNative("flight", "flight_free_bitmap")
	public static function freeBitmap(ptr:flight._hl.Bitmap):Void;
	@:hlNative("flight", "flight_free_bitmap_mismatch")
	public static function freeBitmapMismatch(ptr:flight._hl.BitmapMismatch):Void;
	@:hlNative("flight", "flight_free_bitmap_encode_failure_explanation")
	public static function freeBitmapEncodeFailureExplanation(ptr:flight._hl.BitmapEncodeFailureExplanation):Void;
	@:hlNative("flight", "flight_free_bitmap_fingerprint")
	public static function freeBitmapFingerprint(ptr:flight._hl.BitmapFingerprint):Void;
	@:hlNative("flight", "flight_free_bitmap_histogram")
	public static function freeBitmapHistogram(ptr:flight._hl.BitmapHistogram):Void;
	@:hlNative("flight", "flight_free_bitmap_region")
	public static function freeBitmapRegion(ptr:flight._hl.BitmapRegion):Void;
}
