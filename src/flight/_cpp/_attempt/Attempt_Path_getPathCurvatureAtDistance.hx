// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_getPathCurvatureAtDistance extends AttemptConfig {
  @:native("flight::path::get_path_curvature_at_distance")
  public static function getPathCurvatureAtDistance(path:flight.Path, distance:Float, ?tolerance:Float):Float;
}
#end
