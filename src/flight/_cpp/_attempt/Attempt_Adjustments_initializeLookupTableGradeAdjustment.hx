// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_initializeLookupTableGradeAdjustment extends AttemptConfig {
  @:native("flight::adjustments::initialize_lookup_table_grade_adjustment")
  public static function initializeLookupTableGradeAdjustment(out:flight.EntityConstruction<flight.LookupTableGradeAdjustment>, ?options:Dynamic):Void;
}
#end
