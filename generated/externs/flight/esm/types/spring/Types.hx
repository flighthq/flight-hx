package flight.esm.types.spring;

#if (js && flight_esm)
typedef Spring = { value:Float, velocity:Float };

typedef Spring2D = { x:flight.esm.types.spring.Types.Spring, y:flight.esm.types.spring.Types.Spring };

typedef Spring3D = { x:flight.esm.types.spring.Types.Spring, y:flight.esm.types.spring.Types.Spring, z:flight.esm.types.spring.Types.Spring };

typedef SpringConfig = { dampingRatio:Float, frequency:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
