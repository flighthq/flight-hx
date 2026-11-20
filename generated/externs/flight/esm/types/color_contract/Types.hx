package flight.esm.types.color_contract;

#if (js && flight_esm)
typedef HslColor = flight.esm.types.color.Types.HslColor;

typedef HslColorRaw = { h:Float, s:Float, l:Float };

typedef HsvColor = flight.esm.types.color.Types.HsvColor;

typedef HsvColorRaw = { h:Float, s:Float, v:Float };

typedef LinearColor = flight.esm.types.color.Types.LinearColor;

typedef LinearColorRaw = { r:Float, g:Float, b:Float, a:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
