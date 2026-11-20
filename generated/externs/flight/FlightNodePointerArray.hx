package flight;

#if hl

typedef FlightNodePointerArray = flight._hl.FlightNodePointerArray;

#elseif cpp

typedef FlightNodePointerArray = flight._cpp.FlightNodePointerArray;

#elseif (js && flight_esm)

extern class FlightNodePointerArray {}

#elseif js

#error "flight.FlightNodePointerArray on js requires flight_esm."

#else

#error "flight.FlightNodePointerArray: no backend for this target."

#end
