package flight;

#if hl

typedef Skeleton2D = flight._hl.Skeleton2D;

#elseif cpp

typedef Skeleton2D = flight._cpp.Skeleton2D;

#elseif (js && flight_esm)

typedef Skeleton2D = flight._js.Skeleton2D;

#elseif js

#error "flight.Skeleton2D on js requires flight_esm."

#else

#error "flight.Skeleton2D: no backend for this target."

#end
