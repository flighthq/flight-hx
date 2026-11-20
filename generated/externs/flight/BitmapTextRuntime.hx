package flight;

#if hl

typedef BitmapTextRuntime = flight._hl.BitmapTextRuntime;

#elseif cpp

typedef BitmapTextRuntime = flight._cpp.BitmapTextRuntime;

#elseif (js && flight_esm)

typedef BitmapTextRuntime = flight._js.BitmapTextRuntime;

#elseif js

#error "flight.BitmapTextRuntime on js requires flight_esm."

#else

#error "flight.BitmapTextRuntime: no backend for this target."

#end
