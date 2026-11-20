package flight;

#if hl

typedef TextFeature = flight._hl.TextFeature;

#elseif cpp

typedef TextFeature = flight._cpp.TextFeature;

#elseif (js && flight_esm)

typedef TextFeature = flight._js.TextFeature;

#elseif js

#error "flight.TextFeature on js requires flight_esm."

#else

#error "flight.TextFeature: no backend for this target."

#end
