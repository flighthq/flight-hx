package flight;

#if hl

typedef TextLabelContentExplanation = flight._hl.TextLabelContentExplanation;

#elseif cpp

typedef TextLabelContentExplanation = flight._cpp.TextLabelContentExplanation;

#elseif (js && flight_esm)

typedef TextLabelContentExplanation = flight._js.TextLabelContentExplanation;

#elseif js

#error "flight.TextLabelContentExplanation on js requires flight_esm."

#else

#error "flight.TextLabelContentExplanation: no backend for this target."

#end
