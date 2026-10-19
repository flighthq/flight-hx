// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._fn;

#if cpp
import flight.*;
@:buildXml('
<error value="flight_cpp_root must name the pinned or installed flight-cpp root" unless="flight_cpp_root" />
<error value="flight_hx_root must name the flight-hx package root" unless="flight_hx_root" />
<set name="NO_PRECOMPILED_HEADERS" value="1" />
<set name="HXCPP_NO_CPP11" value="1" />
<unset name="HXCPP_CPP11" />
<files id="haxe">
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/bitmap.cpp" />
  <compilerflag value="/std:c++20" if="windows" />
  <compilerflag value="-std=c++20" unless="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/overrides/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/generated/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_hx_root}/src-cpp/include" if="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/overrides/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/generated/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_hx_root}/src-cpp/include" unless="windows" />
</files>
')
@:include("flight_hx/bitmap.hpp")
extern class Bitmap {
  @:native("flight_hx::bitmap::build_bitmap_brightness_color_matrix")
  static function buildBitmapBrightnessColorMatrix(out:Array<Float>, amount:Float):Void;

  @:native("flight_hx::bitmap::build_bitmap_contrast_color_matrix")
  static function buildBitmapContrastColorMatrix(out:Array<Float>, amount:Float):Void;

  @:native("flight_hx::bitmap::build_bitmap_grayscale_color_matrix")
  static function buildBitmapGrayscaleColorMatrix(out:Array<Float>):Void;

  @:native("flight_hx::bitmap::build_bitmap_hue_rotation_color_matrix")
  static function buildBitmapHueRotationColorMatrix(out:Array<Float>, degrees:Float):Void;

  @:native("flight_hx::bitmap::build_bitmap_invert_color_matrix")
  static function buildBitmapInvertColorMatrix(out:Array<Float>):Void;

  @:native("flight_hx::bitmap::build_bitmap_saturation_color_matrix")
  static function buildBitmapSaturationColorMatrix(out:Array<Float>, amount:Float):Void;

  @:native("flight_hx::bitmap::build_bitmap_sepia_color_matrix")
  static function buildBitmapSepiaColorMatrix(out:Array<Float>):Void;

  @:native("flight_hx::bitmap::concat_bitmap_color_matrix")
  static function concatBitmapColorMatrix(out:Array<Float>, first:Array<Float>, second:Array<Float>):Void;

  @:native("flight_hx::bitmap::set_bitmap_color_matrix_identity")
  static function setBitmapColorMatrixIdentity(out:Array<Float>):Void;

  @:native("flight_hx::bitmap::apply_bitmap_levels")
  static function applyBitmapLevels(out:flight.BitmapRegion, source:flight.BitmapRegion, blackPointPresent:Bool, blackPoint:Float, whitePointPresent:Bool, whitePoint:Float, gammaPresent:Bool, gamma:Float):Void;

  @:native("flight_hx::bitmap::clone_bitmap")
  static function cloneBitmap(source:flight.Bitmap):flight.Bitmap;

  @:native("flight_hx::bitmap::copy_bitmap_alpha")
  static function copyBitmapAlpha(dest:flight.BitmapRegion, source:flight.BitmapRegion):Void;

  @:native("flight_hx::bitmap::copy_bitmap_pixels")
  static function copyBitmapPixels(dest:flight.BitmapRegion, source:flight.BitmapRegion, compositePresent:Bool, composite:Bool):Void;

  @:native("flight_hx::bitmap::create_bitmap")
  static function createBitmap(width:Float, height:Float, colorPresent:Bool, color:Float):flight.Bitmap;

  @:native("flight_hx::bitmap::create_bitmap_region")
  static function createBitmapRegion(bitmap:flight.Bitmap, xPresent:Bool, x:Float, yPresent:Bool, y:Float, widthPresent:Bool, width:Float, heightPresent:Bool, height:Float):flight.BitmapRegion;

  @:native("flight_hx::bitmap::dissolve_bitmap_pixels")
  static function dissolveBitmapPixels(dest:flight.BitmapRegion, source:flight.BitmapRegion, seed:Float, pixelCount:Float, fillColorPresent:Bool, fillColor:Float):Float;

  @:native("flight_hx::bitmap::equalize_bitmap_histogram")
  static function equalizeBitmapHistogram(dest:flight.BitmapRegion, source:flight.BitmapRegion):Void;

  @:native("flight_hx::bitmap::fill_bitmap_noise")
  static function fillBitmapNoise(dest:flight.BitmapRegion, seed:Float, lowPresent:Bool, low:Float, highPresent:Bool, high:Float, grayScalePresent:Bool, grayScale:Bool):Void;

  @:native("flight_hx::bitmap::fill_bitmap_perlin_noise")
  static function fillBitmapPerlinNoise(dest:flight.BitmapRegion, baseX:Float, baseY:Float, octaves:Float, seed:Float, grayScalePresent:Bool, grayScale:Bool, stitchPresent:Bool, stitch:Bool, channelOptionsPresent:Bool, channelOptions:Float):Void;

  @:native("flight_hx::bitmap::fill_bitmap_rectangle")
  static function fillBitmapRectangle(dest:flight.BitmapRegion, color:Float):Void;

  @:native("flight_hx::bitmap::fill_bitmap_turbulence")
  static function fillBitmapTurbulence(dest:flight.BitmapRegion, baseX:Float, baseY:Float, octaves:Float, seed:Float, grayScalePresent:Bool, grayScale:Bool, stitchPresent:Bool, stitch:Bool, channelOptionsPresent:Bool, channelOptions:Float):Void;

  @:native("flight_hx::bitmap::flip_bitmap_horizontal")
  static function flipBitmapHorizontal(dest:flight.BitmapRegion, source:flight.BitmapRegion):Void;

  @:native("flight_hx::bitmap::flip_bitmap_vertical")
  static function flipBitmapVertical(dest:flight.BitmapRegion, source:flight.BitmapRegion):Void;

  @:native("flight_hx::bitmap::flood_fill_bitmap")
  static function floodFillBitmap(out:flight.Bitmap, x:Float, y:Float, color:Float):Void;

  @:native("flight_hx::bitmap::get_bitmap_coverage")
  static function getBitmapCoverage(source:flight.Bitmap, backgroundColor:Float, channelTolerancePresent:Bool, channelTolerance:Float):Float;

  @:native("flight_hx::bitmap::get_bitmap_pixel")
  static function getBitmapPixel(source:flight.Bitmap, x:Float, y:Float):Float;

  @:native("flight_hx::bitmap::get_bitmap_pixel_luminance")
  static function getBitmapPixelLuminance(source:flight.Bitmap, x:Float, y:Float):Float;

  @:native("flight_hx::bitmap::get_bitmap_pixel_rgb")
  static function getBitmapPixelRgb(source:flight.Bitmap, x:Float, y:Float):Float;

  @:native("flight_hx::bitmap::invalidate_bitmap")
  static function invalidateBitmap(bitmap:flight.Bitmap):Void;

  @:native("flight_hx::bitmap::merge_bitmap")
  static function mergeBitmap(dest:flight.BitmapRegion, source:flight.BitmapRegion, redScale:Float, greenScale:Float, blueScale:Float, alphaScale:Float):Void;

  @:native("flight_hx::bitmap::merge_bitmap_channels")
  static function mergeBitmapChannels(out:flight.BitmapRegion, r:flight.BitmapRegion, g:flight.BitmapRegion, b:flight.BitmapRegion, a:flight.BitmapRegion):Void;

  @:native("flight_hx::bitmap::multiply_bitmap_alpha")
  static function multiplyBitmapAlpha(out:flight.BitmapRegion, factor:Float):Void;

  @:native("flight_hx::bitmap::rotate_bitmap180")
  static function rotateBitmap180(dest:flight.BitmapRegion, source:flight.BitmapRegion):Void;

  @:native("flight_hx::bitmap::rotate_bitmap_clockwise")
  static function rotateBitmapClockwise(dest:flight.BitmapRegion, source:flight.BitmapRegion):Void;

  @:native("flight_hx::bitmap::rotate_bitmap_counter_clockwise")
  static function rotateBitmapCounterClockwise(dest:flight.BitmapRegion, source:flight.BitmapRegion):Void;

  @:native("flight_hx::bitmap::scroll_bitmap")
  static function scrollBitmap(out:flight.Bitmap, dx:Float, dy:Float):Void;

  @:native("flight_hx::bitmap::set_bitmap_alpha")
  static function setBitmapAlpha(out:flight.BitmapRegion, alpha:Float):Void;

  @:native("flight_hx::bitmap::set_bitmap_pixel")
  static function setBitmapPixel(out:flight.Bitmap, x:Float, y:Float, color:Float):Void;

  @:native("flight_hx::bitmap::set_bitmap_pixel_rgb")
  static function setBitmapPixelRgb(out:flight.Bitmap, x:Float, y:Float, color:Float):Void;

  @:native("flight_hx::bitmap::set_bitmap_region")
  static function setBitmapRegion(out:flight.BitmapRegion, bitmap:flight.Bitmap, xPresent:Bool, x:Float, yPresent:Bool, y:Float, widthPresent:Bool, width:Float, heightPresent:Bool, height:Float):flight.BitmapRegion;

  @:native("flight_hx::bitmap::trim_bitmap")
  static function trimBitmap(source:flight.Bitmap):flight.Bitmap;

  @:native("flight_hx::bitmap::compare_bitmap_fingerprints")
  static function compareBitmapFingerprints(a:flight.BitmapFingerprint, b:flight.BitmapFingerprint):Float;

  @:native("flight_hx::bitmap::create_bitmap_fingerprint")
  static function createBitmapFingerprint(source:flight.Bitmap, gridSizePresent:Bool, gridSize:Float):flight.BitmapFingerprint;

  @:native("flight_hx::bitmap::get_bitmap_histogram")
  static function getBitmapHistogram(source:flight.BitmapRegion):flight.BitmapHistogram;

  @:native("flight_hx::bitmap::compare_bitmap")
  static function compareBitmap(source:flight.Bitmap, other:flight.Bitmap):Null<flight.Bitmap>;

  @:native("flight_hx::bitmap::format_bitmap_fingerprint")
  static function formatBitmapFingerprint(fingerprint:flight.BitmapFingerprint):String;

  @:native("flight_hx::bitmap::parse_bitmap_fingerprint")
  static function parseBitmapFingerprint(text:String):Null<flight.BitmapFingerprint>;
}
#end
