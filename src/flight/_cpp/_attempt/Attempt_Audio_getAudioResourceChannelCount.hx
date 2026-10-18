// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_getAudioResourceChannelCount extends AttemptConfig {
  @:native("flight::audio::get_audio_resource_channel_count")
  public static function getAudioResourceChannelCount(resource:flight.AudioResource):Float;
}
#end
