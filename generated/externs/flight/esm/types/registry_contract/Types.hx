package flight.esm.types.registry_contract;

#if (js && flight_esm)
typedef OrdinalTable<T> = { entries:Array<Null<T>>, vocabulary:Array<String> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
