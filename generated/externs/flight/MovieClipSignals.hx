package flight;

#if hl

typedef MovieClipSignals = flight._hl.MovieClipSignals;

#elseif cpp

typedef MovieClipSignals = flight._cpp.MovieClipSignals;

#elseif (js && flight_esm)

typedef MovieClipSignals = flight._js.MovieClipSignals;

#elseif js

#error "flight.MovieClipSignals on js requires flight_esm."

#else

#error "flight.MovieClipSignals: no backend for this target."

#end
