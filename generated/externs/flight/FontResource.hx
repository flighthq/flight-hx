package flight;

#if hl

typedef FontResource = flight._hl.FontResource;

#elseif cpp

typedef FontResource = flight._cpp.FontResource;

#elseif (js && flight_esm)

typedef FontResource = flight._js.FontResource;

#elseif js

#error "flight.FontResource on js requires flight_esm."

#else

#error "flight.FontResource: no backend for this target."

#end
