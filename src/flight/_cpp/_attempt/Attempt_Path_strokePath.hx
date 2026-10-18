// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_strokePath extends AttemptConfig {
  @:native("flight::path::stroke_path")
  public static function strokePath(path:flight.Path, style:flight.StrokeStyle, ?tolerance:Float):flight.Path;
}
#end
