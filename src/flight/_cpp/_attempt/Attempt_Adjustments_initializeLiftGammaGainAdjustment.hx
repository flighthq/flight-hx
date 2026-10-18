// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_initializeLiftGammaGainAdjustment extends AttemptConfig {
  @:native("flight::adjustments::initialize_lift_gamma_gain_adjustment")
  public static function initializeLiftGammaGainAdjustment(out:flight.EntityConstruction<flight.LiftGammaGainAdjustment>, ?options:Dynamic):Void;
}
#end
