package flight;

#if hl

typedef MediaSessionArtwork = flight._hl.MediaSessionArtwork;

#elseif cpp

typedef MediaSessionArtwork = flight._cpp.MediaSessionArtwork;

#elseif (js && flight_esm)

typedef MediaSessionArtwork = flight._js.MediaSessionArtwork;

#elseif js

#error "flight.MediaSessionArtwork on js requires flight_esm."

#else

#error "flight.MediaSessionArtwork: no backend for this target."

#end
