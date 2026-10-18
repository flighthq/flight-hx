// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/requirement/contract.hpp")
extern class Attempt_Requirement_createRequirementSet extends AttemptConfig {
  @:native("flight::requirement::create_requirement_set")
  public static function createRequirementSet(covers:Array<flight.RequirementFacet>, requirements:Array<flight.Requirement>):flight.RequirementSet;
}
#end
