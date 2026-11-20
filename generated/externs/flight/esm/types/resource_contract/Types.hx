package flight.esm.types.resource_contract;

#if (js && flight_esm)
typedef ResourceResolutionState = flight.esm.types.resource.Types.ResourceResolutionState;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
