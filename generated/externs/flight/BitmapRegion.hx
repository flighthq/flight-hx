package flight;

#if hl

typedef BitmapRegion = flight._hl.BitmapRegion;

#elseif cpp

typedef BitmapRegion = flight._cpp.BitmapRegion;

#elseif (js && flight_esm)

typedef BitmapRegion = flight._js.BitmapRegion;

#elseif js

#error "flight.BitmapRegion on js requires flight_esm."

#else

#error "flight.BitmapRegion: no backend for this target."

#end
