// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_appendPathQuadraticCurveTo extends AttemptConfig {
  @:native("flight::path::append_path_quadratic_curve_to")
  public static function appendPathQuadraticCurveTo(path:flight.Path, controlX:Float, controlY:Float, x:Float, y:Float):Void;
}
#end
