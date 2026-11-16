package flight;

#if hl

typedef ImageChannel = flight._hl.ImageChannel;

#elseif cpp

typedef ImageChannel = flight._cpp.ImageChannel;

#elseif (js && flight_esm)

typedef ImageChannel = flight._js.ImageChannel;

#elseif js

#error "flight.ImageChannel on js requires flight_esm."

#else

#error "flight.ImageChannel: no backend for this target."

#end
