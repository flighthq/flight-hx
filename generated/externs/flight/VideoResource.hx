package flight;

#if hl

typedef VideoResource = flight._hl.VideoResource;

#elseif cpp

typedef VideoResource = flight._cpp.VideoResource;

#elseif (js && flight_esm)

typedef VideoResource = flight._js.VideoResource;

#elseif js

#error "flight.VideoResource on js requires flight_esm."

#else

#error "flight.VideoResource: no backend for this target."

#end
