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
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/color.cpp" />
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/adapters/computeRgbHexString_a25cbb35.cpp" />
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/adapters/computeRgbaCssString_9aeb1c03.cpp" />
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
@:include("flight_hx/adapters/computeRgbHexString_a25cbb35.hpp")
@:include("flight_hx/adapters/computeRgbaCssString_9aeb1c03.hpp")
@:include("flight_hx/color.hpp")
extern class Color {
  @:native("flight_hx::color::color_from_kelvin")
  static function colorFromKelvin(kelvin:Float):Float;

  @:native("flight_hx::haxe::_cpp::computeRgbHexString_a25cbb35")
  static function computeRgbHexString(color:Float):String;

  @:native("flight_hx::haxe::_cpp::computeRgbaCssString_9aeb1c03")
  static function computeRgbaCssString(color:Float):String;

  @:native("flight_hx::color::get_color_alpha")
  static function getColorAlpha(color:Float):Float;

  @:native("flight_hx::color::get_color_contrast_ratio")
  static function getColorContrastRatio(a:Float, b:Float):Float;

  @:native("flight_hx::color::get_color_luminance")
  static function getColorLuminance(color:Float):Float;

  @:native("flight_hx::color::get_color_rgb")
  static function getColorRgb(color:Float):Float;

  @:native("flight_hx::color::lerp_color")
  static function lerpColor(start:Float, end:Float, t:Float):Float;

  @:native("flight_hx::color::linear_channel_to_srgb")
  static function linearChannelToSrgb(value:Float):Float;

  @:native("flight_hx::color::pack_color")
  static function packColor(r:Float, g:Float, b:Float, a:Float):Float;

  @:native("flight_hx::color::pack_opaque_color")
  static function packOpaqueColor(rgb:Float):Float;

  @:native("flight_hx::color::premultiply_color_alpha")
  static function premultiplyColorAlpha(color:Float):Float;

  @:native("flight_hx::color::set_color_alpha")
  static function setColorAlpha(color:Float, alpha:Float):Float;

  @:native("flight_hx::color::srgb_channel_to_linear")
  static function srgbChannelToLinear(value:Float):Float;

  @:native("flight_hx::color::unpremultiply_color_alpha")
  static function unpremultiplyColorAlpha(color:Float):Float;
}
#end
