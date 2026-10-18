// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/haptics/contract.hpp")
extern class Attempt_Haptics_vibrateDeviceWaveform extends AttemptConfig {
  @:native("flight::haptics::vibrate_device_waveform")
  public static function vibrateDeviceWaveform(hostHaptics:flight.HostHapticsCapability, timings:Array<Float>, amplitudes:Array<Float>, ?repeat:Float):Bool;
}
#end
