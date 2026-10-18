// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_initializeColorGradeAdjustment extends AttemptConfig {
  @:native("flight::adjustments::initialize_color_grade_adjustment")
  public static function initializeColorGradeAdjustment(out:flight.EntityConstruction<flight.ColorGradeAdjustment>, ?options:Dynamic):Void;
}
#end
