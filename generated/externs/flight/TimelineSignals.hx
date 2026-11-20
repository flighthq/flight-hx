package flight;

#if hl

typedef TimelineSignals = flight._hl.TimelineSignals;

#elseif cpp

typedef TimelineSignals = flight._cpp.TimelineSignals;

#elseif (js && flight_esm)

typedef TimelineSignals = flight._js.TimelineSignals;

#elseif js

#error "flight.TimelineSignals on js requires flight_esm."

#else

#error "flight.TimelineSignals: no backend for this target."

#end
