// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/timeline/contract.hpp")
extern class Attempt_Timeline_findTimelineLabel extends AttemptConfig {
  @:native("flight::timeline::find_timeline_label")
  public static function findTimelineLabel(timeline:flight.Timeline, name:String):Null<flight.TimelineLabel>;
}
#end
