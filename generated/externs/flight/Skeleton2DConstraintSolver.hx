package flight;

#if hl

typedef Skeleton2DConstraintSolver = flight._hl.Skeleton2DConstraintSolver;

#elseif cpp

typedef Skeleton2DConstraintSolver = flight._cpp.Skeleton2DConstraintSolver;

#elseif (js && flight_esm)

typedef Skeleton2DConstraintSolver = flight._js.Skeleton2DConstraintSolver;

#elseif js

#error "flight.Skeleton2DConstraintSolver on js requires flight_esm."

#else

#error "flight.Skeleton2DConstraintSolver: no backend for this target."

#end
