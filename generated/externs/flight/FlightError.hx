package flight;

#if hl

typedef FlightError = flight._hl.FlightError;

#elseif cpp

typedef FlightError = flight._cpp.FlightError;

#elseif (js && flight_esm)

typedef FlightError = flight._js.FlightError;

#elseif js

#error "flight.FlightError on js requires flight_esm."

#else

#error "flight.FlightError: no backend for this target."

#end
