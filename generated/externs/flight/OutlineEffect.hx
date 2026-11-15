package flight;

#if hl

typedef OutlineEffect = flight._hl.OutlineEffect;

#elseif cpp

typedef OutlineEffect = flight._cpp.OutlineEffect;

#elseif (js && flight_esm)

typedef OutlineEffect = flight._js.OutlineEffect;

#elseif js

#error "flight.OutlineEffect on js requires flight_esm."

#else

#error "flight.OutlineEffect: no backend for this target."

#end
