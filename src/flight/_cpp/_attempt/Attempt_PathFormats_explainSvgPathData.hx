// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path_formats/contract.hpp")
extern class Attempt_PathFormats_explainSvgPathData extends AttemptConfig {
  @:native("flight::path_formats::explain_svg_path_data")
  public static function explainSvgPathData(d:String):Null<{ position:Float, reason:String }>;
}
#end
