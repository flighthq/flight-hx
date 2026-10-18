// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_createMotionReading extends AttemptConfig {
  @:native("flight::sensors::create_motion_reading")
  public static function createMotionReading():flight.MotionReading;
}
#end
