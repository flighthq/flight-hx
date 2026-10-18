// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_initializeMotionReading extends AttemptConfig {
  @:native("flight::sensors::initialize_motion_reading")
  public static function initializeMotionReading(out:flight.EntityConstruction<flight.MotionReading>):Void;
}
#end
