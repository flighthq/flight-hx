// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/power/contract.hpp")
extern class Attempt_Power_enablePowerSignals extends AttemptConfig {
  @:native("flight::power::enable_power_signals")
  public static function enablePowerSignals(power:flight.Power):Void;
}
#end
