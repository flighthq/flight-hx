// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_getAudioResourceDuration extends AttemptConfig {
  @:native("flight::audio::get_audio_resource_duration")
  public static function getAudioResourceDuration(resource:flight.AudioResource):Float;
}
#end
