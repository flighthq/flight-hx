// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/color/contract.hpp")
extern class Attempt_Color_allocateHsvColor extends AttemptConfig {
  @:native("flight::color::allocate_hsv_color")
  public static function allocateHsvColor():flight.HsvColor;
}
#end
