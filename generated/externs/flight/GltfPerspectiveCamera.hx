package flight;

#if hl

typedef GltfPerspectiveCamera = flight._hl.GltfPerspectiveCamera;

#elseif cpp

typedef GltfPerspectiveCamera = flight._cpp.GltfPerspectiveCamera;

#elseif (js && flight_esm)

typedef GltfPerspectiveCamera = flight._js.GltfPerspectiveCamera;

#elseif js

#error "flight.GltfPerspectiveCamera on js requires flight_esm."

#else

#error "flight.GltfPerspectiveCamera: no backend for this target."

#end
