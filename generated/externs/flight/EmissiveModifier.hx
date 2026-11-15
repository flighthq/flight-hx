package flight;

#if hl

typedef EmissiveModifier = flight._hl.EmissiveModifier;

#elseif cpp

typedef EmissiveModifier = flight._cpp.EmissiveModifier;

#elseif (js && flight_esm)

typedef EmissiveModifier = flight._js.EmissiveModifier;

#elseif js

#error "flight.EmissiveModifier on js requires flight_esm."

#else

#error "flight.EmissiveModifier: no backend for this target."

#end
