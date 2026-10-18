// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_createPathMorph extends AttemptConfig {
  @:native("flight::path::create_path_morph")
  public static function createPathMorph(start:flight.Path, end:flight.Path):Null<flight.PathMorph>;
}
#end
