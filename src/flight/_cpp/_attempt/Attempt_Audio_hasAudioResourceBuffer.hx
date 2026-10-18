// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_hasAudioResourceBuffer extends AttemptConfig {
  @:native("flight::audio::has_audio_resource_buffer")
  public static function hasAudioResourceBuffer(resource:flight.AudioResource):Bool;
}
#end
