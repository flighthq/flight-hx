// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/color/contract.hpp")
extern class Attempt_Color_linearRgbToOklab extends AttemptConfig {
  @:native("flight::color::linear_rgb_to_oklab")
  public static function linearRgbToOklab(out:Array<Float>, r:Float, g:Float, b:Float):Void;
}
#end
