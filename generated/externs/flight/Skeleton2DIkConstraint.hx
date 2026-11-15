package flight;

#if hl

typedef Skeleton2DIkConstraint = flight._hl.Skeleton2DIkConstraint;

#elseif cpp

typedef Skeleton2DIkConstraint = flight._cpp.Skeleton2DIkConstraint;

#elseif (js && flight_esm)

typedef Skeleton2DIkConstraint = flight._js.Skeleton2DIkConstraint;

#elseif js

#error "flight.Skeleton2DIkConstraint on js requires flight_esm."

#else

#error "flight.Skeleton2DIkConstraint: no backend for this target."

#end
