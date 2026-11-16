package flight;

#if hl
typedef NativeByteBuffer = flight._hl.NativeByteBuffer;
#elseif cpp
typedef NativeByteBuffer = flight._cpp.NativeByteBuffer;
#elseif (js && flight_esm)
typedef NativeByteBuffer = js.lib.Uint8Array;
#else
#error "Flight requires cpp, hl, or JS with flight_esm."
#end
