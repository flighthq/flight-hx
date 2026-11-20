package flight;

#if hl

typedef VideoPlayOptions = flight._hl.VideoPlayOptions;

#elseif cpp

typedef VideoPlayOptions = flight._cpp.VideoPlayOptions;

#elseif (js && flight_esm)

typedef VideoPlayOptions = flight._js.VideoPlayOptions;

#elseif js

#error "flight.VideoPlayOptions on js requires flight_esm."

#else

#error "flight.VideoPlayOptions: no backend for this target."

#end
