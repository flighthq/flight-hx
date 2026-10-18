// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/timeline/contract.hpp")
extern class Attempt_Timeline_getTimelineLabels extends AttemptConfig {
  @:native("flight::timeline::get_timeline_labels")
  public static function getTimelineLabels(timeline:flight.Timeline):Array<flight.TimelineLabel>;
}
#end
