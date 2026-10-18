// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/haptics/contract.hpp")
extern class Attempt_Haptics_vibrateDevice extends AttemptConfig {
  @:native("flight::haptics::vibrate_device")
  public static function vibrateDevice(hostHaptics:flight.HostHapticsCapability, durationMs:Float):Bool;
}
#end
