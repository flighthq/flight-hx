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
}
#end
