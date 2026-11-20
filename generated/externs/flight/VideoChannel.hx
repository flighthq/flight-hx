package flight;

#if hl

typedef VideoChannel = flight._hl.VideoChannel;

#elseif cpp

typedef VideoChannel = flight._cpp.VideoChannel;

#elseif (js && flight_esm)

typedef VideoChannel = flight._js.VideoChannel;

#elseif js

#error "flight.VideoChannel on js requires flight_esm."

#else

#error "flight.VideoChannel: no backend for this target."

#end
