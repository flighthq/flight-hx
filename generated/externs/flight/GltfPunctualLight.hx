package flight;

#if hl

typedef GltfPunctualLight = flight._hl.GltfPunctualLight;

#elseif cpp

typedef GltfPunctualLight = flight._cpp.GltfPunctualLight;

#elseif (js && flight_esm)

typedef GltfPunctualLight = flight._js.GltfPunctualLight;

#elseif js

#error "flight.GltfPunctualLight on js requires flight_esm."

#else

#error "flight.GltfPunctualLight: no backend for this target."

#end
