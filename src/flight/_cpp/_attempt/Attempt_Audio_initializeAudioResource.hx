// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_initializeAudioResource extends AttemptConfig {
  @:native("flight::audio::initialize_audio_resource")
  public static function initializeAudioResource(out:flight.EntityConstruction<flight.AudioResource>, ?buffer:flight.AudioBuffer):Void;
}
#end
