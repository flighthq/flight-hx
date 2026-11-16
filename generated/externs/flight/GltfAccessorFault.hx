package flight;

#if hl

typedef GltfAccessorFault = flight._hl.GltfAccessorFault;

#elseif cpp

typedef GltfAccessorFault = flight._cpp.GltfAccessorFault;

#elseif (js && flight_esm)

typedef GltfAccessorFault = flight._js.GltfAccessorFault;

#elseif js

#error "flight.GltfAccessorFault on js requires flight_esm."

#else

#error "flight.GltfAccessorFault: no backend for this target."

#end
