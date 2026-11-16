package flight;

#if hl

typedef GltfAccessorSparse = flight._hl.GltfAccessorSparse;

#elseif cpp

typedef GltfAccessorSparse = flight._cpp.GltfAccessorSparse;

#elseif (js && flight_esm)

typedef GltfAccessorSparse = flight._js.GltfAccessorSparse;

#elseif js

#error "flight.GltfAccessorSparse on js requires flight_esm."

#else

#error "flight.GltfAccessorSparse: no backend for this target."

#end
