// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_flattenPath extends AttemptConfig {
  @:native("flight::path::flatten_path")
  public static function flattenPath(path:flight.Path, ?tolerance:Float):Array<Array<Float>>;
}
#end
