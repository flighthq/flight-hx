// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_getPathSegmentCurvatureAtParameter extends AttemptConfig {
  @:native("flight::path::get_path_segment_curvature_at_parameter")
  public static function getPathSegmentCurvatureAtParameter(path:flight.Path, segmentIndex:Float, t:Float):Null<Float>;
}
#end
