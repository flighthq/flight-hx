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
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/effects.cpp" />
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
@:include("flight_hx/effects.hpp")
extern class Effects {
  @:native("flight_hx::effects::compute_aces_tone_map")
  static function computeAcesToneMap(x:Float):Float;

  @:native("flight_hx::effects::compute_box_blur_pass_radius")
  static function computeBoxBlurPassRadius(sigma:Float, passes:Float, pass:Float):Float;

  @:native("flight_hx::effects::compute_box_blur_radius")
  static function computeBoxBlurRadius(sigma:Float, passes:Float):Float;

  @:native("flight_hx::effects::compute_depth_of_field_coc")
  static function computeDepthOfFieldCoc(depth:Float, focusDistance:Float, aperture:Float, focalLength:Float):Float;

  @:native("flight_hx::effects::compute_exposure_scale")
  static function computeExposureScale(exposure:Float):Float;

  @:native("flight_hx::effects::compute_gaussian_radius_from_sigma")
  static function computeGaussianRadiusFromSigma(sigma:Float):Float;

  @:native("flight_hx::effects::compute_gaussian_sigma_for_blur_radius")
  static function computeGaussianSigmaForBlurRadius(radius:Float, passes:Float):Float;

  @:native("flight_hx::effects::compute_gaussian_sigma_from_radius")
  static function computeGaussianSigmaFromRadius(radius:Float):Float;

  @:native("flight_hx::effects::compute_linear_depth_from_nonlinear")
  static function computeLinearDepthFromNonlinear(depth:Float, near:Float, far:Float):Float;

  @:native("flight_hx::effects::compute_reinhard_extended_tone_map")
  static function computeReinhardExtendedToneMap(x:Float, white:Float):Float;

  @:native("flight_hx::effects::compute_reinhard_tone_map")
  static function computeReinhardToneMap(x:Float):Float;

  @:native("flight_hx::effects::compute_uncharted2_tone_map")
  static function computeUncharted2ToneMap(x:Float):Float;

  @:native("flight_hx::effects::get_blur_downsample_level")
  static function getBlurDownsampleLevel(sigma:Float):Float;

  @:native("flight_hx::effects::get_blur_residual_sigma")
  static function getBlurResidualSigma(sigma:Float, level:Float):Float;

  @:native("flight_hx::effects::get_gaussian_kernel_size")
  static function getGaussianKernelSize(sigma:Float):Float;

  @:native("flight_hx::effects::get_linear_sampled_gaussian_tap_count")
  static function getLinearSampledGaussianTapCount(sigma:Float):Float;
}
#end
