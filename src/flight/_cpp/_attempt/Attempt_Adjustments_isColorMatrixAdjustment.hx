// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_isColorMatrixAdjustment extends AttemptConfig {
  @:native("flight::adjustments::is_color_matrix_adjustment")
  public static function isColorMatrixAdjustment(operation:{ kind:String }):Bool;
}
#end
