package flight;

#if hl

typedef Viewport = flight._hl.Viewport;

#elseif cpp

typedef Viewport = flight._cpp.Viewport;

#elseif (js && flight_esm)

typedef Viewport = flight._js.Viewport;

#elseif js

#error "flight.Viewport on js requires flight_esm."

#else

#error "flight.Viewport: no backend for this target."

#end
