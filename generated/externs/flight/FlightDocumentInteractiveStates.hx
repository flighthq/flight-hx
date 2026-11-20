package flight;

#if hl

typedef FlightDocumentInteractiveStates = flight._hl.FlightDocumentInteractiveStates;

#elseif cpp

typedef FlightDocumentInteractiveStates = flight._cpp.FlightDocumentInteractiveStates;

#elseif (js && flight_esm)

typedef FlightDocumentInteractiveStates = flight._js.FlightDocumentInteractiveStates;

#elseif js

#error "flight.FlightDocumentInteractiveStates on js requires flight_esm."

#else

#error "flight.FlightDocumentInteractiveStates: no backend for this target."

#end
