package flight;

#if hl

typedef TextLabel = flight._hl.TextLabel;

#elseif cpp

typedef TextLabel = flight._cpp.TextLabel;

#elseif (js && flight_esm)

typedef TextLabel = flight._js.TextLabel;

#elseif js

#error "flight.TextLabel on js requires flight_esm."

#else

#error "flight.TextLabel: no backend for this target."

#end
