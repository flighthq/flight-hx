package flight.esm.types.intl;

#if (js && flight_esm)
typedef LocaleInput = Dynamic;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
