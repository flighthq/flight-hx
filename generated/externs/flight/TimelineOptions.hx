package flight;

#if hl

typedef TimelineOptions = flight._hl.TimelineOptions;

#elseif cpp

typedef TimelineOptions = flight._cpp.TimelineOptions;

#elseif (js && flight_esm)

typedef TimelineOptions = flight._js.TimelineOptions;

#elseif js

#error "flight.TimelineOptions on js requires flight_esm."

#else

#error "flight.TimelineOptions: no backend for this target."

#end
