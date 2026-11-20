package flight;

#if hl

typedef BitmapTextData = flight._hl.BitmapTextData;

#elseif cpp

typedef BitmapTextData = flight._cpp.BitmapTextData;

#elseif (js && flight_esm)

typedef BitmapTextData = flight._js.BitmapTextData;

#elseif js

#error "flight.BitmapTextData on js requires flight_esm."

#else

#error "flight.BitmapTextData: no backend for this target."

#end
