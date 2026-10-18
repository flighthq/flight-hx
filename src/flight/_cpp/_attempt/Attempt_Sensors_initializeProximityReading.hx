// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_initializeProximityReading extends AttemptConfig {
  @:native("flight::sensors::initialize_proximity_reading")
  public static function initializeProximityReading(out:flight.EntityConstruction<flight.ProximityReading>):Void;
}
#end
