// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_appendPathMoveTo extends AttemptConfig {
  @:native("flight::path::append_path_move_to")
  public static function appendPathMoveTo(path:flight.Path, x:Float, y:Float):Void;
}
#end
