// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_createTintAdjustment extends AttemptConfig {
  @:native("flight::adjustments::create_tint_adjustment")
  public static function createTintAdjustment(rgba:Float):flight.TintAdjustment;
}
#end
