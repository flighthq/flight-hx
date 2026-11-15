package flight;

#if hl

typedef MovieClipRuntime = flight._hl.MovieClipRuntime;

#elseif cpp

typedef MovieClipRuntime = flight._cpp.MovieClipRuntime;

#elseif (js && flight_esm)

typedef MovieClipRuntime = flight._js.MovieClipRuntime;

#elseif js

#error "flight.MovieClipRuntime on js requires flight_esm."

#else

#error "flight.MovieClipRuntime: no backend for this target."

#end
