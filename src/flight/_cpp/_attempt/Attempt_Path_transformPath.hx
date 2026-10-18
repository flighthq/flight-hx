// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_transformPath extends AttemptConfig {
  @:native("flight::path::transform_path")
  public static function transformPath(source:flight.Path, matrix:flight.MatrixLike, out:flight.Path):Void;
}
#end
