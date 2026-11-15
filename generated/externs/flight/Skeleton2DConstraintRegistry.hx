package flight;

#if hl

typedef Skeleton2DConstraintRegistry = flight._hl.Skeleton2DConstraintRegistry;

#elseif cpp

typedef Skeleton2DConstraintRegistry = flight._cpp.Skeleton2DConstraintRegistry;

#elseif (js && flight_esm)

typedef Skeleton2DConstraintRegistry = flight._js.Skeleton2DConstraintRegistry;

#elseif js

#error "flight.Skeleton2DConstraintRegistry on js requires flight_esm."

#else

#error "flight.Skeleton2DConstraintRegistry: no backend for this target."

#end
