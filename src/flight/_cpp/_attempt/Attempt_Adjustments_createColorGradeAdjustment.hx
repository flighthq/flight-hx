// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_createColorGradeAdjustment extends AttemptConfig {
  @:native("flight::adjustments::create_color_grade_adjustment")
  public static function createColorGradeAdjustment(?options:Dynamic):flight.ColorGradeAdjustment;
}
#end
