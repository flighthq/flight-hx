package flight;

#if hl

typedef RequirementBackend = flight._hl.RequirementBackend;

#elseif cpp

typedef RequirementBackend = flight._cpp.RequirementBackend;

#elseif (js && flight_esm)

typedef RequirementBackend = flight._js.RequirementBackend;

#elseif js

#error "flight.RequirementBackend on js requires flight_esm."

#else

#error "flight.RequirementBackend: no backend for this target."

#end
