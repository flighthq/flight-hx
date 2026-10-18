// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clock/contract.hpp")
extern class Attempt_Clock_createClock extends AttemptConfig {
  @:native("flight::clock::create_clock")
  public static function createClock(?options:flight.ClockOptions):flight.Clock;
}
#end
