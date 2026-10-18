// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_getSensorsPermissionState extends AttemptConfig {
  @:native("flight::sensors::get_sensors_permission_state")
  public static function getSensorsPermissionState(hostSensors:flight.HostSensorsCapability, ?sensor:Dynamic):flight._internal._Promise<flight.SensorsPermissionState>;
}
#end
