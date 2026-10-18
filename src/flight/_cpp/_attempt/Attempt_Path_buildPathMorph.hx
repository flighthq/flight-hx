// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_buildPathMorph extends AttemptConfig {
  @:native("flight::path::build_path_morph")
  public static function buildPathMorph(start:flight.Path, end:flight.Path):{ contour:Null<Float>, issue:Float, morph:Null<flight.PathMorph> };
}
#end
