package flight;

#if hl

typedef NodeSignals = flight._hl.NodeSignals;

#elseif cpp

typedef NodeSignals = flight._cpp.NodeSignals;

#elseif (js && flight_esm)

typedef NodeSignals = flight._js.NodeSignals;

#elseif js

#error "flight.NodeSignals on js requires flight_esm."

#else

#error "flight.NodeSignals: no backend for this target."

#end
