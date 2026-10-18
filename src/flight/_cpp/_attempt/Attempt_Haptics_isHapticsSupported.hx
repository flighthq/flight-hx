// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/haptics/contract.hpp")
extern class Attempt_Haptics_isHapticsSupported extends AttemptConfig {
  @:native("flight::haptics::is_haptics_supported")
  public static function isHapticsSupported(hostHaptics:flight.HostHapticsCapability):Bool;
}
#end
