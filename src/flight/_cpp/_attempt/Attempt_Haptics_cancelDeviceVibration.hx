// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/haptics/contract.hpp")
extern class Attempt_Haptics_cancelDeviceVibration extends AttemptConfig {
  @:native("flight::haptics::cancel_device_vibration")
  public static function cancelDeviceVibration(hostHaptics:flight.HostHapticsCapability):Bool;
}
#end
