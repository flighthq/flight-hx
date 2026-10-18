// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/color/contract.hpp")
extern class Attempt_Color_unpackColorToLinear extends AttemptConfig {
  @:native("flight::color::unpack_color_to_linear")
  public static function unpackColorToLinear(out:flight.LinearColor, color:Float):flight.LinearColor;
}
#end
