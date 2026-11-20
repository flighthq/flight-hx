package flight;

#if hl

typedef Scene2DSignals = flight._hl.Scene2DSignals;

#elseif cpp

typedef Scene2DSignals = flight._cpp.Scene2DSignals;

#elseif (js && flight_esm)

typedef Scene2DSignals = flight._js.Scene2DSignals;

#elseif js

#error "flight.Scene2DSignals on js requires flight_esm."

#else

#error "flight.Scene2DSignals: no backend for this target."

#end
