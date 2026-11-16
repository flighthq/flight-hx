package flight;

#if hl

typedef BitmapCompositeMode = flight._hl.BitmapCompositeMode;

#elseif cpp

typedef BitmapCompositeMode = flight._cpp.BitmapCompositeMode;

#elseif (js && flight_esm)

typedef BitmapCompositeMode = flight._js.BitmapCompositeMode;

#elseif js

#error "flight.BitmapCompositeMode on js requires flight_esm."

#else

#error "flight.BitmapCompositeMode: no backend for this target."

#end
