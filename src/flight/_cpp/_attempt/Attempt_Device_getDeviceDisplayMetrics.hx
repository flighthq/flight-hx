// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/device/contract.hpp")
extern class Attempt_Device_getDeviceDisplayMetrics extends AttemptConfig {
  @:native("flight::device::get_device_display_metrics")
  public static function getDeviceDisplayMetrics(hostDevice:flight.HostDeviceCapability, out:flight.DeviceDisplayMetrics):flight.DeviceDisplayMetrics;
}
#end
