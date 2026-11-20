package flight;

#if hl

typedef PowerContext = flight._hl.PowerContext;

#elseif cpp

typedef PowerContext = flight._cpp.PowerContext;

#elseif (js && flight_esm)

typedef PowerContext = flight._js.PowerContext;

#elseif js

#error "flight.PowerContext on js requires flight_esm."

#else

#error "flight.PowerContext: no backend for this target."

#end
