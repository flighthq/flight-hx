package flight;

#if hl

typedef ColorLutCache = flight._hl.ColorLutCache;

#elseif cpp

typedef ColorLutCache = flight._cpp.ColorLutCache;

#elseif (js && flight_esm)

typedef ColorLutCache = flight._js.ColorLutCache;

#elseif js

#error "flight.ColorLutCache on js requires flight_esm."

#else

#error "flight.ColorLutCache: no backend for this target."

#end
