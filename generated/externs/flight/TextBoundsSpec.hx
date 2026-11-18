package flight;

#if hl

typedef TextBoundsSpec = flight._hl.TextBoundsSpec;

#elseif cpp

typedef TextBoundsSpec = flight._cpp.TextBoundsSpec;

#elseif (js && flight_esm)

typedef TextBoundsSpec = flight._js.TextBoundsSpec;

#elseif js

#error "flight.TextBoundsSpec on js requires flight_esm."

#else

#error "flight.TextBoundsSpec: no backend for this target."

#end
