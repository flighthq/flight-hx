// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/motionpath/contract.hpp")
extern class Attempt_Motionpath_isMotionPathAtEnd extends AttemptConfig {
  @:native("flight::motionpath::is_motion_path_at_end")
  public static function isMotionPathAtEnd(mp:flight.MotionPath):Bool;
}
#end
