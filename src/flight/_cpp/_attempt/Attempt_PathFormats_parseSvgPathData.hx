// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path_formats/contract.hpp")
extern class Attempt_PathFormats_parseSvgPathData extends AttemptConfig {
  @:native("flight::path_formats::parse_svg_path_data")
  public static function parseSvgPathData(d:String):Null<flight.Path>;
}
#end
