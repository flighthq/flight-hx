package flight;

#if hl

typedef SpatialIndex2D = flight._hl.SpatialIndex2D;

#elseif cpp

typedef SpatialIndex2D = flight._cpp.SpatialIndex2D;

#elseif (js && flight_esm)

typedef SpatialIndex2D = flight._js.SpatialIndex2D;

#elseif js

#error "flight.SpatialIndex2D on js requires flight_esm."

#else

#error "flight.SpatialIndex2D: no backend for this target."

#end
