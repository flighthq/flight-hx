package flight;

#if hl

typedef ScreenSignals = flight._hl.ScreenSignals;

#elseif cpp

typedef ScreenSignals = flight._cpp.ScreenSignals;

#elseif (js && flight_esm)

typedef ScreenSignals = flight._js.ScreenSignals;

#elseif js

#error "flight.ScreenSignals on js requires flight_esm."

#else

#error "flight.ScreenSignals: no backend for this target."

#end
