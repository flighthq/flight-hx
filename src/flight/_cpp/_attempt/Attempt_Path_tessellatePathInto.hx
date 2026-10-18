// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_tessellatePathInto extends AttemptConfig {
  @:native("flight::path::tessellate_path_into")
  public static function tessellatePathInto(path:flight.Path, out:flight.PathMesh, ?tolerance:Float):Void;
}
#end
