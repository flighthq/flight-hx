// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clock/contract.hpp")
extern class Attempt_Clock_addClockChild extends AttemptConfig {
  @:native("flight::clock::add_clock_child")
  public static function addClockChild(parent:flight.Clock, child:flight.Clock):Void;
}
#end
