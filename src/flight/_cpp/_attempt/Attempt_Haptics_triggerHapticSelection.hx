// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/haptics/contract.hpp")
extern class Attempt_Haptics_triggerHapticSelection extends AttemptConfig {
  @:native("flight::haptics::trigger_haptic_selection")
  public static function triggerHapticSelection(hostHaptics:flight.HostHapticsCapability):Bool;
}
#end
