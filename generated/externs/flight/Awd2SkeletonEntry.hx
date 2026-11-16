package flight;

#if hl

typedef Awd2SkeletonEntry = flight._hl.Awd2SkeletonEntry;

#elseif cpp

typedef Awd2SkeletonEntry = flight._cpp.Awd2SkeletonEntry;

#elseif (js && flight_esm)

typedef Awd2SkeletonEntry = flight._js.Awd2SkeletonEntry;

#elseif js

#error "flight.Awd2SkeletonEntry on js requires flight_esm."

#else

#error "flight.Awd2SkeletonEntry: no backend for this target."

#end
