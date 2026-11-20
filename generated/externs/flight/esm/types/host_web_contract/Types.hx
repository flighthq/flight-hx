package flight.esm.types.host_web_contract;

#if (js && flight_esm)
typedef WebHost = flight.esm.types.host_web.Types.WebHost;

typedef WebHostGroups = flight.esm.types.host_web.Types.WebHostGroups;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
