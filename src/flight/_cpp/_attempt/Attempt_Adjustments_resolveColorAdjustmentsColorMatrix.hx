// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_resolveColorAdjustmentsColorMatrix extends AttemptConfig {
  @:native("flight::adjustments::resolve_color_adjustments_color_matrix")
  public static function resolveColorAdjustmentsColorMatrix(adjustments:Null<Array<flight.Adjustment>>):Null<Array<Float>>;
}
#end
