// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/device/contract.hpp")
extern class Attempt_Device_getDeviceCapabilities extends AttemptConfig {
  @:native("flight::device::get_device_capabilities")
  public static function getDeviceCapabilities(hostDevice:flight.HostDeviceCapability, out:flight.DeviceCapabilities):flight.DeviceCapabilities;
}
#end
