// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/timeline/contract.hpp")
extern class Attempt_Timeline_prevFrameTimeline extends AttemptConfig {
  @:native("flight::timeline::prev_frame_timeline")
  public static function prevFrameTimeline(timeline:flight.Timeline):Void;
}
#end
