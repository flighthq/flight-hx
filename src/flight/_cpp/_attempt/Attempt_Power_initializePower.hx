// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/power/contract.hpp")
extern class Attempt_Power_initializePower extends AttemptConfig {
  @:native("flight::power::initialize_power")
  public static function initializePower(out:flight.EntityConstruction<flight.Power>):Void;
}
#end
