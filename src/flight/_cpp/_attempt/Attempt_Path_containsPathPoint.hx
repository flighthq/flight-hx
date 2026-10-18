// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_containsPathPoint extends AttemptConfig {
  @:native("flight::path::contains_path_point")
  public static function containsPathPoint(path:flight.Path, px:Float, py:Float, ?tolerance:Float):Bool;
}
#end
