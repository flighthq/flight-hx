package flight;

#if hl

typedef MovieClipData = flight._hl.MovieClipData;

#elseif cpp

typedef MovieClipData = flight._cpp.MovieClipData;

#elseif (js && flight_esm)

typedef MovieClipData = flight._js.MovieClipData;

#elseif js

#error "flight.MovieClipData on js requires flight_esm."

#else

#error "flight.MovieClipData: no backend for this target."

#end
