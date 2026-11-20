package flight;

#if hl

typedef RequirementDisposition = flight._hl.RequirementDisposition;

#elseif cpp

typedef RequirementDisposition = flight._cpp.RequirementDisposition;

#elseif (js && flight_esm)

typedef RequirementDisposition = flight._js.RequirementDisposition;

#elseif js

#error "flight.RequirementDisposition on js requires flight_esm."

#else

#error "flight.RequirementDisposition: no backend for this target."

#end
