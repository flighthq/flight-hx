// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_forEachPathSegment extends AttemptConfig {
  @:native("flight::path::for_each_path_segment")
  public static function forEachPathSegment(path:flight.Path, visitor:(flight.PathSegment)->Void):Void;
}
#end
