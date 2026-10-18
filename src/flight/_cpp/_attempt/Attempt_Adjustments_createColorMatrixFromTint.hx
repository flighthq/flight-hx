// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_createColorMatrixFromTint extends AttemptConfig {
  @:native("flight::adjustments::create_color_matrix_from_tint")
  public static function createColorMatrixFromTint(packedRgba:Float, amount:Float):Array<Float>;
}
#end
