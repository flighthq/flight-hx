// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_initializePathMorph extends AttemptConfig {
  @:native("flight::path::initialize_path_morph")
  public static function initializePathMorph(out:flight.EntityConstruction<flight.PathMorph>, commands:Array<Float>, endData:Array<Float>, startData:Array<Float>, winding:flight.PathWinding):Void;
}
#end
