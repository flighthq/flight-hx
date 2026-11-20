package flight;

#if hl

typedef ModifierDefinition = flight._hl.ModifierDefinition;

#elseif cpp

typedef ModifierDefinition = flight._cpp.ModifierDefinition;

#elseif (js && flight_esm)

typedef ModifierDefinition = flight._js.ModifierDefinition;

#elseif js

#error "flight.ModifierDefinition on js requires flight_esm."

#else

#error "flight.ModifierDefinition: no backend for this target."

#end
