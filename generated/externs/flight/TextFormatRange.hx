package flight;

#if hl

typedef TextFormatRange = flight._hl.TextFormatRange;

#elseif cpp

typedef TextFormatRange = flight._cpp.TextFormatRange;

#elseif (js && flight_esm)

typedef TextFormatRange = flight._js.TextFormatRange;

#elseif js

#error "flight.TextFormatRange on js requires flight_esm."

#else

#error "flight.TextFormatRange: no backend for this target."

#end
