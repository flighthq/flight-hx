// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_initializeExternalAudioResourceReference extends AttemptConfig {
  @:native("flight::audio::initialize_external_audio_resource_reference")
  public static function initializeExternalAudioResourceReference(out:flight.EntityConstruction<flight.ExternalAudioResourceReference>, uri:String, ?basePath:Null<String>, ?mimeType:Null<String>, ?name:Null<String>):Void;
}
#end
