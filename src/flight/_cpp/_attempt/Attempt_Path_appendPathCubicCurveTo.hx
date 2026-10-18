// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_appendPathCubicCurveTo extends AttemptConfig {
  @:native("flight::path::append_path_cubic_curve_to")
  public static function appendPathCubicCurveTo(path:flight.Path, controlX1:Float, controlY1:Float, controlX2:Float, controlY2:Float, x:Float, y:Float):Void;
}
#end
