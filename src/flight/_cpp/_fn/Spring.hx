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
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/spring.cpp" />
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
@:include("flight_hx/spring.hpp")
extern class Spring {
  @:native("flight_hx::spring::add_spring_impulse")
  static function addSpringImpulse(spring:flight.Spring, velocity:Float):Void;

  @:native("flight_hx::spring::add_spring_impulse_2d")
  static function addSpringImpulse2D(spring2D:flight.Spring2D, velocityX:Float, velocityY:Float):Void;

  @:native("flight_hx::spring::add_spring_impulse_3d")
  static function addSpringImpulse3D(spring3D:flight.Spring3D, velocityX:Float, velocityY:Float, velocityZ:Float):Void;

  @:native("flight_hx::spring::create_spring")
  static function createSpring(valuePresent:Bool, value:Float, velocityPresent:Bool, velocity:Float):flight.Spring;

  @:native("flight_hx::spring::create_spring_2d")
  static function createSpring2D(valueXPresent:Bool, valueX:Float, valueYPresent:Bool, valueY:Float, velocityXPresent:Bool, velocityX:Float, velocityYPresent:Bool, velocityY:Float):flight.Spring2D;

  @:native("flight_hx::spring::create_spring_3d")
  static function createSpring3D(valueXPresent:Bool, valueX:Float, valueYPresent:Bool, valueY:Float, valueZPresent:Bool, valueZ:Float, velocityXPresent:Bool, velocityX:Float, velocityYPresent:Bool, velocityY:Float, velocityZPresent:Bool, velocityZ:Float):flight.Spring3D;

  @:native("flight_hx::spring::create_spring_config")
  static function createSpringConfig(frequency:Float, dampingRatio:Float):flight.SpringConfig;

  @:native("flight_hx::spring::create_spring_config_from_physical")
  static function createSpringConfigFromPhysical(stiffness:Float, damping:Float, mass:Float):flight.SpringConfig;

  @:native("flight_hx::spring::is_spring_2d_settled")
  static function isSpring2DSettled(spring2D:flight.Spring2D, targetX:Float, targetY:Float, positionEpsilonPresent:Bool, positionEpsilon:Float, velocityEpsilonPresent:Bool, velocityEpsilon:Float):Bool;

  @:native("flight_hx::spring::is_spring_3d_settled")
  static function isSpring3DSettled(spring3D:flight.Spring3D, targetX:Float, targetY:Float, targetZ:Float, positionEpsilonPresent:Bool, positionEpsilon:Float, velocityEpsilonPresent:Bool, velocityEpsilon:Float):Bool;

  @:native("flight_hx::spring::is_spring_settled")
  static function isSpringSettled(spring:flight.Spring, target:Float, positionEpsilonPresent:Bool, positionEpsilon:Float, velocityEpsilonPresent:Bool, velocityEpsilon:Float):Bool;

  @:native("flight_hx::spring::reset_spring")
  static function resetSpring(spring:flight.Spring, value:Float, velocityPresent:Bool, velocity:Float):Void;

  @:native("flight_hx::spring::reset_spring_2d")
  static function resetSpring2D(spring2D:flight.Spring2D, valueX:Float, valueY:Float, velocityXPresent:Bool, velocityX:Float, velocityYPresent:Bool, velocityY:Float):Void;

  @:native("flight_hx::spring::reset_spring_3d")
  static function resetSpring3D(spring3D:flight.Spring3D, valueX:Float, valueY:Float, valueZ:Float, velocityXPresent:Bool, velocityX:Float, velocityYPresent:Bool, velocityY:Float, velocityZPresent:Bool, velocityZ:Float):Void;

  @:native("flight_hx::spring::update_spring")
  static function updateSpring(spring:flight.Spring, target:Float, config:flight.SpringConfig, deltaTime:Float):Void;

  @:native("flight_hx::spring::update_spring_2d")
  static function updateSpring2D(spring2D:flight.Spring2D, targetX:Float, targetY:Float, config:flight.SpringConfig, deltaTime:Float):Void;

  @:native("flight_hx::spring::update_spring_3d")
  static function updateSpring3D(spring3D:flight.Spring3D, targetX:Float, targetY:Float, targetZ:Float, config:flight.SpringConfig, deltaTime:Float):Void;

  @:native("flight_hx::spring::update_spring_angle")
  static function updateSpringAngle(spring:flight.Spring, target:Float, fullTurn:Float, config:flight.SpringConfig, deltaTime:Float):Void;
}
#end
