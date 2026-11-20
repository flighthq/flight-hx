package flight;

#if hl

typedef FlightDocumentSchemaRegistry = flight._hl.FlightDocumentSchemaRegistry;

#elseif cpp

typedef FlightDocumentSchemaRegistry = flight._cpp.FlightDocumentSchemaRegistry;

#elseif (js && flight_esm)

typedef FlightDocumentSchemaRegistry = flight._js.FlightDocumentSchemaRegistry;

#elseif js

#error "flight.FlightDocumentSchemaRegistry on js requires flight_esm."

#else

#error "flight.FlightDocumentSchemaRegistry: no backend for this target."

#end
