package flight;

#if hl

typedef RiveAnimationClip = flight._hl.RiveAnimationClip;

#elseif cpp

typedef RiveAnimationClip = flight._cpp.RiveAnimationClip;

#elseif (js && flight_esm)

typedef RiveAnimationClip = flight._js.RiveAnimationClip;

#elseif js

#error "flight.RiveAnimationClip on js requires flight_esm."

#else

#error "flight.RiveAnimationClip: no backend for this target."

#end
