// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/timeline/contract.hpp")
extern class Attempt_Timeline_gotoAndPlayTimeline extends AttemptConfig {
  @:native("flight::timeline::goto_and_play_timeline")
  public static function gotoAndPlayTimeline(timeline:flight.Timeline, frame:Dynamic):Void;
}
#end
