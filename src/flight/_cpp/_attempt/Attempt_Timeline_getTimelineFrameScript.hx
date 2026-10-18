// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/timeline/contract.hpp")
extern class Attempt_Timeline_getTimelineFrameScript extends AttemptConfig {
  @:native("flight::timeline::get_timeline_frame_script")
  public static function getTimelineFrameScript(timeline:flight.Timeline, frame:Dynamic):Null<flight.FrameScript>;
}
#end
