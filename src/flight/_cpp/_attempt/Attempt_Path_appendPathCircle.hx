// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_appendPathCircle extends AttemptConfig {
  @:native("flight::path::append_path_circle")
  public static function appendPathCircle(path:flight.Path, centerX:Float, centerY:Float, radius:Float):Void;
}
#end
