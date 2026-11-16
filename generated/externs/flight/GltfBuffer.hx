package flight;

#if hl

typedef GltfBuffer = flight._hl.GltfBuffer;

#elseif cpp

typedef GltfBuffer = flight._cpp.GltfBuffer;

#elseif (js && flight_esm)

typedef GltfBuffer = flight._js.GltfBuffer;

#elseif js

#error "flight.GltfBuffer on js requires flight_esm."

#else

#error "flight.GltfBuffer: no backend for this target."

#end
