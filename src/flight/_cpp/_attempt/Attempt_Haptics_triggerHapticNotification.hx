// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/haptics/contract.hpp")
extern class Attempt_Haptics_triggerHapticNotification extends AttemptConfig {
  @:native("flight::haptics::trigger_haptic_notification")
  public static function triggerHapticNotification(hostHaptics:flight.HostHapticsCapability, type:flight.HapticNotificationType):Bool;
}
#end
