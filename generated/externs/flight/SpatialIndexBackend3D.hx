package flight;

#if hl

typedef SpatialIndexBackend3D = flight._hl.SpatialIndexBackend3D;

#elseif cpp

typedef SpatialIndexBackend3D = flight._cpp.SpatialIndexBackend3D;

#elseif (js && flight_esm)

typedef SpatialIndexBackend3D = flight._js.SpatialIndexBackend3D;

#elseif js

#error "flight.SpatialIndexBackend3D on js requires flight_esm."

#else

#error "flight.SpatialIndexBackend3D: no backend for this target."

#end
