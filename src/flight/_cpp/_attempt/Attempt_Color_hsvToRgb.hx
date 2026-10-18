// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/color/contract.hpp")
extern class Attempt_Color_hsvToRgb extends AttemptConfig {
  @:native("flight::color::hsv_to_rgb")
  public static function hsvToRgb(out:Array<Float>, h:Float, s:Float, v:Float):Void;
}
#end
