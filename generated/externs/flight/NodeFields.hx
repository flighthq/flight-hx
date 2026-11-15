package flight;

#if hl

typedef NodeFields = flight._hl.NodeFields;

#elseif cpp

typedef NodeFields = flight._cpp.NodeFields;

#elseif (js && flight_esm)

typedef NodeFields = flight._js.NodeFields;

#elseif js

#error "flight.NodeFields on js requires flight_esm."

#else

#error "flight.NodeFields: no backend for this target."

#end
