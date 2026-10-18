// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_selectAudioResourceUrl extends AttemptConfig {
  @:native("flight::audio::select_audio_resource_url")
  public static function selectAudioResourceUrl(hostAudioCodec:flight.HostAudioCodecCapability, sources:Array<flight.AudioResourceUrl>, ?decoders:flight.AudioDecoderRegistry):Null<String>;
}
#end
