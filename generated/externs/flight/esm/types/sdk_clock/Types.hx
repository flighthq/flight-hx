package flight.esm.types.sdk_clock;

#if (js && flight_esm)
typedef Clock = flight.esm.types.clock.Types.Clock;

typedef ClockOptions = flight.esm.types.clock.Types.ClockOptions;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
