package flight;

#if hl

typedef SelectionSignals = flight._hl.SelectionSignals;

#elseif cpp

typedef SelectionSignals = flight._cpp.SelectionSignals;

#elseif (js && flight_esm)

typedef SelectionSignals = flight._js.SelectionSignals;

#elseif js

#error "flight.SelectionSignals on js requires flight_esm."

#else

#error "flight.SelectionSignals: no backend for this target."

#end
