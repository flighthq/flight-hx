// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_initializeColorLutCache extends AttemptConfig {
  @:native("flight::adjustments::initialize_color_lut_cache")
  public static function initializeColorLutCache(out:flight.EntityConstruction<flight.ColorLutCache>):Void;
}
#end
