// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/power/contract.hpp")
extern class Attempt_Power_acquirePowerKeepAwake extends AttemptConfig {
  @:native("flight::power::acquire_power_keep_awake")
  public static function acquirePowerKeepAwake(hostPowerKeepAwake:flight.HostPowerKeepAwakeCapability, ?mode:flight.PowerKeepAwakeMode):flight._internal._Promise<flight.PowerKeepAwakeAcquireResult>;
}
#end
