// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/power/contract.hpp")
extern class Attempt_Power_getPowerThermalState extends AttemptConfig {
  @:native("flight::power::get_power_thermal_state")
  public static function getPowerThermalState(hostPowerThermal:flight.HostPowerThermalCapability):flight.PowerThermalState;
}
#end
