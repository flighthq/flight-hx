package flight;

#if hl

typedef MediaSessionPositionState = flight._hl.MediaSessionPositionState;

#elseif cpp

typedef MediaSessionPositionState = flight._cpp.MediaSessionPositionState;

#elseif (js && flight_esm)

typedef MediaSessionPositionState = flight._js.MediaSessionPositionState;

#elseif js

#error "flight.MediaSessionPositionState on js requires flight_esm."

#else

#error "flight.MediaSessionPositionState: no backend for this target."

#end
