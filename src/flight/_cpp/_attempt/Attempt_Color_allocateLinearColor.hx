// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/color/contract.hpp")
extern class Attempt_Color_allocateLinearColor extends AttemptConfig {
  @:native("flight::color::allocate_linear_color")
  public static function allocateLinearColor():flight.LinearColor;
}
#end
