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
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/platform.cpp" />
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
@:include("flight_hx/platform.hpp")
extern class Platform {
  @:native("flight_hx::platform::create_platform_info")
  static function createPlatformInfo():flight.PlatformInfo;

  @:native("flight_hx::platform::get_platform_info")
  static function getPlatformInfo(hostPlatform:flight.HostPlatformCapability, out:flight.PlatformInfo):flight.PlatformInfo;

  @:native("flight_hx::platform::is_platform_desktop")
  static function isPlatformDesktop(hostPlatform:flight.HostPlatformCapability):Bool;

  @:native("flight_hx::platform::is_platform_mobile")
  static function isPlatformMobile(hostPlatform:flight.HostPlatformCapability):Bool;

  @:native("flight_hx::platform::is_platform_native")
  static function isPlatformNative(hostPlatform:flight.HostPlatformCapability):Bool;

  @:native("flight_hx::platform::is_platform_touch")
  static function isPlatformTouch(hostPlatform:flight.HostPlatformCapability):Bool;

  @:native("flight_hx::platform::is_platform_version_at_least")
  static function isPlatformVersionAtLeast(hostPlatform:flight.HostPlatformCapability, minimum:String):Bool;

  @:native("flight_hx::platform::is_platform_web")
  static function isPlatformWeb(hostPlatform:flight.HostPlatformCapability):Bool;
}
#end
