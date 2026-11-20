package flight;

#if hl

typedef TaaEffect = flight._hl.TaaEffect;

#elseif cpp

typedef TaaEffect = flight._cpp.TaaEffect;

#elseif (js && flight_esm)

typedef TaaEffect = flight._js.TaaEffect;

#elseif js

#error "flight.TaaEffect on js requires flight_esm."

#else

#error "flight.TaaEffect: no backend for this target."

#end
