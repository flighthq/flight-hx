// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_initializeAdjustment extends AttemptConfig {
  @:native("flight::adjustments::initialize_adjustment")
  public static function initializeAdjustment<T:flight.Adjustment>(out:flight.EntityConstruction<T>, kind:flight.AdjustmentKind):Void;
}
#end
