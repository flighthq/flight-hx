// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_createInvertAdjustment extends AttemptConfig {
  @:native("flight::adjustments::create_invert_adjustment")
  public static function createInvertAdjustment(?options:Dynamic):flight.InvertAdjustment;
}
#end
