// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/requirement/contract.hpp")
extern class Attempt_Requirement_collectScene2DRequirements extends AttemptConfig {
  @:native("flight::requirement::collect_scene_2d_requirements")
  public static function collectScene2DRequirements(run:(Array<flight.Requirement>)->Void):flight.RequirementSet;
}
#end
