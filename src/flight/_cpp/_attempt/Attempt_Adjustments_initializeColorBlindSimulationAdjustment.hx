// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_initializeColorBlindSimulationAdjustment extends AttemptConfig {
  @:native("flight::adjustments::initialize_color_blind_simulation_adjustment")
  public static function initializeColorBlindSimulationAdjustment(out:flight.EntityConstruction<flight.ColorBlindSimulationAdjustment>, ?options:Dynamic):Void;
}
#end
