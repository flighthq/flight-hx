package flight;

#if hl

typedef GltfDracoMeshCompression = flight._hl.GltfDracoMeshCompression;

#elseif cpp

typedef GltfDracoMeshCompression = flight._cpp.GltfDracoMeshCompression;

#elseif (js && flight_esm)

typedef GltfDracoMeshCompression = flight._js.GltfDracoMeshCompression;

#elseif js

#error "flight.GltfDracoMeshCompression on js requires flight_esm."

#else

#error "flight.GltfDracoMeshCompression: no backend for this target."

#end
