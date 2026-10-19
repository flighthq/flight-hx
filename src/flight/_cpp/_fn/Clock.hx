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
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/clock.cpp" />
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
@:include("flight_hx/clock.hpp")
extern class Clock {
  @:native("flight_hx::clock::add_clock_child")
  static function addClockChild(parent:flight.Clock, child:flight.Clock):Void;

  @:native("flight_hx::clock::advance_clock")
  static function advanceClock(clock:flight.Clock, deltaTime:Float):Void;

  @:native("flight_hx::clock::create_child_clock")
  static function createChildClock(parent:flight.Clock, options:flight.ClockOptions):flight.Clock;

  @:native("flight_hx::clock::create_clock")
  static function createClock(options:flight.ClockOptions):flight.Clock;

  @:native("flight_hx::clock::dispose_clock")
  static function disposeClock(clock:flight.Clock):Void;

  @:native("flight_hx::clock::get_clock_effective_scale")
  static function getClockEffectiveScale(clock:flight.Clock):Float;

  @:native("flight_hx::clock::get_clock_parent")
  static function getClockParent(clock:flight.Clock):Null<flight.Clock>;

  @:native("flight_hx::clock::is_clock_effectively_paused")
  static function isClockEffectivelyPaused(clock:flight.Clock):Bool;

  @:native("flight_hx::clock::pause_clock")
  static function pauseClock(clock:flight.Clock):Void;

  @:native("flight_hx::clock::remove_clock_child")
  static function removeClockChild(parent:flight.Clock, child:flight.Clock):Void;

  @:native("flight_hx::clock::reset_clock")
  static function resetClock(clock:flight.Clock):Void;

  @:native("flight_hx::clock::resume_clock")
  static function resumeClock(clock:flight.Clock):Void;

  @:native("flight_hx::clock::set_clock_scale")
  static function setClockScale(clock:flight.Clock, scale:Float):Void;
}
#end
