// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_applyColorMatrixToColor extends AttemptConfig {
  @:native("flight::adjustments::apply_color_matrix_to_color")
  public static function applyColorMatrixToColor(matrix:Array<Float>, packedRgba:Float):Float;
}
#end
