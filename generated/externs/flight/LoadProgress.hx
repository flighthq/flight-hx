package flight;

#if hl

typedef LoadProgress = flight._hl.LoadProgress;

#elseif cpp

typedef LoadProgress = flight._cpp.LoadProgress;

#elseif (js && flight_esm)

typedef LoadProgress = flight._js.LoadProgress;

#elseif js

#error "flight.LoadProgress on js requires flight_esm."

#else

#error "flight.LoadProgress: no backend for this target."

#end
