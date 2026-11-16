package flight;

#if hl

typedef VideoResourceUrl = flight._hl.VideoResourceUrl;

#elseif cpp

typedef VideoResourceUrl = flight._cpp.VideoResourceUrl;

#elseif (js && flight_esm)

typedef VideoResourceUrl = flight._js.VideoResourceUrl;

#elseif js

#error "flight.VideoResourceUrl on js requires flight_esm."

#else

#error "flight.VideoResourceUrl: no backend for this target."

#end
