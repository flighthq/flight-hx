// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_initializeTintAdjustment extends AttemptConfig {
  @:native("flight::adjustments::initialize_tint_adjustment")
  public static function initializeTintAdjustment(out:flight.EntityConstruction<flight.TintAdjustment>, rgba:Float):Void;
}
#end
