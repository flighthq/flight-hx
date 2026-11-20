package flight;

#if hl

typedef ScanlinesEffect = flight._hl.ScanlinesEffect;

#elseif cpp

typedef ScanlinesEffect = flight._cpp.ScanlinesEffect;

#elseif (js && flight_esm)

typedef ScanlinesEffect = flight._js.ScanlinesEffect;

#elseif js

#error "flight.ScanlinesEffect on js requires flight_esm."

#else

#error "flight.ScanlinesEffect: no backend for this target."

#end
