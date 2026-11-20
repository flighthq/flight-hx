package flight.esm.types.sdk_useragent;

#if (js && flight_esm)
typedef DeviceFormFactor = flight.esm.types.useragent.Types.DeviceFormFactor;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
