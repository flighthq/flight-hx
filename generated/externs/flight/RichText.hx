package flight;

#if hl

typedef RichText = flight._hl.RichText;

#elseif cpp

typedef RichText = flight._cpp.RichText;

#elseif (js && flight_esm)

typedef RichText = flight._js.RichText;

#elseif js

#error "flight.RichText on js requires flight_esm."

#else

#error "flight.RichText: no backend for this target."

#end
