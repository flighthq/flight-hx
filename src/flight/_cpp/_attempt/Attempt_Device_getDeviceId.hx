// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/device/contract.hpp")
extern class Attempt_Device_getDeviceId extends AttemptConfig {
  @:native("flight::device::get_device_id")
  public static function getDeviceId(hostDevice:flight.HostDeviceCapability):String;
}
#end
