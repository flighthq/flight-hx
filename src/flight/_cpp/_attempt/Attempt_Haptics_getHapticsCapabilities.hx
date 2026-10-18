// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/haptics/contract.hpp")
extern class Attempt_Haptics_getHapticsCapabilities extends AttemptConfig {
  @:native("flight::haptics::get_haptics_capabilities")
  public static function getHapticsCapabilities(hostHaptics:flight.HostHapticsCapability, out:flight.HapticsCapabilities):flight.HapticsCapabilities;
}
#end
