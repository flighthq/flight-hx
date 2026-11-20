package flight.esm.types.sdk_tokens;

#if (js && flight_esm)
typedef FlightDocumentTokenResolution = flight.esm.types.tokens.Types.FlightDocumentTokenResolution;

typedef FlightDocumentTokenResolver = flight.esm.types.tokens.Types.FlightDocumentTokenResolver;

typedef FlightDocumentTokenResolverRegistry = flight.esm.types.tokens.Types.FlightDocumentTokenResolverRegistry;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
