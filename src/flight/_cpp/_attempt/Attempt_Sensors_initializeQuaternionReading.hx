// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_initializeQuaternionReading extends AttemptConfig {
  @:native("flight::sensors::initialize_quaternion_reading")
  public static function initializeQuaternionReading(out:flight.EntityConstruction<flight.QuaternionReading>):Void;
}
#end
