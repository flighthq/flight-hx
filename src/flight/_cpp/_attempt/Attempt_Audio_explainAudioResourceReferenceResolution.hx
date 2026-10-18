// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_explainAudioResourceReferenceResolution extends AttemptConfig {
  @:native("flight::audio::explain_audio_resource_reference_resolution")
  public static function explainAudioResourceReferenceResolution(ref:flight.AudioResourceReference):flight.AudioResourceReferenceResolutionExplanation;
}
#end
