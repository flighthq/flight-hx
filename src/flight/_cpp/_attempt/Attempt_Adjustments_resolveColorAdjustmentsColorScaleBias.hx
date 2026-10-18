// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_resolveColorAdjustmentsColorScaleBias extends AttemptConfig {
  @:native("flight::adjustments::resolve_color_adjustments_color_scale_bias")
  public static function resolveColorAdjustmentsColorScaleBias(adjustments:Null<Array<flight.Adjustment>>, out:flight.ColorScaleBias):Float;
}
#end
