package flight;

#if hl

typedef Skeleton2DAnimationTargetBinderRegistry = flight._hl.Skeleton2DAnimationTargetBinderRegistry;

#elseif cpp

typedef Skeleton2DAnimationTargetBinderRegistry = flight._cpp.Skeleton2DAnimationTargetBinderRegistry;

#elseif (js && flight_esm)

typedef Skeleton2DAnimationTargetBinderRegistry = flight._js.Skeleton2DAnimationTargetBinderRegistry;

#elseif js

#error "flight.Skeleton2DAnimationTargetBinderRegistry on js requires flight_esm."

#else

#error "flight.Skeleton2DAnimationTargetBinderRegistry: no backend for this target."

#end
