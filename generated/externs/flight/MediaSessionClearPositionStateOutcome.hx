package flight;

#if hl

typedef MediaSessionClearPositionStateOutcome = flight._hl.MediaSessionClearPositionStateOutcome;

#elseif cpp

typedef MediaSessionClearPositionStateOutcome = flight._cpp.MediaSessionClearPositionStateOutcome;

#elseif (js && flight_esm)

typedef MediaSessionClearPositionStateOutcome = flight._js.MediaSessionClearPositionStateOutcome;

#elseif js

#error "flight.MediaSessionClearPositionStateOutcome on js requires flight_esm."

#else

#error "flight.MediaSessionClearPositionStateOutcome: no backend for this target."

#end
