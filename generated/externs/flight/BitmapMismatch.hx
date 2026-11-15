package flight;

#if hl

typedef BitmapMismatch = flight._hl.BitmapMismatch;

#elseif cpp

typedef BitmapMismatch = flight._cpp.BitmapMismatch;

#elseif (js && flight_esm)

typedef BitmapMismatch = flight._js.BitmapMismatch;

#elseif js

#error "flight.BitmapMismatch on js requires flight_esm."

#else

#error "flight.BitmapMismatch: no backend for this target."

#end
