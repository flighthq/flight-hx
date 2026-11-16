package flight;

#if hl

typedef GltfAnimationSampler = flight._hl.GltfAnimationSampler;

#elseif cpp

typedef GltfAnimationSampler = flight._cpp.GltfAnimationSampler;

#elseif (js && flight_esm)

typedef GltfAnimationSampler = flight._js.GltfAnimationSampler;

#elseif js

#error "flight.GltfAnimationSampler on js requires flight_esm."

#else

#error "flight.GltfAnimationSampler: no backend for this target."

#end
