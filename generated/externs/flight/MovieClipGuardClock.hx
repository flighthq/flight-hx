package flight;

#if hl

typedef MovieClipGuardClock = flight._hl.MovieClipGuardClock;

#elseif cpp

typedef MovieClipGuardClock = flight._cpp.MovieClipGuardClock;

#elseif (js && flight_esm)

typedef MovieClipGuardClock = flight._js.MovieClipGuardClock;

#elseif js

#error "flight.MovieClipGuardClock on js requires flight_esm."

#else

#error "flight.MovieClipGuardClock: no backend for this target."

#end
