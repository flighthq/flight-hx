package flight;

#if hl

typedef RequirementSet = flight._hl.RequirementSet;

#elseif cpp

typedef RequirementSet = flight._cpp.RequirementSet;

#elseif (js && flight_esm)

typedef RequirementSet = flight._js.RequirementSet;

#elseif js

#error "flight.RequirementSet on js requires flight_esm."

#else

#error "flight.RequirementSet: no backend for this target."

#end
