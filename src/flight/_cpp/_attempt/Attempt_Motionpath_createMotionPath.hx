// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/motionpath/contract.hpp")
extern class Attempt_Motionpath_createMotionPath extends AttemptConfig {
  @:native("flight::motionpath::create_motion_path")
  public static function createMotionPath(path:flight.Path, ?speed:Float, ?loopMode:flight.MotionPathLoopMode, ?tolerance:Float):flight.MotionPath;
}
#end
