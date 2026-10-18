// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_isColorLutAdjustment extends AttemptConfig {
  @:native("flight::adjustments::is_color_lut_adjustment")
  public static function isColorLutAdjustment(operation:{ kind:String }):Bool;
}
#end
