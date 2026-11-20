package flight.esm.types.sdk_color;

#if (js && flight_esm)
typedef HslColor = flight.esm.types.color.Types.HslColor;

typedef HsvColor = flight.esm.types.color.Types.HsvColor;

typedef LinearColor = flight.esm.types.color.Types.LinearColor;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
