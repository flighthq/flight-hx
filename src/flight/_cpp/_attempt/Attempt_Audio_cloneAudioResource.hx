// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_cloneAudioResource extends AttemptConfig {
  @:native("flight::audio::clone_audio_resource")
  public static function cloneAudioResource(resource:flight.AudioResource):flight.AudioResource;
}
#end
