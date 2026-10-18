// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_appendPathRoundedRectangle extends AttemptConfig {
  @:native("flight::path::append_path_rounded_rectangle")
  public static function appendPathRoundedRectangle(path:flight.Path, x:Float, y:Float, width:Float, height:Float, radius:Float):Void;
}
#end
