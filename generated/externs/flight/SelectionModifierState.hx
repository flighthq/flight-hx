package flight;

#if hl

typedef SelectionModifierState = flight._hl.SelectionModifierState;

#elseif cpp

typedef SelectionModifierState = flight._cpp.SelectionModifierState;

#elseif (js && flight_esm)

typedef SelectionModifierState = flight._js.SelectionModifierState;

#elseif js

#error "flight.SelectionModifierState on js requires flight_esm."

#else

#error "flight.SelectionModifierState: no backend for this target."

#end
