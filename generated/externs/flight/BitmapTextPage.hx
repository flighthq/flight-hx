package flight;

#if hl

typedef BitmapTextPage = flight._hl.BitmapTextPage;

#elseif cpp

typedef BitmapTextPage = flight._cpp.BitmapTextPage;

#elseif (js && flight_esm)

typedef BitmapTextPage = flight._js.BitmapTextPage;

#elseif js

#error "flight.BitmapTextPage on js requires flight_esm."

#else

#error "flight.BitmapTextPage: no backend for this target."

#end
