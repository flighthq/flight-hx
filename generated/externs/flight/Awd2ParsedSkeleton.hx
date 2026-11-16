package flight;

#if hl

typedef Awd2ParsedSkeleton = flight._hl.Awd2ParsedSkeleton;

#elseif cpp

typedef Awd2ParsedSkeleton = flight._cpp.Awd2ParsedSkeleton;

#elseif (js && flight_esm)

typedef Awd2ParsedSkeleton = flight._js.Awd2ParsedSkeleton;

#elseif js

#error "flight.Awd2ParsedSkeleton on js requires flight_esm."

#else

#error "flight.Awd2ParsedSkeleton: no backend for this target."

#end
