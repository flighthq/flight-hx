package flight.esm.types.sdk_math;

#if (js && flight_esm)
typedef RandomSource = flight.esm.types.math.Types.RandomSource;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
