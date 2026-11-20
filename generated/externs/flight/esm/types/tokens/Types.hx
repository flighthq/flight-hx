package flight.esm.types.tokens;

#if (js && flight_esm)
typedef FlightDocumentTokenResolution = { mode:String, values:Dynamic };

typedef FlightDocumentTokenResolver = ((value:flight.esm.types.scene_document.Types.FlightDocumentValue, token:flight.esm.types.scene_document.Types.FlightDocumentToken) -> flight.esm.types.scene_document.Types.FlightDocumentValue);

typedef FlightDocumentTokenResolverRegistry = { resolvers:js.lib.Map<String, flight.esm.types.tokens.Types.FlightDocumentTokenResolver> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
