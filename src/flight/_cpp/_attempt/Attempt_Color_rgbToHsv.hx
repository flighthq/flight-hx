// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/color/contract.hpp")
extern class Attempt_Color_rgbToHsv extends AttemptConfig {
  @:native("flight::color::rgb_to_hsv")
  public static function rgbToHsv(out:flight.HsvColor, color:Float):flight.HsvColor;
}
#end
