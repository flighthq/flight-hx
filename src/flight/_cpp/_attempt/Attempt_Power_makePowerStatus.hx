// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/power/contract.hpp")
extern class Attempt_Power_makePowerStatus extends AttemptConfig {
  @:native("flight::power::make_power_status")
  public static function makePowerStatus():flight.PowerStatus;
}
#end
