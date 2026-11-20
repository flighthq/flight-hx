package flight;

#if hl

typedef FlightDocumentRefusalExplanation = flight._hl.FlightDocumentRefusalExplanation;

#elseif cpp

typedef FlightDocumentRefusalExplanation = flight._cpp.FlightDocumentRefusalExplanation;

#elseif (js && flight_esm)

typedef FlightDocumentRefusalExplanation = flight._js.FlightDocumentRefusalExplanation;

#elseif js

#error "flight.FlightDocumentRefusalExplanation on js requires flight_esm."

#else

#error "flight.FlightDocumentRefusalExplanation: no backend for this target."

#end
