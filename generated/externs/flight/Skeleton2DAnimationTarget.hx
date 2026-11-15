package flight;

#if hl

typedef Skeleton2DAnimationTarget = flight._hl.Skeleton2DAnimationTarget;

#elseif cpp

typedef Skeleton2DAnimationTarget = flight._cpp.Skeleton2DAnimationTarget;

#elseif (js && flight_esm)

typedef Skeleton2DAnimationTarget = flight._js.Skeleton2DAnimationTarget;

#elseif js

#error "flight.Skeleton2DAnimationTarget on js requires flight_esm."

#else

#error "flight.Skeleton2DAnimationTarget: no backend for this target."

#end
