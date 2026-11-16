package flight;

#if hl

typedef GltfAnimationChannel = flight._hl.GltfAnimationChannel;

#elseif cpp

typedef GltfAnimationChannel = flight._cpp.GltfAnimationChannel;

#elseif (js && flight_esm)

typedef GltfAnimationChannel = flight._js.GltfAnimationChannel;

#elseif js

#error "flight.GltfAnimationChannel on js requires flight_esm."

#else

#error "flight.GltfAnimationChannel: no backend for this target."

#end
