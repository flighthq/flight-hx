// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/motionpath/contract.hpp")
extern class Attempt_Motionpath_initializeMotionPath extends AttemptConfig {
  @:native("flight::motionpath::initialize_motion_path")
  public static function initializeMotionPath(out:flight.EntityConstruction<flight.MotionPath>, path:flight.Path, ?speed:Float, ?loopMode:flight.MotionPathLoopMode, ?tolerance:Float):Void;
}
#end
