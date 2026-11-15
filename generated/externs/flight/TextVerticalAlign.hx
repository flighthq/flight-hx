package flight;

#if hl

typedef TextVerticalAlign = flight._hl.TextVerticalAlign;

#elseif cpp

typedef TextVerticalAlign = flight._cpp.TextVerticalAlign;

#elseif (js && flight_esm)

typedef TextVerticalAlign = flight._js.TextVerticalAlign;

#elseif js

#error "flight.TextVerticalAlign on js requires flight_esm."

#else

#error "flight.TextVerticalAlign: no backend for this target."

#end
