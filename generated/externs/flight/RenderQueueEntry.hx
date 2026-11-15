package flight;

#if hl

typedef RenderQueueEntry = flight._hl.RenderQueueEntry;

#elseif cpp

typedef RenderQueueEntry = flight._cpp.RenderQueueEntry;

#elseif (js && flight_esm)

typedef RenderQueueEntry = flight._js.RenderQueueEntry;

#elseif js

#error "flight.RenderQueueEntry on js requires flight_esm."

#else

#error "flight.RenderQueueEntry: no backend for this target."

#end
