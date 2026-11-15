package flight;

#if hl

typedef RiveProperty = flight._hl.RiveProperty;

#elseif cpp

typedef RiveProperty = flight._cpp.RiveProperty;

#elseif (js && flight_esm)

typedef RiveProperty = flight._js.RiveProperty;

#elseif js

#error "flight.RiveProperty on js requires flight_esm."

#else

#error "flight.RiveProperty: no backend for this target."

#end
