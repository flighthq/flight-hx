// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/motionpath/contract.hpp")
extern class Attempt_Motionpath_getMotionPathPosition extends AttemptConfig {
  @:native("flight::motionpath::get_motion_path_position")
  public static function getMotionPathPosition(mp:flight.MotionPath, pointOut:flight.Vector2Like, tangentOut:flight.Vector2Like):Bool;
}
#end
