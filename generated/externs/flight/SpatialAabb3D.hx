package flight;

#if hl

typedef SpatialAabb3D = flight._hl.SpatialAabb3D;

#elseif cpp

typedef SpatialAabb3D = flight._cpp.SpatialAabb3D;

#elseif (js && flight_esm)

typedef SpatialAabb3D = flight._js.SpatialAabb3D;

#elseif js

#error "flight.SpatialAabb3D on js requires flight_esm."

#else

#error "flight.SpatialAabb3D: no backend for this target."

#end
