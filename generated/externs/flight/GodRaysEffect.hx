package flight;

#if hl

typedef GodRaysEffect = flight._hl.GodRaysEffect;

#elseif cpp

typedef GodRaysEffect = flight._cpp.GodRaysEffect;

#elseif (js && flight_esm)

typedef GodRaysEffect = flight._js.GodRaysEffect;

#elseif js

#error "flight.GodRaysEffect on js requires flight_esm."

#else

#error "flight.GodRaysEffect: no backend for this target."

#end
