// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_computeGravityFromOrientation extends AttemptConfig {
  @:native("flight::sensors::compute_gravity_from_orientation")
  public static function computeGravityFromOrientation(out:flight.MotionReading, orientation:flight.OrientationReading):Void;
}
#end
