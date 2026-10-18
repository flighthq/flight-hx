// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_createAudioResourceFromSamples extends AttemptConfig {
  @:native("flight::audio::create_audio_resource_from_samples")
  public static function createAudioResourceFromSamples(channels:Array<flight._internal._Float32Array>, sampleRate:Float):flight.AudioResource;
}
#end
