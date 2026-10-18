// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_appendPathLineTo extends AttemptConfig {
  @:native("flight::path::append_path_line_to")
  public static function appendPathLineTo(path:flight.Path, x:Float, y:Float):Void;
}
#end
