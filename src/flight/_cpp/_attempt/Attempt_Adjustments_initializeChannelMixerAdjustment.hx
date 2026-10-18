// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_initializeChannelMixerAdjustment extends AttemptConfig {
  @:native("flight::adjustments::initialize_channel_mixer_adjustment")
  public static function initializeChannelMixerAdjustment(out:flight.EntityConstruction<flight.ChannelMixerAdjustment>, ?options:Dynamic):Void;
}
#end
