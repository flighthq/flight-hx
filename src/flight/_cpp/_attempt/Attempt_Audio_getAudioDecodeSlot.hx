// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_getAudioDecodeSlot extends AttemptConfig {
  @:native("flight::audio::get_audio_decode_slot")
  public static function getAudioDecodeSlot(audioDecode:flight.HostAudioDecodeCapabilities, mimeType:String):Null<flight.HostAudioDecodeFormatCapability>;
}
#end
