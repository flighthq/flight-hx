// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_hasAmbientLightSensor extends AttemptConfig {
  @:native("flight::sensors::has_ambient_light_sensor")
  public static function hasAmbientLightSensor(hostSensors:flight.HostSensorsCapability):Bool;
}
#end
