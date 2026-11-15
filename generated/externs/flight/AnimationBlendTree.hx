package flight;

#if hl

typedef AnimationBlendTree = flight._hl.AnimationBlendTree;

#elseif cpp

typedef AnimationBlendTree = flight._cpp.AnimationBlendTree;

#elseif (js && flight_esm)

typedef AnimationBlendTree = flight._js.AnimationBlendTree;

#elseif js

#error "flight.AnimationBlendTree on js requires flight_esm."

#else

#error "flight.AnimationBlendTree: no backend for this target."

#end
