package flight.esm.types.materials;

#if (js && flight_esm)
typedef StandardMaterialKind = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
