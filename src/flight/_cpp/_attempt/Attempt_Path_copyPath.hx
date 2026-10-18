// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_copyPath extends AttemptConfig {
  @:native("flight::path::copy_path")
  public static function copyPath(source:flight.Path, ?out:flight.Path):flight.Path;
}
#end
