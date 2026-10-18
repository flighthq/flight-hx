// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_resolveAudioResourceReference extends AttemptConfig {
  @:native("flight::audio::resolve_audio_resource_reference")
  public static function resolveAudioResourceReference(ref:flight.AudioResourceReference, audioDecode:flight.HostAudioDecodeCapabilities, fetch:flight.AudioResourceFetch, signal:flight.AbortSignal, ?decoders:flight.AudioDecoderRegistry):flight._internal._Promise<Null<flight.AudioResource>>;
}
#end
