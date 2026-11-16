package flight;

#if hl

typedef GltfTextureInfo = flight._hl.GltfTextureInfo;

#elseif cpp

typedef GltfTextureInfo = flight._cpp.GltfTextureInfo;

#elseif (js && flight_esm)

typedef GltfTextureInfo = flight._js.GltfTextureInfo;

#elseif js

#error "flight.GltfTextureInfo on js requires flight_esm."

#else

#error "flight.GltfTextureInfo: no backend for this target."

#end
