// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_tessellatePath extends AttemptConfig {
  @:native("flight::path::tessellate_path")
  public static function tessellatePath(path:flight.Path, ?tolerance:Float):flight.PathMesh;
}
#end
