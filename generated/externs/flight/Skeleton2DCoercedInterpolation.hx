package flight;

#if hl

typedef Skeleton2DCoercedInterpolation = flight._hl.Skeleton2DCoercedInterpolation;

#elseif cpp

typedef Skeleton2DCoercedInterpolation = flight._cpp.Skeleton2DCoercedInterpolation;

#elseif (js && flight_esm)

typedef Skeleton2DCoercedInterpolation = flight._js.Skeleton2DCoercedInterpolation;

#elseif js

#error "flight.Skeleton2DCoercedInterpolation on js requires flight_esm."

#else

#error "flight.Skeleton2DCoercedInterpolation: no backend for this target."

#end
