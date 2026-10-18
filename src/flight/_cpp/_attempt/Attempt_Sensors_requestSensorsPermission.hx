// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_requestSensorsPermission extends AttemptConfig {
  @:native("flight::sensors::request_sensors_permission")
  public static function requestSensorsPermission(hostSensors:flight.HostSensorsCapability):flight._internal._Promise<Bool>;
}
#end
