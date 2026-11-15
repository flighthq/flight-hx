package flight;

#if hl

typedef Skeleton2DDeformLengthExplanation = flight._hl.Skeleton2DDeformLengthExplanation;

#elseif cpp

typedef Skeleton2DDeformLengthExplanation = flight._cpp.Skeleton2DDeformLengthExplanation;

#elseif (js && flight_esm)

typedef Skeleton2DDeformLengthExplanation = flight._js.Skeleton2DDeformLengthExplanation;

#elseif js

#error "flight.Skeleton2DDeformLengthExplanation on js requires flight_esm."

#else

#error "flight.Skeleton2DDeformLengthExplanation: no backend for this target."

#end
