package flight;

#if hl

typedef MediaSessionMetadata = flight._hl.MediaSessionMetadata;

#elseif cpp

typedef MediaSessionMetadata = flight._cpp.MediaSessionMetadata;

#elseif (js && flight_esm)

typedef MediaSessionMetadata = flight._js.MediaSessionMetadata;

#elseif js

#error "flight.MediaSessionMetadata on js requires flight_esm."

#else

#error "flight.MediaSessionMetadata: no backend for this target."

#end
