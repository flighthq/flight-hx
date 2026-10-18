// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_initializeInvertAdjustment extends AttemptConfig {
  @:native("flight::adjustments::initialize_invert_adjustment")
  public static function initializeInvertAdjustment(out:flight.EntityConstruction<flight.InvertAdjustment>, ?options:Dynamic):Void;
}
#end
