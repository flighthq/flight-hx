// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_getPathContourLengths extends AttemptConfig {
  @:native("flight::path::get_path_contour_lengths")
  public static function getPathContourLengths(path:flight.Path, ?tolerance:Float):Array<Float>;
}
#end
