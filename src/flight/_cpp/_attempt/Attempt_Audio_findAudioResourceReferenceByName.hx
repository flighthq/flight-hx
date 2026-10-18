// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_findAudioResourceReferenceByName extends AttemptConfig {
  @:native("flight::audio::find_audio_resource_reference_by_name")
  public static function findAudioResourceReferenceByName(references:Array<flight.AudioResourceReference>, name:String):Null<flight.AudioResourceReference>;
}
#end
