package flight;

#if hl

typedef RandomSource = flight._hl.RandomSource;

#elseif cpp

typedef RandomSource = flight._cpp.RandomSource;

#elseif (js && flight_esm)

typedef RandomSource = flight._js.RandomSource;

#elseif js

#error "flight.RandomSource on js requires flight_esm."

#else

#error "flight.RandomSource: no backend for this target."

#end
