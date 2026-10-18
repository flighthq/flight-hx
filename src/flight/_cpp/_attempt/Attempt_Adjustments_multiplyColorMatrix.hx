// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_multiplyColorMatrix extends AttemptConfig {
  @:native("flight::adjustments::multiply_color_matrix")
  public static function multiplyColorMatrix(a:Array<Float>, b:Array<Float>, ?out:Array<Float>):Array<Float>;
}
#end
