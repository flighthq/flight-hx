// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/power/contract.hpp")
extern class Attempt_Power_releasePowerKeepAwake extends AttemptConfig {
  @:native("flight::power::release_power_keep_awake")
  public static function releasePowerKeepAwake(hostPowerKeepAwake:flight.HostPowerKeepAwakeCapability):flight._internal._Promise<flight.PowerKeepAwakeReleaseResult>;
}
#end
