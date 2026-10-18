// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clock/contract.hpp")
extern class Attempt_Clock_isClockEffectivelyPaused extends AttemptConfig {
  @:native("flight::clock::is_clock_effectively_paused")
  public static function isClockEffectivelyPaused(clock:flight.Clock):Bool;
}
#end
