// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_createPath extends AttemptConfig {
  @:native("flight::path::create_path")
  public static function createPath(?winding:flight.PathWinding):flight.Path;
}
#end
