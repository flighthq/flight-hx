package flight;

#if hl

typedef Woff2GlyfStreams = flight._hl.Woff2GlyfStreams;

#elseif cpp

typedef Woff2GlyfStreams = flight._cpp.Woff2GlyfStreams;

#elseif (js && flight_esm)

typedef Woff2GlyfStreams = flight._js.Woff2GlyfStreams;

#elseif js

#error "flight.Woff2GlyfStreams on js requires flight_esm."

#else

#error "flight.Woff2GlyfStreams: no backend for this target."

#end
