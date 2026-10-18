// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_appendPathEllipse extends AttemptConfig {
  @:native("flight::path::append_path_ellipse")
  public static function appendPathEllipse(path:flight.Path, centerX:Float, centerY:Float, radiusX:Float, radiusY:Float):Void;
}
#end
