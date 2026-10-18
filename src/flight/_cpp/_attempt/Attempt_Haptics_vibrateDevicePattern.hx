// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/haptics/contract.hpp")
extern class Attempt_Haptics_vibrateDevicePattern extends AttemptConfig {
  @:native("flight::haptics::vibrate_device_pattern")
  public static function vibrateDevicePattern(hostHaptics:flight.HostHapticsCapability, pattern:Array<Float>):Bool;
}
#end
