package flight;

#if hl

typedef TextSegment = flight._hl.TextSegment;

#elseif cpp

typedef TextSegment = flight._cpp.TextSegment;

#elseif (js && flight_esm)

typedef TextSegment = flight._js.TextSegment;

#elseif js

#error "flight.TextSegment on js requires flight_esm."

#else

#error "flight.TextSegment: no backend for this target."

#end
