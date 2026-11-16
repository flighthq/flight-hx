package flight;

#if hl

typedef GltfDracoMesh = flight._hl.GltfDracoMesh;

#elseif cpp

typedef GltfDracoMesh = flight._cpp.GltfDracoMesh;

#elseif (js && flight_esm)

typedef GltfDracoMesh = flight._js.GltfDracoMesh;

#elseif js

#error "flight.GltfDracoMesh on js requires flight_esm."

#else

#error "flight.GltfDracoMesh: no backend for this target."

#end
