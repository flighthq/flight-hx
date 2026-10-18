// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/requirement/contract.hpp")
extern class Attempt_Requirement_reportRequirement extends AttemptConfig {
  @:native("flight::requirement::report_requirement")
  public static function reportRequirement(sink:Null<Array<flight.Requirement>>, facet:flight.RequirementFacet, key:flight.Kind):Void;
}
#end
