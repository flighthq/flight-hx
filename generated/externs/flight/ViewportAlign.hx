package flight;

#if hl

typedef ViewportAlign = flight._hl.ViewportAlign;

#elseif cpp

typedef ViewportAlign = flight._cpp.ViewportAlign;

#elseif (js && flight_esm)

typedef ViewportAlign = flight._js.ViewportAlign;

#elseif js

#error "flight.ViewportAlign on js requires flight_esm."

#else

#error "flight.ViewportAlign: no backend for this target."

#end
