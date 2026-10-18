// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_getPathPointAtDistance extends AttemptConfig {
  @:native("flight::path::get_path_point_at_distance")
  public static function getPathPointAtDistance(path:flight.Path, distance:Float, out:flight.Vector2Like, ?tolerance:Float):Bool;
}
#end
