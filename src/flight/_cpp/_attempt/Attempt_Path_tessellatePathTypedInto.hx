// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_tessellatePathTypedInto extends AttemptConfig {
  @:native("flight::path::tessellate_path_typed_into")
  public static function tessellatePathTypedInto(path:flight.Path, out:flight.PathMeshTyped, ?tolerance:Float):Void;
}
#end
