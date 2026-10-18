// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

typedef Requirement = flight._cpp.Requirement;

extern inline function collectScene2DRequirements(run:(Array<flight.Requirement>)->Void):flight.RequirementSet {
  return flight._cpp._attempt.Attempt_Requirement_collectScene2DRequirements.collectScene2DRequirements(run);
}

extern inline function createRequirementSet(covers:Array<flight.RequirementFacet>, requirements:Array<flight.Requirement>):flight.RequirementSet {
  return flight._cpp._attempt.Attempt_Requirement_createRequirementSet.createRequirementSet(covers, requirements);
}

extern inline function diffRequirementSets(requirements:flight.RequirementSet, baseline:flight.RequirementSet):flight.RequirementSet {
  return flight._cpp._attempt.Attempt_Requirement_diffRequirementSets.diffRequirementSets(requirements, baseline);
}

extern inline function initializeRequirementSet(out:flight.EntityConstruction<flight.RequirementSet>, covers:Array<flight.RequirementFacet>, requirements:Array<flight.Requirement>):Void {
  flight._cpp._attempt.Attempt_Requirement_initializeRequirementSet.initializeRequirementSet(out, covers, requirements);
}

extern inline function mergeRequirementSets(requirementSets:Array<flight.RequirementSet>):flight.RequirementSet {
  return flight._cpp._attempt.Attempt_Requirement_mergeRequirementSets.mergeRequirementSets(requirementSets);
}

extern inline function reportRequirement(sink:Null<Array<flight.Requirement>>, facet:flight.RequirementFacet, key:flight.Kind):Void {
  flight._cpp._attempt.Attempt_Requirement_reportRequirement.reportRequirement(sink, facet, key);
}
