package flight;

#if hl

typedef Requirement = flight._hl.Requirement;

#elseif cpp

typedef Requirement = flight._cpp.Requirement;

#elseif (js && flight_esm)

typedef Requirement = flight._js.Requirement;

#elseif js

#error "flight.Requirement on js requires flight_esm."

#else

#error "flight.Requirement: no backend for this target."

#end

#if (js && flight_esm)
extern inline function collectScene2dRequirements(run:Dynamic):RequirementSet {
	return flight._js._fn.Requirement.collectScene2dRequirements(run);
}
#else
extern inline function collectScene2dRequirements(runFn:Dynamic, runCtx:Dynamic):RequirementSet {
#if hl
	return flight._hl._fn.Requirement.collectScene2dRequirements(runFn, runCtx);
#elseif cpp
	return flight._cpp._fn.Requirement.collectScene2dRequirements(runFn, runCtx);
#elseif (js && flight_esm)
	return flight._js._fn.Requirement.collectScene2dRequirements(runFn, runCtx);
#else
	#error "flight.Requirement: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createRequirementSet(covers:Dynamic, requirements:Dynamic):RequirementSet {
	return flight._js._fn.Requirement.createRequirementSet(covers, requirements);
}
#else
extern inline function createRequirementSet(covers:Dynamic, coversLen:Int, requirements:Dynamic, requirementsLen:Int):RequirementSet {
#if hl
	return flight._hl._fn.Requirement.createRequirementSet(covers, coversLen, requirements, requirementsLen);
#elseif cpp
	return flight._cpp._fn.Requirement.createRequirementSet(covers, coversLen, requirements, requirementsLen);
#elseif (js && flight_esm)
	return flight._js._fn.Requirement.createRequirementSet(covers, coversLen, requirements, requirementsLen);
#else
	#error "flight.Requirement: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function diffRequirementSets(requirements:RequirementSet, baseline:RequirementSet):RequirementSet {
	return flight._js._fn.Requirement.diffRequirementSets(requirements, baseline);
}
#else
extern inline function diffRequirementSets(requirements:RequirementSet, baseline:RequirementSet):RequirementSet {
#if hl
	return flight._hl._fn.Requirement.diffRequirementSets(requirements, baseline);
#elseif cpp
	return flight._cpp._fn.Requirement.diffRequirementSets(requirements, baseline);
#elseif (js && flight_esm)
	return flight._js._fn.Requirement.diffRequirementSets(requirements, baseline);
#else
	#error "flight.Requirement: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function mergeRequirementSets(requirementSets:Dynamic):RequirementSet {
	return flight._js._fn.Requirement.mergeRequirementSets(requirementSets);
}
#else
extern inline function mergeRequirementSets(requirementSets:Dynamic, requirementSetsLen:Int):RequirementSet {
#if hl
	return flight._hl._fn.Requirement.mergeRequirementSets(requirementSets, requirementSetsLen);
#elseif cpp
	return flight._cpp._fn.Requirement.mergeRequirementSets(requirementSets, requirementSetsLen);
#elseif (js && flight_esm)
	return flight._js._fn.Requirement.mergeRequirementSets(requirementSets, requirementSetsLen);
#else
	#error "flight.Requirement: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeRequirementSet(ptr:RequirementSet):Void {
	flight._js._fn.Requirement.freeRequirementSet(ptr);
}
#else
extern inline function freeRequirementSet(ptr:RequirementSet):Void {
#if hl
	flight._hl._fn.Requirement.freeRequirementSet(ptr);
#elseif cpp
	flight._cpp._fn.Requirement.freeRequirementSet(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Requirement.freeRequirementSet(ptr);
#else
	#error "flight.Requirement: no backend for this target."
#end
}
#end
