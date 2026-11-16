package flight;

#if hl

typedef GltfAccessor = flight._hl.GltfAccessor;

#elseif cpp

typedef GltfAccessor = flight._cpp.GltfAccessor;

#elseif (js && flight_esm)

typedef GltfAccessor = flight._js.GltfAccessor;

#elseif js

#error "flight.GltfAccessor on js requires flight_esm."

#else

#error "flight.GltfAccessor: no backend for this target."

#end
