package flight;

#if hl

typedef SpatialIndex3D = flight._hl.SpatialIndex3D;

#elseif cpp

typedef SpatialIndex3D = flight._cpp.SpatialIndex3D;

#elseif (js && flight_esm)

typedef SpatialIndex3D = flight._js.SpatialIndex3D;

#elseif js

#error "flight.SpatialIndex3D on js requires flight_esm."

#else

#error "flight.SpatialIndex3D: no backend for this target."

#end
