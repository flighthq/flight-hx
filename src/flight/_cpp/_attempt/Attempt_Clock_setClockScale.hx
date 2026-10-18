// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clock/contract.hpp")
extern class Attempt_Clock_setClockScale extends AttemptConfig {
  @:native("flight::clock::set_clock_scale")
  public static function setClockScale(clock:flight.Clock, scale:Float):Void;
}
#end
