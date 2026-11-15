package flight;

#if hl

typedef TimelineFrameArg = flight._hl.TimelineFrameArg;

#elseif cpp

typedef TimelineFrameArg = flight._cpp.TimelineFrameArg;

#elseif (js && flight_esm)

typedef TimelineFrameArg = flight._js.TimelineFrameArg;

#elseif js

#error "flight.TimelineFrameArg on js requires flight_esm."

#else

#error "flight.TimelineFrameArg: no backend for this target."

#end
