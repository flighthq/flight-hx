// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_isAudioResourceEmpty extends AttemptConfig {
  @:native("flight::audio::is_audio_resource_empty")
  public static function isAudioResourceEmpty(resource:flight.AudioResource):Bool;
}
#end
