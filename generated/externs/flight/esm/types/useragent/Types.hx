package flight.esm.types.useragent;

#if (js && flight_esm)
typedef DeviceFormFactor = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
