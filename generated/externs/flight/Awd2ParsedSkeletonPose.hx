package flight;

#if hl

typedef Awd2ParsedSkeletonPose = flight._hl.Awd2ParsedSkeletonPose;

#elseif cpp

typedef Awd2ParsedSkeletonPose = flight._cpp.Awd2ParsedSkeletonPose;

#elseif (js && flight_esm)

typedef Awd2ParsedSkeletonPose = flight._js.Awd2ParsedSkeletonPose;

#elseif js

#error "flight.Awd2ParsedSkeletonPose on js requires flight_esm."

#else

#error "flight.Awd2ParsedSkeletonPose: no backend for this target."

#end
