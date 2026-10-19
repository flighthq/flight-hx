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
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/screen.cpp" />
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
@:include("flight_hx/screen.hpp")
extern class Screen {
  @:native("flight_hx::screen::create_screen_info")
  static function createScreenInfo():flight.ScreenInfo;

  @:native("flight_hx::screen::create_screen_mode")
  static function createScreenMode():flight.ScreenMode;

  @:native("flight_hx::screen::create_screen_permission_change")
  static function createScreenPermissionChange():flight.ScreenPermissionChange;

  @:native("flight_hx::screen::create_screen_signals")
  static function createScreenSignals():flight.ScreenSignals;

  @:native("flight_hx::screen::detach_screen_permission_change")
  static function detachScreenPermissionChange(permissionChange:flight.ScreenPermissionChange):Void;

  @:native("flight_hx::screen::detach_screen_signals")
  static function detachScreenSignals(signals:flight.ScreenSignals):Void;

  @:native("flight_hx::screen::dispose_screen_permission_change")
  static function disposeScreenPermissionChange(permissionChange:flight.ScreenPermissionChange):Void;

  @:native("flight_hx::screen::dispose_screen_signals")
  static function disposeScreenSignals(signals:flight.ScreenSignals):Void;
}
#end
