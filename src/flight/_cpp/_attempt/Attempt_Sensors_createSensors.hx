// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_createSensors extends AttemptConfig {
  @:native("flight::sensors::create_sensors")
  public static function createSensors():flight.Sensors;
}
#end
