package flight;

#if hl

typedef AnimationClip = flight._hl.AnimationClip;

#elseif cpp

typedef AnimationClip = flight._cpp.AnimationClip;

#elseif (js && flight_esm)

typedef AnimationClip = flight._js.AnimationClip;

#elseif js

#error "flight.AnimationClip on js requires flight_esm."

#else

#error "flight.AnimationClip: no backend for this target."

#end
