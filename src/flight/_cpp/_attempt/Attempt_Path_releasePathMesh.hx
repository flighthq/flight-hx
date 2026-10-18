// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_releasePathMesh extends AttemptConfig {
  @:native("flight::path::release_path_mesh")
  public static function releasePathMesh(mesh:flight.PathMesh):Void;
}
#end
