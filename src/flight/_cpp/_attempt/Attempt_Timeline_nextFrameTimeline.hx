// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/timeline/contract.hpp")
extern class Attempt_Timeline_nextFrameTimeline extends AttemptConfig {
  @:native("flight::timeline::next_frame_timeline")
  public static function nextFrameTimeline(timeline:flight.Timeline):Void;
}
#end
