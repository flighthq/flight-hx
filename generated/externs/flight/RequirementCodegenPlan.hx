package flight;

#if hl

typedef RequirementCodegenPlan = flight._hl.RequirementCodegenPlan;

#elseif cpp

typedef RequirementCodegenPlan = flight._cpp.RequirementCodegenPlan;

#elseif (js && flight_esm)

typedef RequirementCodegenPlan = flight._js.RequirementCodegenPlan;

#elseif js

#error "flight.RequirementCodegenPlan on js requires flight_esm."

#else

#error "flight.RequirementCodegenPlan: no backend for this target."

#end
