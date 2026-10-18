// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/timeline/contract.hpp")
extern class Attempt_Timeline_clearTimelineFrameScripts extends AttemptConfig {
  @:native("flight::timeline::clear_timeline_frame_scripts")
  public static function clearTimelineFrameScripts(timeline:flight.Timeline):Void;
}
#end
