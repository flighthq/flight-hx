// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/color/contract.hpp")
extern class Attempt_Color_oklabToLinearRgb extends AttemptConfig {
  @:native("flight::color::oklab_to_linear_rgb")
  public static function oklabToLinearRgb(out:Array<Float>, L:Float, a:Float, b:Float):Void;
}
#end
