// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_createEmbeddedAudioResourceReference extends AttemptConfig {
  @:native("flight::audio::create_embedded_audio_resource_reference")
  public static function createEmbeddedAudioResourceReference(bytes:flight._internal._UInt8Array, ?mimeType:Null<String>, ?name:Null<String>):flight.EmbeddedAudioResourceReference;
}
#end
