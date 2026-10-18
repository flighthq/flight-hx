// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clock/contract.hpp")
extern class Attempt_Clock_advanceClock extends AttemptConfig {
  @:native("flight::clock::advance_clock")
  public static function advanceClock(clock:flight.Clock, deltaTime:Float):Void;
}
#end
