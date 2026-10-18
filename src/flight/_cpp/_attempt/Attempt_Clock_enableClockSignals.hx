// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clock/contract.hpp")
extern class Attempt_Clock_enableClockSignals extends AttemptConfig {
  @:native("flight::clock::enable_clock_signals")
  public static function enableClockSignals(clock:flight.Clock):flight.Signal<(Float)->Void>;
}
#end
