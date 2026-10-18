// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_initializePath extends AttemptConfig {
  @:native("flight::path::initialize_path")
  public static function initializePath(out:flight.EntityConstruction<flight.Path>, ?winding:flight.PathWinding):Void;
}
#end
