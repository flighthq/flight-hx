package flight;

#if hl

typedef FlightNodeArray = flight._hl.FlightNodeArray;

#elseif cpp

typedef FlightNodeArray = flight._cpp.FlightNodeArray;

#elseif (js && flight_esm)

extern class FlightNodeArray {}

#elseif js

#error "flight.FlightNodeArray on js requires flight_esm."

#else

#error "flight.FlightNodeArray: no backend for this target."

#end
