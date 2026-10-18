// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/color/contract.hpp")
extern class Attempt_Color_lerpLinearColor extends AttemptConfig {
  @:native("flight::color::lerp_linear_color")
  public static function lerpLinearColor(out:flight.LinearColor, start:flight.LinearColor, end:flight.LinearColor, t:Float):flight.LinearColor;
}
#end
