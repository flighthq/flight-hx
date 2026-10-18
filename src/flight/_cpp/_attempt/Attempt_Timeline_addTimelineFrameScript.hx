// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/timeline/contract.hpp")
extern class Attempt_Timeline_addTimelineFrameScript extends AttemptConfig {
  @:native("flight::timeline::add_timeline_frame_script")
  public static function addTimelineFrameScript(timeline:flight.Timeline, frame:Dynamic, script:flight.FrameScript):Void;
}
#end
