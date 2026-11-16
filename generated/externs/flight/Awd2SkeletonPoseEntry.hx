package flight;

#if hl

typedef Awd2SkeletonPoseEntry = flight._hl.Awd2SkeletonPoseEntry;

#elseif cpp

typedef Awd2SkeletonPoseEntry = flight._cpp.Awd2SkeletonPoseEntry;

#elseif (js && flight_esm)

typedef Awd2SkeletonPoseEntry = flight._js.Awd2SkeletonPoseEntry;

#elseif js

#error "flight.Awd2SkeletonPoseEntry on js requires flight_esm."

#else

#error "flight.Awd2SkeletonPoseEntry: no backend for this target."

#end
