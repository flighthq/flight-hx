// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_acquirePathMeshTyped extends AttemptConfig {
  @:native("flight::path::acquire_path_mesh_typed")
  public static function acquirePathMeshTyped(path:flight.Path, ?tolerance:Float):flight.PathMeshTyped;
}
#end
