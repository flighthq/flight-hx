package flight;

#if hl

typedef FlightNode = flight._hl.FlightNode;

#elseif cpp

typedef FlightNode = flight._cpp.FlightNode;

#elseif (js && flight_esm)

extern class FlightNode {}

#elseif js

#error "flight.FlightNode on js requires flight_esm."

#else

#error "flight.FlightNode: no backend for this target."

#end
