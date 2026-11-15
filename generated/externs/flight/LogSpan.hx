package flight;

#if hl

typedef LogSpan = flight._hl.LogSpan;

#elseif cpp

typedef LogSpan = flight._cpp.LogSpan;

#elseif (js && flight_esm)

typedef LogSpan = flight._js.LogSpan;

#elseif js

#error "flight.LogSpan on js requires flight_esm."

#else

#error "flight.LogSpan: no backend for this target."

#end
