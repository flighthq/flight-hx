// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_getPathBounds extends AttemptConfig {
  @:native("flight::path::get_path_bounds")
  public static function getPathBounds(path:flight.Path, out:flight.RectangleLike):Bool;
}
#end
