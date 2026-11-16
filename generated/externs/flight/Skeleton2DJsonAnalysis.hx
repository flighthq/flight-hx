package flight;

#if hl

typedef Skeleton2DJsonAnalysis = flight._hl.Skeleton2DJsonAnalysis;

#elseif cpp

typedef Skeleton2DJsonAnalysis = flight._cpp.Skeleton2DJsonAnalysis;

#elseif (js && flight_esm)

typedef Skeleton2DJsonAnalysis = flight._js.Skeleton2DJsonAnalysis;

#elseif js

#error "flight.Skeleton2DJsonAnalysis on js requires flight_esm."

#else

#error "flight.Skeleton2DJsonAnalysis: no backend for this target."

#end
