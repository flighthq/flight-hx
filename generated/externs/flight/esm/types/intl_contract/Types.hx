package flight.esm.types.intl_contract;

#if (js && flight_esm)
typedef LocaleInput = flight.esm.types.intl.Types.LocaleInput;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
