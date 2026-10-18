// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_getPathPositionAtDistance extends AttemptConfig {
  @:native("flight::path::get_path_position_at_distance")
  public static function getPathPositionAtDistance(path:flight.Path, distance:Float, pointOut:flight.Vector2Like, tangentOut:flight.Vector2Like, ?tolerance:Float):Bool;
}
#end
