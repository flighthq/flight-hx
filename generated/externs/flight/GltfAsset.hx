package flight;

#if hl

typedef GltfAsset = flight._hl.GltfAsset;

#elseif cpp

typedef GltfAsset = flight._cpp.GltfAsset;

#elseif (js && flight_esm)

typedef GltfAsset = flight._js.GltfAsset;

#elseif js

#error "flight.GltfAsset on js requires flight_esm."

#else

#error "flight.GltfAsset: no backend for this target."

#end
