package flight;

#if hl

typedef TimelineLabel = flight._hl.TimelineLabel;

#elseif cpp

typedef TimelineLabel = flight._cpp.TimelineLabel;

#elseif (js && flight_esm)

typedef TimelineLabel = flight._js.TimelineLabel;

#elseif js

#error "flight.TimelineLabel on js requires flight_esm."

#else

#error "flight.TimelineLabel: no backend for this target."

#end
