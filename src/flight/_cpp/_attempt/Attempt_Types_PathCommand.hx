// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_PathCommand extends AttemptConfig {
  @:native("flight::types::path_command")
  public static var PathCommand:{ NO_OP:Float, MOVE_TO:Float, LINE_TO:Float, QUADRATIC_CURVE_TO:Float, WIDE_MOVE_TO:Float, WIDE_LINE_TO:Float, CUBIC_CURVE_TO:Float, CLOSE:Float };
}
#end
