// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_loadAudioResourceFromBlob extends AttemptConfig {
  @:native("flight::audio::load_audio_resource_from_blob")
  public static function loadAudioResourceFromBlob(audioDecode:flight.HostAudioDecodeCapabilities, blob:flight.Blob, ?signal:flight.AbortSignal, ?decoders:flight.AudioDecoderRegistry):flight._internal._Promise<flight.AudioResource>;
}
#end
