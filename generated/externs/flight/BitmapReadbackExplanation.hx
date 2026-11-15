package flight;

#if hl

typedef BitmapReadbackExplanation = flight._hl.BitmapReadbackExplanation;

#elseif cpp

typedef BitmapReadbackExplanation = flight._cpp.BitmapReadbackExplanation;

#elseif (js && flight_esm)

typedef BitmapReadbackExplanation = flight._js.BitmapReadbackExplanation;

#elseif js

#error "flight.BitmapReadbackExplanation on js requires flight_esm."

#else

#error "flight.BitmapReadbackExplanation: no backend for this target."

#end
