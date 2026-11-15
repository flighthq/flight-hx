package flight;

#if hl

typedef TimelineSourceOptions = flight._hl.TimelineSourceOptions;

#elseif cpp

typedef TimelineSourceOptions = flight._cpp.TimelineSourceOptions;

#elseif (js && flight_esm)

typedef TimelineSourceOptions = flight._js.TimelineSourceOptions;

#elseif js

#error "flight.TimelineSourceOptions on js requires flight_esm."

#else

#error "flight.TimelineSourceOptions: no backend for this target."

#end
