// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_createQuaternionReading extends AttemptConfig {
  @:native("flight::sensors::create_quaternion_reading")
  public static function createQuaternionReading():flight.QuaternionReading;
}
#end
