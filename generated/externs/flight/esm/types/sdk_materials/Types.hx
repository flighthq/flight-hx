package flight.esm.types.sdk_materials;

#if (js && flight_esm)
typedef StandardMaterialKind = flight.esm.types.materials.Types.StandardMaterialKind;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
