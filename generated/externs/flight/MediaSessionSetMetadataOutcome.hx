package flight;

#if hl

typedef MediaSessionSetMetadataOutcome = flight._hl.MediaSessionSetMetadataOutcome;

#elseif cpp

typedef MediaSessionSetMetadataOutcome = flight._cpp.MediaSessionSetMetadataOutcome;

#elseif (js && flight_esm)

typedef MediaSessionSetMetadataOutcome = flight._js.MediaSessionSetMetadataOutcome;

#elseif js

#error "flight.MediaSessionSetMetadataOutcome on js requires flight_esm."

#else

#error "flight.MediaSessionSetMetadataOutcome: no backend for this target."

#end
