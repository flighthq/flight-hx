// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path_formats/contract.hpp")
extern class Attempt_PathFormats_formatSvgPathData extends AttemptConfig {
  @:native("flight::path_formats::format_svg_path_data")
  public static function formatSvgPathData(path:flight.Path, ?options:flight.SvgPathDataFormatOptions):String;
}
#end
