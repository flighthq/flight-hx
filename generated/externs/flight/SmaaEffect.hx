package flight;

#if hl

typedef SmaaEffect = flight._hl.SmaaEffect;

#elseif cpp

typedef SmaaEffect = flight._cpp.SmaaEffect;

#elseif (js && flight_esm)

typedef SmaaEffect = flight._js.SmaaEffect;

#elseif js

#error "flight.SmaaEffect on js requires flight_esm."

#else

#error "flight.SmaaEffect: no backend for this target."

#end
