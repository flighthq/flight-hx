// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_initializeExposureAdjustment extends AttemptConfig {
  @:native("flight::adjustments::initialize_exposure_adjustment")
  public static function initializeExposureAdjustment(out:flight.EntityConstruction<flight.ExposureAdjustment>, ?options:Dynamic):Void;
}
#end
