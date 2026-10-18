// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/power/contract.hpp")
extern class Attempt_Power_isPowerKeepAwakeActive extends AttemptConfig {
  @:native("flight::power::is_power_keep_awake_active")
  public static function isPowerKeepAwakeActive(hostPowerKeepAwake:flight.HostPowerKeepAwakeCapability):Bool;
}
#end
