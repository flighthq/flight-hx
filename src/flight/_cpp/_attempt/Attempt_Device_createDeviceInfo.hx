// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/device/contract.hpp")
extern class Attempt_Device_createDeviceInfo extends AttemptConfig {
  @:native("flight::device::create_device_info")
  public static function createDeviceInfo():flight.DeviceInfo;
}
#end
