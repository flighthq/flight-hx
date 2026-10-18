// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/requirement/contract.hpp")
extern class Attempt_Requirement_mergeRequirementSets extends AttemptConfig {
  @:native("flight::requirement::merge_requirement_sets")
  public static function mergeRequirementSets(requirementSets:Array<flight.RequirementSet>):flight.RequirementSet;
}
#end
