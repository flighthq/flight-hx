package flight;

#if hl

typedef MovieClip = flight._hl.MovieClip;

#elseif cpp

typedef MovieClip = flight._cpp.MovieClip;

#elseif (js && flight_esm)

typedef MovieClip = flight._js.MovieClip;

#elseif js

#error "flight.MovieClip on js requires flight_esm."

#else

#error "flight.MovieClip: no backend for this target."

#end
