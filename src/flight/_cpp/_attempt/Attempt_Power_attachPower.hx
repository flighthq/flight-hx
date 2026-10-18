// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/power/contract.hpp")
extern class Attempt_Power_attachPower extends AttemptConfig {
  @:native("flight::power::attach_power")
  public static function attachPower(hostPowerStatus:Null<flight.HostPowerStatusCapability>, hostPowerChange:Null<flight.HostPowerChangeCapability>, hostPowerSessionLock:Null<flight.HostPowerSessionLockCapability>, hostPowerSuspension:Null<flight.HostPowerSuspensionCapability>, hostPowerThermal:Null<flight.HostPowerThermalCapability>, hostPowerIdle:Null<flight.HostPowerIdleCapability>, power:flight.Power, ?idleThresholdSeconds:Float):Void;
}
#end
