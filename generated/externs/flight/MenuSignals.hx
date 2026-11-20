package flight;

#if hl

typedef MenuSignals = flight._hl.MenuSignals;

#elseif cpp

typedef MenuSignals = flight._cpp.MenuSignals;

#elseif (js && flight_esm)

typedef MenuSignals = flight._js.MenuSignals;

#elseif js

#error "flight.MenuSignals on js requires flight_esm."

#else

#error "flight.MenuSignals: no backend for this target."

#end
