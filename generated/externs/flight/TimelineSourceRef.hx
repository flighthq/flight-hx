package flight;

#if hl

typedef TimelineSourceRef = flight._hl.TimelineSourceRef;

#elseif cpp

typedef TimelineSourceRef = flight._cpp.TimelineSourceRef;

#elseif (js && flight_esm)

typedef TimelineSourceRef = flight._js.TimelineSourceRef;

#elseif js

#error "flight.TimelineSourceRef on js requires flight_esm."

#else

#error "flight.TimelineSourceRef: no backend for this target."

#end
