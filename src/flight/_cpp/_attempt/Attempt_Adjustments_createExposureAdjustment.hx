// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_createExposureAdjustment extends AttemptConfig {
  @:native("flight::adjustments::create_exposure_adjustment")
  public static function createExposureAdjustment(?options:Dynamic):flight.ExposureAdjustment;
}
#end
