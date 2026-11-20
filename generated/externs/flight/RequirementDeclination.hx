package flight;

#if hl

typedef RequirementDeclination = flight._hl.RequirementDeclination;

#elseif cpp

typedef RequirementDeclination = flight._cpp.RequirementDeclination;

#elseif (js && flight_esm)

typedef RequirementDeclination = flight._js.RequirementDeclination;

#elseif js

#error "flight.RequirementDeclination on js requires flight_esm."

#else

#error "flight.RequirementDeclination: no backend for this target."

#end
