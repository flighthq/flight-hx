// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_dashPath extends AttemptConfig {
  @:native("flight::path::dash_path")
  public static function dashPath(source:flight.Path, dash:Array<Float>, dashOffset:Float, out:flight.Path, ?tolerance:Float):Void;
}
#end
