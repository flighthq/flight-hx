// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_translatePath extends AttemptConfig {
  @:native("flight::path::translate_path")
  public static function translatePath(source:flight.Path, dx:Float, dy:Float, out:flight.Path):Void;
}
#end
