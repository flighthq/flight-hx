// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_tessellateStrokePath extends AttemptConfig {
  @:native("flight::path::tessellate_stroke_path")
  public static function tessellateStrokePath(path:flight.Path, style:flight.StrokeStyle, ?tolerance:Float):Null<flight.PathMesh>;
}
#end
