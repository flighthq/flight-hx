// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_createColorBalanceColorMatrix extends AttemptConfig {
  @:native("flight::adjustments::create_color_balance_color_matrix")
  public static function createColorBalanceColorMatrix(shadows:Array<Float>, midtones:Array<Float>, highlights:Array<Float>):Array<Float>;
}
#end
