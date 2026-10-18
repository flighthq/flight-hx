// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/haptics/contract.hpp")
extern class Attempt_Haptics_triggerHapticImpact extends AttemptConfig {
  @:native("flight::haptics::trigger_haptic_impact")
  public static function triggerHapticImpact(hostHaptics:flight.HostHapticsCapability, style:flight.HapticImpactStyle, ?intensity:Float):Bool;
}
#end
