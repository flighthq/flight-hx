package flight;

#if hl

typedef PanniniProjectionEffect = flight._hl.PanniniProjectionEffect;

#elseif cpp

typedef PanniniProjectionEffect = flight._cpp.PanniniProjectionEffect;

#elseif (js && flight_esm)

typedef PanniniProjectionEffect = flight._js.PanniniProjectionEffect;

#elseif js

#error "flight.PanniniProjectionEffect on js requires flight_esm."

#else

#error "flight.PanniniProjectionEffect: no backend for this target."

#end
