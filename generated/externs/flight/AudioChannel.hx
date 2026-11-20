package flight;

#if hl

typedef AudioChannel = flight._hl.AudioChannel;

#elseif cpp

typedef AudioChannel = flight._cpp.AudioChannel;

#elseif (js && flight_esm)

typedef AudioChannel = flight._js.AudioChannel;

#elseif js

#error "flight.AudioChannel on js requires flight_esm."

#else

#error "flight.AudioChannel: no backend for this target."

#end
