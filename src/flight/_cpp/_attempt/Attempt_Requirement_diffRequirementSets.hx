// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/requirement/contract.hpp")
extern class Attempt_Requirement_diffRequirementSets extends AttemptConfig {
  @:native("flight::requirement::diff_requirement_sets")
  public static function diffRequirementSets(requirements:flight.RequirementSet, baseline:flight.RequirementSet):flight.RequirementSet;
}
#end
