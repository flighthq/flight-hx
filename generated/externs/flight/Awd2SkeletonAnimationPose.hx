package flight;

#if hl

typedef Awd2SkeletonAnimationPose = flight._hl.Awd2SkeletonAnimationPose;

#elseif cpp

typedef Awd2SkeletonAnimationPose = flight._cpp.Awd2SkeletonAnimationPose;

#elseif (js && flight_esm)

typedef Awd2SkeletonAnimationPose = flight._js.Awd2SkeletonAnimationPose;

#elseif js

#error "flight.Awd2SkeletonAnimationPose on js requires flight_esm."

#else

#error "flight.Awd2SkeletonAnimationPose: no backend for this target."

#end
