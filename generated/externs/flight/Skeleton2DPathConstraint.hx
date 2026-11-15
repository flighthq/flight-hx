package flight;

#if hl

typedef Skeleton2DPathConstraint = flight._hl.Skeleton2DPathConstraint;

#elseif cpp

typedef Skeleton2DPathConstraint = flight._cpp.Skeleton2DPathConstraint;

#elseif (js && flight_esm)

typedef Skeleton2DPathConstraint = flight._js.Skeleton2DPathConstraint;

#elseif js

#error "flight.Skeleton2DPathConstraint on js requires flight_esm."

#else

#error "flight.Skeleton2DPathConstraint: no backend for this target."

#end
