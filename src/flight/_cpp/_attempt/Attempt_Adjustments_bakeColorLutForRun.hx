// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_bakeColorLutForRun extends AttemptConfig {
  @:native("flight::adjustments::bake_color_lut_for_run")
  public static function bakeColorLutForRun(cache:flight.ColorLutCache, run:Array<{ kind:String }>, ?size:Float):flight.ColorLut;
}
#end
