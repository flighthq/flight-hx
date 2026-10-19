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
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/device.cpp" />
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
@:include("flight_hx/device.hpp")
extern class Device {
  @:native("flight_hx::device::create_device_capabilities")
  static function createDeviceCapabilities():flight.DeviceCapabilities;

  @:native("flight_hx::device::create_device_display_metrics")
  static function createDeviceDisplayMetrics():flight.DeviceDisplayMetrics;

  @:native("flight_hx::device::create_device_info")
  static function createDeviceInfo():flight.DeviceInfo;

  @:native("flight_hx::device::create_safe_area_insets")
  static function createSafeAreaInsets():flight.SafeAreaInsets;

  @:native("flight_hx::device::get_device_capabilities")
  static function getDeviceCapabilities(hostDevice:flight.HostDeviceCapability, out:flight.DeviceCapabilities):flight.DeviceCapabilities;

  @:native("flight_hx::device::get_device_display_metrics")
  static function getDeviceDisplayMetrics(hostDevice:flight.HostDeviceCapability, out:flight.DeviceDisplayMetrics):flight.DeviceDisplayMetrics;

  @:native("flight_hx::device::get_device_id")
  static function getDeviceId(hostDevice:flight.HostDeviceCapability):String;

  @:native("flight_hx::device::get_device_info")
  static function getDeviceInfo(hostDevice:flight.HostDeviceCapability, out:flight.DeviceInfo):flight.DeviceInfo;

  @:native("flight_hx::device::get_safe_area_insets")
  static function getSafeAreaInsets(hostDevice:flight.HostDeviceCapability, out:flight.SafeAreaInsets):flight.SafeAreaInsets;

  @:native("flight_hx::device::refresh_device_info")
  static function refreshDeviceInfo(hostDevice:flight.HostDeviceCapability):Void;
}
#end
