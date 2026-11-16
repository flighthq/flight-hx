package flight;

#if hl

typedef GltfAnimationTarget = flight._hl.GltfAnimationTarget;

#elseif cpp

typedef GltfAnimationTarget = flight._cpp.GltfAnimationTarget;

#elseif (js && flight_esm)

typedef GltfAnimationTarget = flight._js.GltfAnimationTarget;

#elseif js

#error "flight.GltfAnimationTarget on js requires flight_esm."

#else

#error "flight.GltfAnimationTarget: no backend for this target."

#end
