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
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/keyboard.cpp" />
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
@:include("flight_hx/keyboard.hpp")
extern class Keyboard {
  @:native("flight_hx::keyboard::detach_soft_keyboard")
  static function detachSoftKeyboard(keyboard:flight.SoftKeyboard):Void;

  @:native("flight_hx::keyboard::dispose_soft_keyboard")
  static function disposeSoftKeyboard(keyboard:flight.SoftKeyboard):Void;

  @:native("flight_hx::keyboard::get_soft_keyboard_height")
  static function getSoftKeyboardHeight(hostSoftKeyboardInfo:flight.HostSoftKeyboardInfoCapability):Float;

  @:native("flight_hx::keyboard::get_soft_keyboard_info")
  static function getSoftKeyboardInfo(hostSoftKeyboardInfo:flight.HostSoftKeyboardInfoCapability, out:flight.SoftKeyboardInfo):flight.SoftKeyboardInfo;

  @:native("flight_hx::keyboard::is_soft_keyboard_visible")
  static function isSoftKeyboardVisible(hostSoftKeyboardInfo:flight.HostSoftKeyboardInfoCapability):Bool;
}
#end
