package flight;

#if hl

typedef TextItem = flight._hl.TextItem;

#elseif cpp

typedef TextItem = flight._cpp.TextItem;

#elseif (js && flight_esm)

typedef TextItem = flight._js.TextItem;

#elseif js

#error "flight.TextItem on js requires flight_esm."

#else

#error "flight.TextItem: no backend for this target."

#end
