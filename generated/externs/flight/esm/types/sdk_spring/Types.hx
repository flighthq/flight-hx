package flight.esm.types.sdk_spring;

#if (js && flight_esm)
typedef Spring = flight.esm.types.spring.Types.Spring;

typedef Spring2D = flight.esm.types.spring.Types.Spring2D;

typedef Spring3D = flight.esm.types.spring.Types.Spring3D;

typedef SpringConfig = flight.esm.types.spring.Types.SpringConfig;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
