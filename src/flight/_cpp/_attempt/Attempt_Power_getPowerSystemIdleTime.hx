// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/power/contract.hpp")
extern class Attempt_Power_getPowerSystemIdleTime extends AttemptConfig {
  @:native("flight::power::get_power_system_idle_time")
  public static function getPowerSystemIdleTime(hostPowerIdle:flight.HostPowerIdleCapability):Float;
}
#end
