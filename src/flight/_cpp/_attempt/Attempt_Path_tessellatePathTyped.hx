// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_tessellatePathTyped extends AttemptConfig {
  @:native("flight::path::tessellate_path_typed")
  public static function tessellatePathTyped(path:flight.Path, ?tolerance:Float):flight.PathMeshTyped;
}
#end
