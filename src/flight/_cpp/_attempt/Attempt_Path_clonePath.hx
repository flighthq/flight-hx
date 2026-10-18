// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_clonePath extends AttemptConfig {
  @:native("flight::path::clone_path")
  public static function clonePath(source:flight.Path):flight.Path;
}
#end
