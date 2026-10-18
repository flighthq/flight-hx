// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/requirement_codegen/contract.hpp")
extern class Attempt_RequirementCodegen_initializeRequirementCodegenPlan extends AttemptConfig {
  @:native("flight::requirement_codegen::initialize_requirement_codegen_plan")
  public static function initializeRequirementCodegenPlan(out:flight.EntityConstruction<Dynamic>, catalog:flight.RequirementCatalog, requirements:flight.RequirementSet, backend:String):Void;
}
#end
