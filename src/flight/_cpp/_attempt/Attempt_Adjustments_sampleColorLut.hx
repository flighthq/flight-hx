// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_sampleColorLut extends AttemptConfig {
  @:native("flight::adjustments::sample_color_lut")
  public static function sampleColorLut(lut:flight.ColorLut, out:Array<Float>, r:Float, g:Float, b:Float):Void;
}
#end
