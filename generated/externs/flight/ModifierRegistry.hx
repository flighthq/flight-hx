package flight;

#if hl

typedef ModifierRegistry = flight._hl.ModifierRegistry;

#elseif cpp

typedef ModifierRegistry = flight._cpp.ModifierRegistry;

#elseif (js && flight_esm)

typedef ModifierRegistry = flight._js.ModifierRegistry;

#elseif js

#error "flight.ModifierRegistry on js requires flight_esm."

#else

#error "flight.ModifierRegistry: no backend for this target."

#end
