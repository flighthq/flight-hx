package flight;

#if hl

typedef SelectionState = flight._hl.SelectionState;

#elseif cpp

typedef SelectionState = flight._cpp.SelectionState;

#elseif (js && flight_esm)

typedef SelectionState = flight._js.SelectionState;

#elseif js

#error "flight.SelectionState on js requires flight_esm."

#else

#error "flight.SelectionState: no backend for this target."

#end
