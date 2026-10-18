// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_initializeSensors extends AttemptConfig {
  @:native("flight::sensors::initialize_sensors")
  public static function initializeSensors(out:flight.EntityConstruction<flight.Sensors>):Void;
}
#end
