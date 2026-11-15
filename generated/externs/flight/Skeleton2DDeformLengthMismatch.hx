package flight;

#if hl

typedef Skeleton2DDeformLengthMismatch = flight._hl.Skeleton2DDeformLengthMismatch;

#elseif cpp

typedef Skeleton2DDeformLengthMismatch = flight._cpp.Skeleton2DDeformLengthMismatch;

#elseif (js && flight_esm)

typedef Skeleton2DDeformLengthMismatch = flight._js.Skeleton2DDeformLengthMismatch;

#elseif js

#error "flight.Skeleton2DDeformLengthMismatch on js requires flight_esm."

#else

#error "flight.Skeleton2DDeformLengthMismatch: no backend for this target."

#end
