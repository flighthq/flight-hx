package flight;

#if hl

typedef CrtEffect = flight._hl.CrtEffect;

#elseif cpp

typedef CrtEffect = flight._cpp.CrtEffect;

#elseif (js && flight_esm)

typedef CrtEffect = flight._js.CrtEffect;

#elseif js

#error "flight.CrtEffect on js requires flight_esm."

#else

#error "flight.CrtEffect: no backend for this target."

#end
