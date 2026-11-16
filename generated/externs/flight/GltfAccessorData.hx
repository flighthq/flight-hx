package flight;

#if hl

typedef GltfAccessorData = flight._hl.GltfAccessorData;

#elseif cpp

typedef GltfAccessorData = flight._cpp.GltfAccessorData;

#elseif (js && flight_esm)

typedef GltfAccessorData = flight._js.GltfAccessorData;

#elseif js

#error "flight.GltfAccessorData on js requires flight_esm."

#else

#error "flight.GltfAccessorData: no backend for this target."

#end
