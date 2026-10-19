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
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/power.cpp" />
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
@:include("flight_hx/power.hpp")
extern class Power {
  @:native("flight_hx::power::get_power_idle_polling_interval_ms")
  static function getPowerIdlePollingIntervalMs():Float;

  @:native("flight_hx::power::set_power_idle_polling_interval_ms")
  static function setPowerIdlePollingIntervalMs(intervalMs:Float):Void;

  @:native("flight_hx::power::create_power")
  static function createPower():flight.Power;

  @:native("flight_hx::power::detach_power")
  static function detachPower(power:flight.Power):Void;

  @:native("flight_hx::power::dispose_power")
  static function disposePower(power:flight.Power):Void;

  @:native("flight_hx::power::enable_power_signals")
  static function enablePowerSignals(power:flight.Power):Void;

  @:native("flight_hx::power::make_power_battery_health")
  static function makePowerBatteryHealth():flight.PowerBatteryHealth;

  @:native("flight_hx::power::make_power_status")
  static function makePowerStatus():flight.PowerStatus;

  @:native("flight_hx::power::get_power_battery_health")
  static function getPowerBatteryHealth(hostPowerBatteryHealth:flight.HostPowerBatteryHealthCapability, out:flight.PowerBatteryHealth):flight.PowerBatteryHealth;

  @:native("flight_hx::power::get_power_status")
  static function getPowerStatus(hostPowerStatus:flight.HostPowerStatusCapability, out:flight.PowerStatus):flight.PowerStatus;

  @:native("flight_hx::power::get_power_system_idle_time")
  static function getPowerSystemIdleTime(hostPowerIdle:flight.HostPowerIdleCapability):Float;

  @:native("flight_hx::power::is_power_keep_awake_active")
  static function isPowerKeepAwakeActive(hostPowerKeepAwake:flight.HostPowerKeepAwakeCapability):Bool;
}
#end
