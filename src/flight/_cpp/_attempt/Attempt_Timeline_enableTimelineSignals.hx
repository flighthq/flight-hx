// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/timeline/contract.hpp")
extern class Attempt_Timeline_enableTimelineSignals extends AttemptConfig {
  @:native("flight::timeline::enable_timeline_signals")
  public static function enableTimelineSignals(timeline:flight.Timeline):flight.TimelineSignals;
}
#end
