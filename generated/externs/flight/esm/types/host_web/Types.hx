package flight.esm.types.host_web;

#if (js && flight_esm)
typedef WebHost = Dynamic;

typedef WebHostGroups = Dynamic;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
