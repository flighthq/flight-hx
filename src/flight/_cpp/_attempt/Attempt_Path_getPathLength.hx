// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_getPathLength extends AttemptConfig {
  @:native("flight::path::get_path_length")
  public static function getPathLength(path:flight.Path, ?tolerance:Float):Float;
}
#end
