package flight;

#if hl

typedef FlightDocumentTokenResolverRegistry = flight._hl.FlightDocumentTokenResolverRegistry;

#elseif cpp

typedef FlightDocumentTokenResolverRegistry = flight._cpp.FlightDocumentTokenResolverRegistry;

#elseif (js && flight_esm)

typedef FlightDocumentTokenResolverRegistry = flight._js.FlightDocumentTokenResolverRegistry;

#elseif js

#error "flight.FlightDocumentTokenResolverRegistry on js requires flight_esm."

#else

#error "flight.FlightDocumentTokenResolverRegistry: no backend for this target."

#end
