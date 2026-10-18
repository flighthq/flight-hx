// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_decodeAudioResourceBytes extends AttemptConfig {
  @:native("flight::audio::decode_audio_resource_bytes")
  public static function decodeAudioResourceBytes(audioDecode:flight.HostAudioDecodeCapabilities, bytes:flight._internal._UInt8Array, mimeType:Null<String>, signal:flight.AbortSignal, ?decoders:flight.AudioDecoderRegistry):flight._internal._Promise<Null<flight.AudioResource>>;
}
#end
