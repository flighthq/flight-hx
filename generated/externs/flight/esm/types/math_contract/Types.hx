package flight.esm.types.math_contract;

#if (js && flight_esm)
typedef MutableNumberArray = Dynamic;

typedef RandomSource = flight.esm.types.math.Types.RandomSource;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
