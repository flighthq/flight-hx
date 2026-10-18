// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_explainPathMorphCreation extends AttemptConfig {
  @:native("flight::path::explain_path_morph_creation")
  public static function explainPathMorphCreation(start:flight.Path, end:flight.Path):flight.PathMorphCreationExplanation;
}
#end
