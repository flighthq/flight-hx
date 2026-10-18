// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_initializeBrightnessContrastAdjustment extends AttemptConfig {
  @:native("flight::adjustments::initialize_brightness_contrast_adjustment")
  public static function initializeBrightnessContrastAdjustment(out:flight.EntityConstruction<flight.BrightnessContrastAdjustment>, ?options:Dynamic):Void;
}
#end
