// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_getAdjustmentColorTransform extends AttemptConfig {
  @:native("flight::adjustments::get_adjustment_color_transform")
  public static function getAdjustmentColorTransform(operation:{ kind:String }):Null<flight.ColorTransformFunction>;
}
#end
