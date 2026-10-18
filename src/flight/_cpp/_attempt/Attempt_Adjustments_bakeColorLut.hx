// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_bakeColorLut extends AttemptConfig {
  @:native("flight::adjustments::bake_color_lut")
  public static function bakeColorLut(transforms:Array<flight.ColorTransformFunction>, ?size:Float):flight.ColorLut;
}
#end
