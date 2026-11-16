package flight;

#if hl

typedef Awd2SkeletonAnimationEntry = flight._hl.Awd2SkeletonAnimationEntry;

#elseif cpp

typedef Awd2SkeletonAnimationEntry = flight._cpp.Awd2SkeletonAnimationEntry;

#elseif (js && flight_esm)

typedef Awd2SkeletonAnimationEntry = flight._js.Awd2SkeletonAnimationEntry;

#elseif js

#error "flight.Awd2SkeletonAnimationEntry on js requires flight_esm."

#else

#error "flight.Awd2SkeletonAnimationEntry: no backend for this target."

#end
