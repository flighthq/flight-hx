package flight;

#if hl

typedef MediaSessionSetPositionStateOutcome = flight._hl.MediaSessionSetPositionStateOutcome;

#elseif cpp

typedef MediaSessionSetPositionStateOutcome = flight._cpp.MediaSessionSetPositionStateOutcome;

#elseif (js && flight_esm)

typedef MediaSessionSetPositionStateOutcome = flight._js.MediaSessionSetPositionStateOutcome;

#elseif js

#error "flight.MediaSessionSetPositionStateOutcome on js requires flight_esm."

#else

#error "flight.MediaSessionSetPositionStateOutcome: no backend for this target."

#end
