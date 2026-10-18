// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_detectAudioMimeType extends AttemptConfig {
  @:native("flight::audio::detect_audio_mime_type")
  public static function detectAudioMimeType(data:Dynamic):Null<String>;
}
#end
