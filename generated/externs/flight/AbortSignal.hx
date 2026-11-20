package flight;

#if hl

typedef AbortSignal = flight._hl.AbortSignal;

#elseif cpp

typedef AbortSignal = flight._cpp.AbortSignal;

#elseif (js && flight_esm)

typedef AbortSignal = flight._js.AbortSignal;

#elseif js

#error "flight.AbortSignal on js requires flight_esm."

#else

#error "flight.AbortSignal: no backend for this target."

#end
