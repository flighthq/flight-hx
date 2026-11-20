package flight;

#if hl

typedef AbortCallback = flight._hl.AbortCallback;

#elseif cpp

typedef AbortCallback = flight._cpp.AbortCallback;

#elseif (js && flight_esm)

typedef AbortCallback = flight._js.AbortCallback;

#elseif js

#error "flight.AbortCallback on js requires flight_esm."

#else

#error "flight.AbortCallback: no backend for this target."

#end
