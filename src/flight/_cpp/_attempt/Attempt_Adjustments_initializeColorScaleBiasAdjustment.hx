// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_initializeColorScaleBiasAdjustment extends AttemptConfig {
  @:native("flight::adjustments::initialize_color_scale_bias_adjustment")
  public static function initializeColorScaleBiasAdjustment(out:flight.EntityConstruction<flight.ColorScaleBiasAdjustment>, colorScaleBias:flight.ColorScaleBiasLike):Void;
}
#end
