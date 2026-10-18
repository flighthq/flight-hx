// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_fitPathCurves extends AttemptConfig {
  @:native("flight::path::fit_path_curves")
  public static function fitPathCurves(source:flight.Path, tolerance:Float, out:flight.Path, ?flattenTolerance:Float):Void;
}
#end
