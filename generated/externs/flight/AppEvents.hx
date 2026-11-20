package flight;

#if hl

typedef AppEvents = flight._hl.AppEvents;

#elseif cpp

typedef AppEvents = flight._cpp.AppEvents;

#elseif (js && flight_esm)

typedef AppEvents = flight._js.AppEvents;

#elseif js

#error "flight.AppEvents on js requires flight_esm."

#else

#error "flight.AppEvents: no backend for this target."

#end
