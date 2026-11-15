package flight;

#if hl

typedef DissolveModifier = flight._hl.DissolveModifier;

#elseif cpp

typedef DissolveModifier = flight._cpp.DissolveModifier;

#elseif (js && flight_esm)

typedef DissolveModifier = flight._js.DissolveModifier;

#elseif js

#error "flight.DissolveModifier on js requires flight_esm."

#else

#error "flight.DissolveModifier: no backend for this target."

#end
