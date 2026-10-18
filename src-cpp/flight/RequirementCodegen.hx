// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function createRequirementCodegenPlan(catalog:flight.RequirementCatalog, requirements:flight.RequirementSet, backend:String):Dynamic {
  return flight._cpp._attempt.Attempt_RequirementCodegen_createRequirementCodegenPlan.createRequirementCodegenPlan(catalog, requirements, backend);
}

extern inline function initializeRequirementCodegenPlan(out:flight.EntityConstruction<Dynamic>, catalog:flight.RequirementCatalog, requirements:flight.RequirementSet, backend:String):Void {
  flight._cpp._attempt.Attempt_RequirementCodegen_initializeRequirementCodegenPlan.initializeRequirementCodegenPlan(out, catalog, requirements, backend);
}
