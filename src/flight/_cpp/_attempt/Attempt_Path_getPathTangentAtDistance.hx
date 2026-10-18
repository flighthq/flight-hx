// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_getPathTangentAtDistance extends AttemptConfig {
  @:native("flight::path::get_path_tangent_at_distance")
  public static function getPathTangentAtDistance(path:flight.Path, distance:Float, out:flight.Vector2Like, ?tolerance:Float):Bool;
}
#end
