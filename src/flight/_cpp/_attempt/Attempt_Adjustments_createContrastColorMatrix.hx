// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_createContrastColorMatrix extends AttemptConfig {
  @:native("flight::adjustments::create_contrast_color_matrix")
  public static function createContrastColorMatrix(amount:Float):Array<Float>;
}
#end
