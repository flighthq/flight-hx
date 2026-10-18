// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/motionpath/contract.hpp")
extern class Attempt_Motionpath_updateMotionPath extends AttemptConfig {
  @:native("flight::motionpath::update_motion_path")
  public static function updateMotionPath(mp:flight.MotionPath, deltaTime:Float):Void;
}
#end
