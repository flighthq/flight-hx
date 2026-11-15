package flight;

#if hl

typedef SpatialIndexingNotice = flight._hl.SpatialIndexingNotice;

#elseif cpp

typedef SpatialIndexingNotice = flight._cpp.SpatialIndexingNotice;

#elseif (js && flight_esm)

typedef SpatialIndexingNotice = flight._js.SpatialIndexingNotice;

#elseif js

#error "flight.SpatialIndexingNotice on js requires flight_esm."

#else

#error "flight.SpatialIndexingNotice: no backend for this target."

#end
