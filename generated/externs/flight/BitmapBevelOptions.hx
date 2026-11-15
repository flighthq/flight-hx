package flight;

#if hl

typedef BitmapBevelOptions = flight._hl.BitmapBevelOptions;

#elseif cpp

typedef BitmapBevelOptions = flight._cpp.BitmapBevelOptions;

#elseif (js && flight_esm)

typedef BitmapBevelOptions = flight._js.BitmapBevelOptions;

#elseif js

#error "flight.BitmapBevelOptions on js requires flight_esm."

#else

#error "flight.BitmapBevelOptions: no backend for this target."

#end
