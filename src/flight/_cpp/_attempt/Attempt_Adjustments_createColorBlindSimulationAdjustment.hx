// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_createColorBlindSimulationAdjustment extends AttemptConfig {
  @:native("flight::adjustments::create_color_blind_simulation_adjustment")
  public static function createColorBlindSimulationAdjustment(?options:Dynamic):flight.ColorBlindSimulationAdjustment;
}
#end
