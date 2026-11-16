package flight;

#if hl

typedef GltfNodePunctualLight = flight._hl.GltfNodePunctualLight;

#elseif cpp

typedef GltfNodePunctualLight = flight._cpp.GltfNodePunctualLight;

#elseif (js && flight_esm)

typedef GltfNodePunctualLight = flight._js.GltfNodePunctualLight;

#elseif js

#error "flight.GltfNodePunctualLight on js requires flight_esm."

#else

#error "flight.GltfNodePunctualLight: no backend for this target."

#end
