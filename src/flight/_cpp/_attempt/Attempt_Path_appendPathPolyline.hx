// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_appendPathPolyline extends AttemptConfig {
  @:native("flight::path::append_path_polyline")
  public static function appendPathPolyline(path:flight.Path, points:Array<Float>):Void;
}
#end
