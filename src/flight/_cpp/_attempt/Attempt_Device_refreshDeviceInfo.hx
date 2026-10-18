// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/device/contract.hpp")
extern class Attempt_Device_refreshDeviceInfo extends AttemptConfig {
  @:native("flight::device::refresh_device_info")
  public static function refreshDeviceInfo(hostDevice:flight.HostDeviceCapability):Void;
}
#end
