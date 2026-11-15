package flight;

#if hl

typedef AnimationPlayer = flight._hl.AnimationPlayer;

#elseif cpp

typedef AnimationPlayer = flight._cpp.AnimationPlayer;

#elseif (js && flight_esm)

typedef AnimationPlayer = flight._js.AnimationPlayer;

#elseif js

#error "flight.AnimationPlayer on js requires flight_esm."

#else

#error "flight.AnimationPlayer: no backend for this target."

#end
