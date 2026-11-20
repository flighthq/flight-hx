package flight;

#if hl

typedef FlightDocumentScene = flight._hl.FlightDocumentScene;

#elseif cpp

typedef FlightDocumentScene = flight._cpp.FlightDocumentScene;

#elseif (js && flight_esm)

typedef FlightDocumentScene = flight._js.FlightDocumentScene;

#elseif js

#error "flight.FlightDocumentScene on js requires flight_esm."

#else

#error "flight.FlightDocumentScene: no backend for this target."

#end
