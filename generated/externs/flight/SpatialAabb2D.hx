package flight;

#if hl

typedef SpatialAabb2D = flight._hl.SpatialAabb2D;

#elseif cpp

typedef SpatialAabb2D = flight._cpp.SpatialAabb2D;

#elseif (js && flight_esm)

typedef SpatialAabb2D = flight._js.SpatialAabb2D;

#elseif js

#error "flight.SpatialAabb2D on js requires flight_esm."

#else

#error "flight.SpatialAabb2D: no backend for this target."

#end
