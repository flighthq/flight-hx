// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_decimatePath extends AttemptConfig {
  @:native("flight::path::decimate_path")
  public static function decimatePath(source:flight.Path, tolerance:Float, out:flight.Path, ?flattenTolerance:Float):Void;
}
#end
