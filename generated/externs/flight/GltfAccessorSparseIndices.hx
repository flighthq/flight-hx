package flight;

#if hl

typedef GltfAccessorSparseIndices = flight._hl.GltfAccessorSparseIndices;

#elseif cpp

typedef GltfAccessorSparseIndices = flight._cpp.GltfAccessorSparseIndices;

#elseif (js && flight_esm)

typedef GltfAccessorSparseIndices = flight._js.GltfAccessorSparseIndices;

#elseif js

#error "flight.GltfAccessorSparseIndices on js requires flight_esm."

#else

#error "flight.GltfAccessorSparseIndices: no backend for this target."

#end
