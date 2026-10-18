// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_initializeSepiaAdjustment extends AttemptConfig {
  @:native("flight::adjustments::initialize_sepia_adjustment")
  public static function initializeSepiaAdjustment(out:flight.EntityConstruction<flight.SepiaAdjustment>, ?options:Dynamic):Void;
}
#end
