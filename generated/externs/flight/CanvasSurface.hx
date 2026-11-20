package flight;

#if hl

typedef CanvasSurface = flight._hl.CanvasSurface;

#elseif cpp

typedef CanvasSurface = flight._cpp.CanvasSurface;

#elseif (js && flight_esm)

typedef CanvasSurface = flight._js.CanvasSurface;

#elseif js

#error "flight.CanvasSurface on js requires flight_esm."

#else

#error "flight.CanvasSurface: no backend for this target."

#end
