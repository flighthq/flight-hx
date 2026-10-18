// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_createLevelsColorMatrix extends AttemptConfig {
  @:native("flight::adjustments::create_levels_color_matrix")
  public static function createLevelsColorMatrix(inBlack:Float, inWhite:Float, outBlack:Float, outWhite:Float, ?gamma:Float):Array<Float>;
}
#end
