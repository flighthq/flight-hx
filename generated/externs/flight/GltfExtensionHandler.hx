package flight;

#if hl

typedef GltfExtensionHandler = flight._hl.GltfExtensionHandler;

#elseif cpp

typedef GltfExtensionHandler = flight._cpp.GltfExtensionHandler;

#elseif (js && flight_esm)

typedef GltfExtensionHandler = flight._js.GltfExtensionHandler;

#elseif js

#error "flight.GltfExtensionHandler on js requires flight_esm."

#else

#error "flight.GltfExtensionHandler: no backend for this target."

#end
