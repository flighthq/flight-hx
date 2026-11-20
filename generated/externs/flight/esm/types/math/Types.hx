package flight.esm.types.math;

#if (js && flight_esm)
typedef RandomSource = (() -> Float);

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
