package flight;

#if hl

typedef RequirementFacet = flight._hl.RequirementFacet;

#elseif cpp

typedef RequirementFacet = flight._cpp.RequirementFacet;

#elseif (js && flight_esm)

typedef RequirementFacet = flight._js.RequirementFacet;

#elseif js

#error "flight.RequirementFacet on js requires flight_esm."

#else

#error "flight.RequirementFacet: no backend for this target."

#end
