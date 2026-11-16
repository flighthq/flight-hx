package flight;

#if hl

typedef GltfAccessorSparseValues = flight._hl.GltfAccessorSparseValues;

#elseif cpp

typedef GltfAccessorSparseValues = flight._cpp.GltfAccessorSparseValues;

#elseif (js && flight_esm)

typedef GltfAccessorSparseValues = flight._js.GltfAccessorSparseValues;

#elseif js

#error "flight.GltfAccessorSparseValues on js requires flight_esm."

#else

#error "flight.GltfAccessorSparseValues: no backend for this target."

#end
