package flight;

#if hl

typedef BloomEffect = flight._hl.BloomEffect;

#elseif cpp

typedef BloomEffect = flight._cpp.BloomEffect;

#elseif (js && flight_esm)

typedef BloomEffect = flight._js.BloomEffect;

#elseif js

#error "flight.BloomEffect on js requires flight_esm."

#else

#error "flight.BloomEffect: no backend for this target."

#end
