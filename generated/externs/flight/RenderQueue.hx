package flight;

#if hl

typedef RenderQueue = flight._hl.RenderQueue;

#elseif cpp

typedef RenderQueue = flight._cpp.RenderQueue;

#elseif (js && flight_esm)

typedef RenderQueue = flight._js.RenderQueue;

#elseif js

#error "flight.RenderQueue on js requires flight_esm."

#else

#error "flight.RenderQueue: no backend for this target."

#end
