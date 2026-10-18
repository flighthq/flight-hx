// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_buildStrokePathGeometry extends AttemptConfig {
  @:native("flight::path::build_stroke_path_geometry")
  public static function buildStrokePathGeometry(path:flight.Path, style:flight.StrokeStyle, tolerance:Float):{ issue:Dynamic, issueSubpath:Null<Float>, pieces:Array<{ closed:Bool, endCap:Array<Float>, left:Array<Float>, right:Array<Float>, startCap:Array<Float> }> };
}
#end
