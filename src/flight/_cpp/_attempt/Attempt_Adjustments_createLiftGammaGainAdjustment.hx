// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_createLiftGammaGainAdjustment extends AttemptConfig {
  @:native("flight::adjustments::create_lift_gamma_gain_adjustment")
  public static function createLiftGammaGainAdjustment(?options:Dynamic):flight.LiftGammaGainAdjustment;
}
#end
