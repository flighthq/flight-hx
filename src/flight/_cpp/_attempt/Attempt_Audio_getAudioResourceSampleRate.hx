// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_getAudioResourceSampleRate extends AttemptConfig {
  @:native("flight::audio::get_audio_resource_sample_rate")
  public static function getAudioResourceSampleRate(resource:flight.AudioResource):Float;
}
#end
