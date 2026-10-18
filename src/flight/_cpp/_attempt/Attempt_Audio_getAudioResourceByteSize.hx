// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_getAudioResourceByteSize extends AttemptConfig {
  @:native("flight::audio::get_audio_resource_byte_size")
  public static function getAudioResourceByteSize(resource:flight.AudioResource):Float;
}
#end
