// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/requirement/contract.hpp")
extern class Attempt_Requirement_initializeRequirementSet extends AttemptConfig {
  @:native("flight::requirement::initialize_requirement_set")
  public static function initializeRequirementSet(out:flight.EntityConstruction<flight.RequirementSet>, covers:Array<flight.RequirementFacet>, requirements:Array<flight.Requirement>):Void;
}
#end
