package flight.esm.types.sdk_buffer;

#if (js && flight_esm)
typedef ByteReader = flight.esm.types.buffer.Types.ByteReader;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
