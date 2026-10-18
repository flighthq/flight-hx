// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_explainStrokePathTessellation extends AttemptConfig {
  @:native("flight::path::explain_stroke_path_tessellation")
  public static function explainStrokePathTessellation(path:flight.Path, style:flight.StrokeStyle, ?tolerance:Float):flight.StrokePathTessellationExplanation;
}
#end
