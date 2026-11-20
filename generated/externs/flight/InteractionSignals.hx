package flight;

#if hl

typedef InteractionSignals = flight._hl.InteractionSignals;

#elseif cpp

typedef InteractionSignals = flight._cpp.InteractionSignals;

#elseif (js && flight_esm)

typedef InteractionSignals = flight._js.InteractionSignals;

#elseif js

#error "flight.InteractionSignals on js requires flight_esm."

#else

#error "flight.InteractionSignals: no backend for this target."

#end
