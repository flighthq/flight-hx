// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_createExternalAudioResourceReference extends AttemptConfig {
  @:native("flight::audio::create_external_audio_resource_reference")
  public static function createExternalAudioResourceReference(uri:String, ?basePath:Null<String>, ?mimeType:Null<String>, ?name:Null<String>):flight.ExternalAudioResourceReference;
}
#end
