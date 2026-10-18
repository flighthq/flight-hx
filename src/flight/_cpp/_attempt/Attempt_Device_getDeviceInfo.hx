// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/device/contract.hpp")
extern class Attempt_Device_getDeviceInfo extends AttemptConfig {
  @:native("flight::device::get_device_info")
  public static function getDeviceInfo(hostDevice:flight.HostDeviceCapability, out:flight.DeviceInfo):flight.DeviceInfo;
}
#end
