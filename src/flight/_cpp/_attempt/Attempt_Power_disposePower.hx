// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/power/contract.hpp")
extern class Attempt_Power_disposePower extends AttemptConfig {
  @:native("flight::power::dispose_power")
  public static function disposePower(power:flight.Power):Void;
}
#end
