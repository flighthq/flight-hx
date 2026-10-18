// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_getPathSegmentPointAtParameter extends AttemptConfig {
  @:native("flight::path::get_path_segment_point_at_parameter")
  public static function getPathSegmentPointAtParameter(path:flight.Path, segmentIndex:Float, t:Float, out:flight.Vector2Like):Bool;
}
#end
