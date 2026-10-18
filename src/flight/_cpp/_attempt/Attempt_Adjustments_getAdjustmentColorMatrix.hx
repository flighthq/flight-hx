// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_getAdjustmentColorMatrix extends AttemptConfig {
  @:native("flight::adjustments::get_adjustment_color_matrix")
  public static function getAdjustmentColorMatrix(operation:{ kind:String }):Null<Array<Float>>;
}
#end
