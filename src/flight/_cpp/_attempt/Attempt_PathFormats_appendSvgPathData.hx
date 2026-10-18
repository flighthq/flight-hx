// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path_formats/contract.hpp")
extern class Attempt_PathFormats_appendSvgPathData extends AttemptConfig {
  @:native("flight::path_formats::append_svg_path_data")
  public static function appendSvgPathData(path:flight.Path, d:String):Bool;
}
#end
