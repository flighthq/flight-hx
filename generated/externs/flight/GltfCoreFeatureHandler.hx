package flight;

#if hl

typedef GltfCoreFeatureHandler = flight._hl.GltfCoreFeatureHandler;

#elseif cpp

typedef GltfCoreFeatureHandler = flight._cpp.GltfCoreFeatureHandler;

#elseif (js && flight_esm)

typedef GltfCoreFeatureHandler = flight._js.GltfCoreFeatureHandler;

#elseif js

#error "flight.GltfCoreFeatureHandler on js requires flight_esm."

#else

#error "flight.GltfCoreFeatureHandler: no backend for this target."

#end
