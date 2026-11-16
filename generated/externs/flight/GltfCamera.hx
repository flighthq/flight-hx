package flight;

#if hl

typedef GltfCamera = flight._hl.GltfCamera;

#elseif cpp

typedef GltfCamera = flight._cpp.GltfCamera;

#elseif (js && flight_esm)

typedef GltfCamera = flight._js.GltfCamera;

#elseif js

#error "flight.GltfCamera on js requires flight_esm."

#else

#error "flight.GltfCamera: no backend for this target."

#end
