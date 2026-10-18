// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clock/contract.hpp")
extern class Attempt_Clock_getClockEffectiveScale extends AttemptConfig {
  @:native("flight::clock::get_clock_effective_scale")
  public static function getClockEffectiveScale(clock:flight.Clock):Float;
}
#end
