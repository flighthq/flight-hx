package flight;

#if hl

typedef MovieClipGuardState = flight._hl.MovieClipGuardState;

#elseif cpp

typedef MovieClipGuardState = flight._cpp.MovieClipGuardState;

#elseif (js && flight_esm)

typedef MovieClipGuardState = flight._js.MovieClipGuardState;

#elseif js

#error "flight.MovieClipGuardState on js requires flight_esm."

#else

#error "flight.MovieClipGuardState: no backend for this target."

#end
