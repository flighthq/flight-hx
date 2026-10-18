// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/color/contract.hpp")
extern class Attempt_Color_packLinearToColor extends AttemptConfig {
  @:native("flight::color::pack_linear_to_color")
  public static function packLinearToColor(color:flight.LinearColor):Float;
}
#end
