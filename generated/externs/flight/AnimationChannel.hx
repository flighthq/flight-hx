package flight;

#if hl

typedef AnimationChannel = flight._hl.AnimationChannel;

#elseif cpp

typedef AnimationChannel = flight._cpp.AnimationChannel;

#elseif (js && flight_esm)

typedef AnimationChannel = flight._js.AnimationChannel;

#elseif js

#error "flight.AnimationChannel on js requires flight_esm."

#else

#error "flight.AnimationChannel: no backend for this target."

#end
