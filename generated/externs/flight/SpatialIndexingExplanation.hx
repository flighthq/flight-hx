package flight;

#if hl

typedef SpatialIndexingExplanation = flight._hl.SpatialIndexingExplanation;

#elseif cpp

typedef SpatialIndexingExplanation = flight._cpp.SpatialIndexingExplanation;

#elseif (js && flight_esm)

typedef SpatialIndexingExplanation = flight._js.SpatialIndexingExplanation;

#elseif js

#error "flight.SpatialIndexingExplanation on js requires flight_esm."

#else

#error "flight.SpatialIndexingExplanation: no backend for this target."

#end
