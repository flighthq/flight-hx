// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_getAudioMimeTypeParameter extends AttemptConfig {
  @:native("flight::audio::get_audio_mime_type_parameter")
  public static function getAudioMimeTypeParameter(mimeType:String, name:String):Null<String>;
}
#end
