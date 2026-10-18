// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/timeline/contract.hpp")
extern class Attempt_Timeline_getTimelineCurrentLabel extends AttemptConfig {
  @:native("flight::timeline::get_timeline_current_label")
  public static function getTimelineCurrentLabel(timeline:flight.Timeline):Null<flight.TimelineLabel>;
}
#end
