package flight;

#if hl

typedef TextLayoutGroup = flight._hl.TextLayoutGroup;

#elseif cpp

typedef TextLayoutGroup = flight._cpp.TextLayoutGroup;

#elseif (js && flight_esm)

typedef TextLayoutGroup = flight._js.TextLayoutGroup;

#elseif js

#error "flight.TextLayoutGroup on js requires flight_esm."

#else

#error "flight.TextLayoutGroup: no backend for this target."

#end
