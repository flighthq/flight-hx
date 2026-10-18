// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/color/contract.hpp")
extern class Attempt_Color_rgbToHsl extends AttemptConfig {
  @:native("flight::color::rgb_to_hsl")
  public static function rgbToHsl(out:flight.HslColor, color:Float):flight.HslColor;
}
#end
