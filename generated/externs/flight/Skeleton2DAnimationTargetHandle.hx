package flight;

#if hl

typedef Skeleton2DAnimationTargetHandle = flight._hl.Skeleton2DAnimationTargetHandle;

#elseif cpp

typedef Skeleton2DAnimationTargetHandle = flight._cpp.Skeleton2DAnimationTargetHandle;

#elseif (js && flight_esm)

typedef Skeleton2DAnimationTargetHandle = flight._js.Skeleton2DAnimationTargetHandle;

#elseif js

#error "flight.Skeleton2DAnimationTargetHandle on js requires flight_esm."

#else

#error "flight.Skeleton2DAnimationTargetHandle: no backend for this target."

#end
