// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_createAudioResourceFailure extends AttemptConfig {
  @:native("flight::audio::create_audio_resource_failure")
  public static function createAudioResourceFailure(cause:Dynamic):flight.AudioResourceFailure;
}
#end
