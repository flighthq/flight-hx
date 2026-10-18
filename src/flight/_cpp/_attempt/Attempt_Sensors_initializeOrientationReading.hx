// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_initializeOrientationReading extends AttemptConfig {
  @:native("flight::sensors::initialize_orientation_reading")
  public static function initializeOrientationReading(out:flight.EntityConstruction<flight.OrientationReading>):Void;
}
#end
