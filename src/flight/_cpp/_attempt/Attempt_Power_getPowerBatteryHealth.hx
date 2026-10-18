// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/power/contract.hpp")
extern class Attempt_Power_getPowerBatteryHealth extends AttemptConfig {
  @:native("flight::power::get_power_battery_health")
  public static function getPowerBatteryHealth(hostPowerBatteryHealth:flight.HostPowerBatteryHealthCapability, out:flight.PowerBatteryHealth):flight.PowerBatteryHealth;
}
#end
