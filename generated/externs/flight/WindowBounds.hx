package flight;

#if hl

typedef WindowBounds = flight._hl.WindowBounds;

#elseif cpp

typedef WindowBounds = flight._cpp.WindowBounds;

#elseif (js && flight_esm)

typedef WindowBounds = flight._js.WindowBounds;

#elseif js

#error "flight.WindowBounds on js requires flight_esm."

#else

#error "flight.WindowBounds: no backend for this target."

#end
