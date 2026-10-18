// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_concatColorMatrix extends AttemptConfig {
  @:native("flight::adjustments::concat_color_matrix")
  public static function concatColorMatrix(target:Array<Float>, source:Array<Float>):Void;
}
#end
