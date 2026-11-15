package flight;

#if hl

typedef BevelEffect = flight._hl.BevelEffect;

#elseif cpp

typedef BevelEffect = flight._cpp.BevelEffect;

#elseif (js && flight_esm)

typedef BevelEffect = flight._js.BevelEffect;

#elseif js

#error "flight.BevelEffect on js requires flight_esm."

#else

#error "flight.BevelEffect: no backend for this target."

#end
