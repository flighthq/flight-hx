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
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/velocity.cpp" />
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
@:include("flight_hx/velocity.hpp")
extern class Velocity {
  @:native("flight_hx::velocity::begin_velocity_frame")
  static function beginVelocityFrame(field:flight.VelocityField):Void;

  @:native("flight_hx::velocity::create_velocity_field")
  static function createVelocityField():flight.VelocityField;

  @:native("flight_hx::velocity::add_velocity")
  static function addVelocity(out:flight.Velocity2D, a:flight.Velocity2D, b:flight.Velocity2D):flight.Velocity2D;

  @:native("flight_hx::velocity::clamp_velocity")
  static function clampVelocity(out:flight.Velocity2D, velocity:flight.Velocity2D, maxLength:Float):flight.Velocity2D;

  @:native("flight_hx::velocity::copy_velocity")
  static function copyVelocity(out:flight.Velocity2D, source:flight.Velocity2D):flight.Velocity2D;

  @:native("flight_hx::velocity::damp_velocity")
  static function dampVelocity(out:flight.Velocity2D, current:flight.Velocity2D, previous:flight.Velocity2D, factor:Float):flight.Velocity2D;

  @:native("flight_hx::velocity::get_velocity_sample_at")
  static function getVelocitySampleAt(sample:flight.VelocitySample, currentWorldTransform:flight.Matrix, pointX:Float, pointY:Float, out:flight.Velocity2D):flight.Velocity2D;

  @:native("flight_hx::velocity::is_velocity_zero")
  static function isVelocityZero(velocity:flight.Velocity2D, epsilonPresent:Bool, epsilon:Float):Bool;

  @:native("flight_hx::velocity::length_of_velocity")
  static function lengthOfVelocity(velocity:flight.Velocity2D):Float;

  @:native("flight_hx::velocity::lerp_velocity")
  static function lerpVelocity(out:flight.Velocity2D, a:flight.Velocity2D, b:flight.Velocity2D, t:Float):flight.Velocity2D;

  @:native("flight_hx::velocity::normalize_velocity")
  static function normalizeVelocity(out:flight.Velocity2D, source:flight.Velocity2D):flight.Velocity2D;

  @:native("flight_hx::velocity::scale_velocity")
  static function scaleVelocity(out:flight.Velocity2D, velocity:flight.Velocity2D, scale:Float):flight.Velocity2D;

  @:native("flight_hx::velocity::subtract_velocity")
  static function subtractVelocity(out:flight.Velocity2D, a:flight.Velocity2D, b:flight.Velocity2D):flight.Velocity2D;

  @:native("flight_hx::velocity::zero_velocity")
  static function zeroVelocity(out:flight.Velocity2D):flight.Velocity2D;
}
#end
