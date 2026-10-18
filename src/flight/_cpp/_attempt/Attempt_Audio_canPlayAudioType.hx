// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_canPlayAudioType extends AttemptConfig {
  @:native("flight::audio::can_play_audio_type")
  public static function canPlayAudioType(hostAudioCodec:flight.HostAudioCodecCapability, mimeType:String):Bool;
}
#end
