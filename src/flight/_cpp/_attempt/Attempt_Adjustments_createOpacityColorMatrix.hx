// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_createOpacityColorMatrix extends AttemptConfig {
  @:native("flight::adjustments::create_opacity_color_matrix")
  public static function createOpacityColorMatrix(alpha:Float):Array<Float>;
}
#end
