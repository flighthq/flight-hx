// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_appendPathTangentArcTo extends AttemptConfig {
  @:native("flight::path::append_path_tangent_arc_to")
  public static function appendPathTangentArcTo(path:flight.Path, x1:Float, y1:Float, x2:Float, y2:Float, radius:Float):Void;
}
#end
