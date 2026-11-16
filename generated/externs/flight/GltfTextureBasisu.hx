package flight;

#if hl

typedef GltfTextureBasisu = flight._hl.GltfTextureBasisu;

#elseif cpp

typedef GltfTextureBasisu = flight._cpp.GltfTextureBasisu;

#elseif (js && flight_esm)

typedef GltfTextureBasisu = flight._js.GltfTextureBasisu;

#elseif js

#error "flight.GltfTextureBasisu on js requires flight_esm."

#else

#error "flight.GltfTextureBasisu: no backend for this target."

#end
