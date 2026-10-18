// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/timeline/contract.hpp")
extern class Attempt_Timeline_disposeTimelineSignals extends AttemptConfig {
  @:native("flight::timeline::dispose_timeline_signals")
  public static function disposeTimelineSignals(timeline:flight.Timeline):Void;
}
#end
