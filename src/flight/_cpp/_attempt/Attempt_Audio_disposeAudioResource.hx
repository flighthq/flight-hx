// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_disposeAudioResource extends AttemptConfig {
  @:native("flight::audio::dispose_audio_resource")
  public static function disposeAudioResource(resource:flight.AudioResource):Void;
}
#end
