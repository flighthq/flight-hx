// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_initializeHueSaturationAdjustment extends AttemptConfig {
  @:native("flight::adjustments::initialize_hue_saturation_adjustment")
  public static function initializeHueSaturationAdjustment(out:flight.EntityConstruction<flight.HueSaturationAdjustment>, ?options:Dynamic):Void;
}
#end
