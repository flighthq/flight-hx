// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_createDesaturateColorMatrix extends AttemptConfig {
  @:native("flight::adjustments::create_desaturate_color_matrix")
  public static function createDesaturateColorMatrix(amount:Float):Array<Float>;
}
#end
