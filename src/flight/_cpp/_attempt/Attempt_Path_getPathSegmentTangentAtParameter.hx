// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_getPathSegmentTangentAtParameter extends AttemptConfig {
  @:native("flight::path::get_path_segment_tangent_at_parameter")
  public static function getPathSegmentTangentAtParameter(path:flight.Path, segmentIndex:Float, t:Float, out:flight.Vector2Like):Bool;
}
#end
