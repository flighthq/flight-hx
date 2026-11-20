package flight;

#if hl

typedef PowerStatus = flight._hl.PowerStatus;

#elseif cpp

typedef PowerStatus = flight._cpp.PowerStatus;

#elseif (js && flight_esm)

typedef PowerStatus = flight._js.PowerStatus;

#elseif js

#error "flight.PowerStatus on js requires flight_esm."

#else

#error "flight.PowerStatus: no backend for this target."

#end
