package flight;

#if hl

typedef MediaSessionActionSignal = flight._hl.MediaSessionActionSignal;

#elseif cpp

typedef MediaSessionActionSignal = flight._cpp.MediaSessionActionSignal;

#elseif (js && flight_esm)

typedef MediaSessionActionSignal = flight._js.MediaSessionActionSignal;

#elseif js

#error "flight.MediaSessionActionSignal on js requires flight_esm."

#else

#error "flight.MediaSessionActionSignal: no backend for this target."

#end
