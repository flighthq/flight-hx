package flight;

#if hl

typedef MediaChannelSignals = flight._hl.MediaChannelSignals;

#elseif cpp

typedef MediaChannelSignals = flight._cpp.MediaChannelSignals;

#elseif (js && flight_esm)

typedef MediaChannelSignals = flight._js.MediaChannelSignals;

#elseif js

#error "flight.MediaChannelSignals on js requires flight_esm."

#else

#error "flight.MediaChannelSignals: no backend for this target."

#end
