package flight;

#if (js && flight_esm)
extern inline function createRequirementCodegenPlan(catalog:RequirementCatalog, requirements:RequirementSet, backend:String):RequirementCodegenPlan {
	return flight._js._fn.RequirementCodegen.createRequirementCodegenPlan(catalog, requirements, backend);
}
#else
extern inline function createRequirementCodegenPlan(catalog:RequirementCatalog, requirements:RequirementSet, backend:String):RequirementCodegenPlan {
#if hl
	return flight._hl._fn.RequirementCodegen.createRequirementCodegenPlan(catalog, requirements, cast backend);
#elseif cpp
	return flight._cpp._fn.RequirementCodegen.createRequirementCodegenPlan(catalog, requirements, cast backend);
#elseif (js && flight_esm)
	return flight._js._fn.RequirementCodegen.createRequirementCodegenPlan(catalog, requirements, backend);
#else
	#error "flight.RequirementCodegen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeRequirementCodegenPlan(ptr:RequirementCodegenPlan):Void {
	flight._js._fn.RequirementCodegen.freeRequirementCodegenPlan(ptr);
}
#else
extern inline function freeRequirementCodegenPlan(ptr:RequirementCodegenPlan):Void {
#if hl
	flight._hl._fn.RequirementCodegen.freeRequirementCodegenPlan(ptr);
#elseif cpp
	flight._cpp._fn.RequirementCodegen.freeRequirementCodegenPlan(ptr);
#elseif (js && flight_esm)
	flight._js._fn.RequirementCodegen.freeRequirementCodegenPlan(ptr);
#else
	#error "flight.RequirementCodegen: no backend for this target."
#end
}
#end
