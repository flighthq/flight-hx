package flight;

#if hl

typedef TimelineFrameEvent = flight._hl.TimelineFrameEvent;

#elseif cpp

typedef TimelineFrameEvent = flight._cpp.TimelineFrameEvent;

#elseif (js && flight_esm)

typedef TimelineFrameEvent = flight._js.TimelineFrameEvent;

#elseif js

#error "flight.TimelineFrameEvent on js requires flight_esm."

#else

#error "flight.TimelineFrameEvent: no backend for this target."

#end
