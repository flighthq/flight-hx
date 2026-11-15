package flight;

#if hl

typedef Skeleton2DDeformAnimationTarget = flight._hl.Skeleton2DDeformAnimationTarget;

#elseif cpp

typedef Skeleton2DDeformAnimationTarget = flight._cpp.Skeleton2DDeformAnimationTarget;

#elseif (js && flight_esm)

typedef Skeleton2DDeformAnimationTarget = flight._js.Skeleton2DDeformAnimationTarget;

#elseif js

#error "flight.Skeleton2DDeformAnimationTarget on js requires flight_esm."

#else

#error "flight.Skeleton2DDeformAnimationTarget: no backend for this target."

#end
