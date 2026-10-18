// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/timeline/contract.hpp")
extern class Attempt_Timeline_createTimeline extends AttemptConfig {
  @:native("flight::timeline::create_timeline")
  public static function createTimeline(?obj:Dynamic):flight.Timeline;
}
#end
