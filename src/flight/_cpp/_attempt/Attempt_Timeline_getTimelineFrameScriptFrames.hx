// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/timeline/contract.hpp")
extern class Attempt_Timeline_getTimelineFrameScriptFrames extends AttemptConfig {
  @:native("flight::timeline::get_timeline_frame_script_frames")
  public static function getTimelineFrameScriptFrames(timeline:flight.Timeline):Array<Float>;
}
#end
