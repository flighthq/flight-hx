package flight;

#if hl

typedef Awd2ParsedSkeletonAnimation = flight._hl.Awd2ParsedSkeletonAnimation;

#elseif cpp

typedef Awd2ParsedSkeletonAnimation = flight._cpp.Awd2ParsedSkeletonAnimation;

#elseif (js && flight_esm)

typedef Awd2ParsedSkeletonAnimation = flight._js.Awd2ParsedSkeletonAnimation;

#elseif js

#error "flight.Awd2ParsedSkeletonAnimation on js requires flight_esm."

#else

#error "flight.Awd2ParsedSkeletonAnimation: no backend for this target."

#end
