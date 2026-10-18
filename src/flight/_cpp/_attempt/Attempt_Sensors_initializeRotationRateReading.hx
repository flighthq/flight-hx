// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_initializeRotationRateReading extends AttemptConfig {
  @:native("flight::sensors::initialize_rotation_rate_reading")
  public static function initializeRotationRateReading(out:flight.EntityConstruction<flight.RotationRateReading>):Void;
}
#end
