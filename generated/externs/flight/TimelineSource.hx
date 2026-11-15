package flight;

#if hl

typedef TimelineSource = flight._hl.TimelineSource;

#elseif cpp

typedef TimelineSource = flight._cpp.TimelineSource;

#elseif (js && flight_esm)

typedef TimelineSource = flight._js.TimelineSource;

#elseif js

#error "flight.TimelineSource on js requires flight_esm."

#else

#error "flight.TimelineSource: no backend for this target."

#end
