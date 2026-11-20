package flight.esm.types.resource;

#if (js && flight_esm)
typedef ResourceResolutionState = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
