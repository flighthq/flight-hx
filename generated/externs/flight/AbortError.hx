package flight;

#if hl

typedef AbortError = flight._hl.AbortError;

#elseif cpp

typedef AbortError = flight._cpp.AbortError;

#elseif (js && flight_esm)

typedef AbortError = flight._js.AbortError;

#elseif js

#error "flight.AbortError on js requires flight_esm."

#else

#error "flight.AbortError: no backend for this target."

#end
