// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/motionpath/contract.hpp")
extern class Attempt_Motionpath_setMotionPathProgress extends AttemptConfig {
  @:native("flight::motionpath::set_motion_path_progress")
  public static function setMotionPathProgress(mp:flight.MotionPath, t:Float):Void;
}
#end
