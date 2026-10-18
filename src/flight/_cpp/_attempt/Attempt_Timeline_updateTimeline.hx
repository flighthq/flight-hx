// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/timeline/contract.hpp")
extern class Attempt_Timeline_updateTimeline extends AttemptConfig {
  @:native("flight::timeline::update_timeline")
  public static function updateTimeline(timeline:flight.Timeline, deltaTime:Float):Bool;
}
#end
