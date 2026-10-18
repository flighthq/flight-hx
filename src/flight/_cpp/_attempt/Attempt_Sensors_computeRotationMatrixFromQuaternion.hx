// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_computeRotationMatrixFromQuaternion extends AttemptConfig {
  @:native("flight::sensors::compute_rotation_matrix_from_quaternion")
  public static function computeRotationMatrixFromQuaternion(out:Array<Float>, quaternion:flight.QuaternionReading):Void;
}
#end
