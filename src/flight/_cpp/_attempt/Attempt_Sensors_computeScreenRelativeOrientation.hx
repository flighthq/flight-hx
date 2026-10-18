// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_computeScreenRelativeOrientation extends AttemptConfig {
  @:native("flight::sensors::compute_screen_relative_orientation")
  public static function computeScreenRelativeOrientation(out:flight.OrientationReading, orientation:flight.OrientationReading, screenAngle:Float):Void;
}
#end
