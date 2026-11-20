package flight;

#if hl

typedef MediaSessionClearMetadataOutcome = flight._hl.MediaSessionClearMetadataOutcome;

#elseif cpp

typedef MediaSessionClearMetadataOutcome = flight._cpp.MediaSessionClearMetadataOutcome;

#elseif (js && flight_esm)

typedef MediaSessionClearMetadataOutcome = flight._js.MediaSessionClearMetadataOutcome;

#elseif js

#error "flight.MediaSessionClearMetadataOutcome on js requires flight_esm."

#else

#error "flight.MediaSessionClearMetadataOutcome: no backend for this target."

#end
