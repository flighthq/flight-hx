// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_computeQuaternionFromOrientationReading extends AttemptConfig {
  @:native("flight::sensors::compute_quaternion_from_orientation_reading")
  public static function computeQuaternionFromOrientationReading(out:flight.QuaternionReading, orientation:flight.OrientationReading):Void;
}
#end
