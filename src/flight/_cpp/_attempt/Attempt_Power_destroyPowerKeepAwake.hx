// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/power/contract.hpp")
extern class Attempt_Power_destroyPowerKeepAwake extends AttemptConfig {
  @:native("flight::power::destroy_power_keep_awake")
  public static function destroyPowerKeepAwake(...hostPowerKeepAwake:flight.HostPowerKeepAwakeCapability):Void;
}
#end
