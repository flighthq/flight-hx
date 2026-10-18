// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/timeline/contract.hpp")
extern class Attempt_Timeline_initializeTimeline extends AttemptConfig {
  @:native("flight::timeline::initialize_timeline")
  public static function initializeTimeline(out:flight.EntityConstruction<flight.Timeline>, ?obj:Dynamic):Void;
}
#end
