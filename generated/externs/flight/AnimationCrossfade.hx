package flight;

#if hl

typedef AnimationCrossfade = flight._hl.AnimationCrossfade;

#elseif cpp

typedef AnimationCrossfade = flight._cpp.AnimationCrossfade;

#elseif (js && flight_esm)

typedef AnimationCrossfade = flight._js.AnimationCrossfade;

#elseif js

#error "flight.AnimationCrossfade on js requires flight_esm."

#else

#error "flight.AnimationCrossfade: no backend for this target."

#end
