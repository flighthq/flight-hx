package flight;

#if hl

typedef MenuSignalsState = flight._hl.MenuSignalsState;

#elseif cpp

typedef MenuSignalsState = flight._cpp.MenuSignalsState;

#elseif (js && flight_esm)

typedef MenuSignalsState = flight._js.MenuSignalsState;

#elseif js

#error "flight.MenuSignalsState on js requires flight_esm."

#else

#error "flight.MenuSignalsState: no backend for this target."

#end
