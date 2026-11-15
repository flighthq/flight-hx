package flight;

#if hl

typedef TextSegmentRange = flight._hl.TextSegmentRange;

#elseif cpp

typedef TextSegmentRange = flight._cpp.TextSegmentRange;

#elseif (js && flight_esm)

typedef TextSegmentRange = flight._js.TextSegmentRange;

#elseif js

#error "flight.TextSegmentRange on js requires flight_esm."

#else

#error "flight.TextSegmentRange: no backend for this target."

#end
