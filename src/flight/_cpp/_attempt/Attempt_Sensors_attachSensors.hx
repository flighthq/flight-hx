// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_attachSensors extends AttemptConfig {
  @:native("flight::sensors::attach_sensors")
  public static function attachSensors(hostSensors:flight.HostSensorsCapability, sensors:flight.Sensors):Void;
}
#end
