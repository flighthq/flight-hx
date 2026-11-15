package flight;

#if hl

typedef Skeleton2DTransformConstraint = flight._hl.Skeleton2DTransformConstraint;

#elseif cpp

typedef Skeleton2DTransformConstraint = flight._cpp.Skeleton2DTransformConstraint;

#elseif (js && flight_esm)

typedef Skeleton2DTransformConstraint = flight._js.Skeleton2DTransformConstraint;

#elseif js

#error "flight.Skeleton2DTransformConstraint on js requires flight_esm."

#else

#error "flight.Skeleton2DTransformConstraint: no backend for this target."

#end
