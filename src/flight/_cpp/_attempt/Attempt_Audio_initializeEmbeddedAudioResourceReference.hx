// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_initializeEmbeddedAudioResourceReference extends AttemptConfig {
  @:native("flight::audio::initialize_embedded_audio_resource_reference")
  public static function initializeEmbeddedAudioResourceReference(out:flight.EntityConstruction<flight.EmbeddedAudioResourceReference>, bytes:flight._internal._UInt8Array, ?mimeType:Null<String>, ?name:Null<String>):Void;
}
#end
