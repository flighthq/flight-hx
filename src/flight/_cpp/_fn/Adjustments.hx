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
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/adjustments.cpp" />
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
@:include("flight_hx/adjustments.hpp")
extern class Adjustments {
  @:native("flight_hx::adjustments::apply_color_matrix_to_color")
  static function applyColorMatrixToColor(matrix:Array<Float>, packedRgba:Float):Float;

  @:native("flight_hx::adjustments::concat_color_matrix")
  static function concatColorMatrix(target:Array<Float>, source:Array<Float>):Void;

  @:native("flight_hx::adjustments::fuse_color_matrices")
  static function fuseColorMatrices(matrices:Array<Array<Float>>):Array<Float>;

  @:native("flight_hx::adjustments::create_brightness_color_matrix")
  static function createBrightnessColorMatrix(amount:Float):Array<Float>;

  @:native("flight_hx::adjustments::create_channel_mixer_color_matrix")
  static function createChannelMixerColorMatrix(redOut:Array<Float>, greenOut:Array<Float>, blueOut:Array<Float>):Array<Float>;

  @:native("flight_hx::adjustments::create_color_balance_color_matrix")
  static function createColorBalanceColorMatrix(shadows:Array<Float>, midtones:Array<Float>, highlights:Array<Float>):Array<Float>;

  @:native("flight_hx::adjustments::create_color_matrix_from_tint")
  static function createColorMatrixFromTint(packedRgba:Float, amount:Float):Array<Float>;

  @:native("flight_hx::adjustments::create_contrast_color_matrix")
  static function createContrastColorMatrix(amount:Float):Array<Float>;

  @:native("flight_hx::adjustments::create_desaturate_color_matrix")
  static function createDesaturateColorMatrix(amount:Float):Array<Float>;

  @:native("flight_hx::adjustments::create_grayscale_color_matrix")
  static function createGrayscaleColorMatrix():Array<Float>;

  @:native("flight_hx::adjustments::create_hue_rotate_color_matrix")
  static function createHueRotateColorMatrix(degrees:Float):Array<Float>;

  @:native("flight_hx::adjustments::create_identity_color_matrix")
  static function createIdentityColorMatrix():Array<Float>;

  @:native("flight_hx::adjustments::create_invert_color_matrix")
  static function createInvertColorMatrix():Array<Float>;

  @:native("flight_hx::adjustments::create_levels_color_matrix")
  static function createLevelsColorMatrix(inBlack:Float, inWhite:Float, outBlack:Float, outWhite:Float, gammaPresent:Bool, gamma:Float):Array<Float>;

  @:native("flight_hx::adjustments::create_opacity_color_matrix")
  static function createOpacityColorMatrix(alpha:Float):Array<Float>;

  @:native("flight_hx::adjustments::create_polaroid_color_matrix")
  static function createPolaroidColorMatrix():Array<Float>;

  @:native("flight_hx::adjustments::create_saturation_color_matrix")
  static function createSaturationColorMatrix(amount:Float):Array<Float>;

  @:native("flight_hx::adjustments::create_sepia_color_matrix")
  static function createSepiaColorMatrix():Array<Float>;

  @:native("flight_hx::adjustments::create_technicolor_color_matrix")
  static function createTechnicolorColorMatrix():Array<Float>;

  @:native("flight_hx::adjustments::create_vintage_color_matrix")
  static function createVintageColorMatrix():Array<Float>;

  @:native("flight_hx::adjustments::create_white_balance_color_matrix")
  static function createWhiteBalanceColorMatrix(temperature:Float, tint:Float):Array<Float>;

  @:native("flight_hx::adjustments::is_affine_color_matrix")
  static function isAffineColorMatrix(matrix:Array<Float>):Bool;

  @:native("flight_hx::adjustments::multiply_color_matrix")
  static function multiplyColorMatrix(a:Array<Float>, b:Array<Float>, outPresent:Bool, out:Array<Float>):Array<Float>;

  @:native("flight_hx::adjustments::create_color_lut_cache")
  static function createColorLutCache():flight.ColorLutCache;

  @:native("flight_hx::adjustments::create_tint_adjustment")
  static function createTintAdjustment(rgba:Float):flight.TintAdjustment;
}
#end
