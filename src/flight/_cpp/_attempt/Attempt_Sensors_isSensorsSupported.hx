// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_isSensorsSupported extends AttemptConfig {
  @:native("flight::sensors::is_sensors_supported")
  public static function isSensorsSupported(hostSensors:flight.HostSensorsCapability):Bool;
}
#end
