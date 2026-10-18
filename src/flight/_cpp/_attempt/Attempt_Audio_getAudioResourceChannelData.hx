// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/audio/contract.hpp")
extern class Attempt_Audio_getAudioResourceChannelData extends AttemptConfig {
  @:native("flight::audio::get_audio_resource_channel_data")
  public static function getAudioResourceChannelData(resource:flight.AudioResource, channel:Float):Null<flight._internal._Float32Array>;
}
#end
