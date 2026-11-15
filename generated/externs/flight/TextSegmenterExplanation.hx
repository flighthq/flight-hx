package flight;

#if hl

typedef TextSegmenterExplanation = flight._hl.TextSegmenterExplanation;

#elseif cpp

typedef TextSegmenterExplanation = flight._cpp.TextSegmenterExplanation;

#elseif (js && flight_esm)

typedef TextSegmenterExplanation = flight._js.TextSegmenterExplanation;

#elseif js

#error "flight.TextSegmenterExplanation on js requires flight_esm."

#else

#error "flight.TextSegmenterExplanation: no backend for this target."

#end
