// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/color/contract.hpp")
extern class Attempt_Color_getRec709LuminanceWeights extends AttemptConfig {
  @:native("flight::color::get_rec709_luminance_weights")
  public static function getRec709LuminanceWeights(out:Array<Float>):Void;
}
#end
