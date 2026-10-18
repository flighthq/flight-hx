// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_samplePathMorph extends AttemptConfig {
  @:native("flight::path::sample_path_morph")
  public static function samplePathMorph(out:flight.Path, morph:flight.PathMorph, progress:Float):Void;
}
#end
