// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_createChannelMixerColorMatrix extends AttemptConfig {
  @:native("flight::adjustments::create_channel_mixer_color_matrix")
  public static function createChannelMixerColorMatrix(redOut:Array<Float>, greenOut:Array<Float>, blueOut:Array<Float>):Array<Float>;
}
#end
