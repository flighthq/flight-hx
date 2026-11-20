package flight;

#if hl

typedef DitherEffect = flight._hl.DitherEffect;

#elseif cpp

typedef DitherEffect = flight._cpp.DitherEffect;

#elseif (js && flight_esm)

typedef DitherEffect = flight._js.DitherEffect;

#elseif js

#error "flight.DitherEffect on js requires flight_esm."

#else

#error "flight.DitherEffect: no backend for this target."

#end
