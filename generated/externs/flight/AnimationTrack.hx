package flight;

#if hl

typedef AnimationTrack = flight._hl.AnimationTrack;

#elseif cpp

typedef AnimationTrack = flight._cpp.AnimationTrack;

#elseif (js && flight_esm)

typedef AnimationTrack = flight._js.AnimationTrack;

#elseif js

#error "flight.AnimationTrack on js requires flight_esm."

#else

#error "flight.AnimationTrack: no backend for this target."

#end
