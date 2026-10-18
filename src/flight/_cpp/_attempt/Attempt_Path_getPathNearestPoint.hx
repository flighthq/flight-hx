// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_getPathNearestPoint extends AttemptConfig {
  @:native("flight::path::get_path_nearest_point")
  public static function getPathNearestPoint(path:flight.Path, px:Float, py:Float, out:flight.Vector2Like, ?tolerance:Float):Float;
}
#end
