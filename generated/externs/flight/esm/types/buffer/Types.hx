package flight.esm.types.buffer;

#if (js && flight_esm)
typedef ByteReader = { view:js.lib.Uint8Array, offset:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
