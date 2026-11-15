package flight;

#if hl

typedef Skeleton2DAnimationTargetBinder = flight._hl.Skeleton2DAnimationTargetBinder;

#elseif cpp

typedef Skeleton2DAnimationTargetBinder = flight._cpp.Skeleton2DAnimationTargetBinder;

#elseif (js && flight_esm)

typedef Skeleton2DAnimationTargetBinder = flight._js.Skeleton2DAnimationTargetBinder;

#elseif js

#error "flight.Skeleton2DAnimationTargetBinder on js requires flight_esm."

#else

#error "flight.Skeleton2DAnimationTargetBinder: no backend for this target."

#end
