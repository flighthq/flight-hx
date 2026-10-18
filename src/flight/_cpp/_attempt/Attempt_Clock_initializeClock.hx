// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clock/contract.hpp")
extern class Attempt_Clock_initializeClock extends AttemptConfig {
  @:native("flight::clock::initialize_clock")
  public static function initializeClock(out:flight.EntityConstruction<flight.Clock>, ?options:flight.ClockOptions):Void;
}
#end
