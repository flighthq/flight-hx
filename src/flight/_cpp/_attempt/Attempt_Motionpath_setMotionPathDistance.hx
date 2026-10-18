// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/motionpath/contract.hpp")
extern class Attempt_Motionpath_setMotionPathDistance extends AttemptConfig {
  @:native("flight::motionpath::set_motion_path_distance")
  public static function setMotionPathDistance(mp:flight.MotionPath, distance:Float):Void;
}
#end
