package flight;

#if hl

typedef BitmapHistogram = flight._hl.BitmapHistogram;

#elseif cpp

typedef BitmapHistogram = flight._cpp.BitmapHistogram;

#elseif (js && flight_esm)

typedef BitmapHistogram = flight._js.BitmapHistogram;

#elseif js

#error "flight.BitmapHistogram on js requires flight_esm."

#else

#error "flight.BitmapHistogram: no backend for this target."

#end
