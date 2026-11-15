package flight;

#if hl

typedef MedianEffect = flight._hl.MedianEffect;

#elseif cpp

typedef MedianEffect = flight._cpp.MedianEffect;

#elseif (js && flight_esm)

typedef MedianEffect = flight._js.MedianEffect;

#elseif js

#error "flight.MedianEffect on js requires flight_esm."

#else

#error "flight.MedianEffect: no backend for this target."

#end
