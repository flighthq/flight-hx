// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/timeline/contract.hpp")
extern class Attempt_Timeline_playTimeline extends AttemptConfig {
  @:native("flight::timeline::play_timeline")
  public static function playTimeline(timeline:flight.Timeline):Void;
}
#end
