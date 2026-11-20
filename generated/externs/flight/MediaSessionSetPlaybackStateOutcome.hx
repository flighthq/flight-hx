package flight;

#if hl

typedef MediaSessionSetPlaybackStateOutcome = flight._hl.MediaSessionSetPlaybackStateOutcome;

#elseif cpp

typedef MediaSessionSetPlaybackStateOutcome = flight._cpp.MediaSessionSetPlaybackStateOutcome;

#elseif (js && flight_esm)

typedef MediaSessionSetPlaybackStateOutcome = flight._js.MediaSessionSetPlaybackStateOutcome;

#elseif js

#error "flight.MediaSessionSetPlaybackStateOutcome on js requires flight_esm."

#else

#error "flight.MediaSessionSetPlaybackStateOutcome: no backend for this target."

#end
