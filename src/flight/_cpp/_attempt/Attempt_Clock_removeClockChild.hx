// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clock/contract.hpp")
extern class Attempt_Clock_removeClockChild extends AttemptConfig {
  @:native("flight::clock::remove_clock_child")
  public static function removeClockChild(parent:flight.Clock, child:flight.Clock):Void;
}
#end
