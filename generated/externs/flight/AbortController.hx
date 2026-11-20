package flight;

#if hl

typedef AbortController = flight._hl.AbortController;

#elseif cpp

typedef AbortController = flight._cpp.AbortController;

#elseif (js && flight_esm)

typedef AbortController = flight._js.AbortController;

#elseif js

#error "flight.AbortController on js requires flight_esm."

#else

#error "flight.AbortController: no backend for this target."

#end
