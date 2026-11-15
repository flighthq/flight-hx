package flight;

#if hl

typedef AnimationBlendTreeInput = flight._hl.AnimationBlendTreeInput;

#elseif cpp

typedef AnimationBlendTreeInput = flight._cpp.AnimationBlendTreeInput;

#elseif (js && flight_esm)

typedef AnimationBlendTreeInput = flight._js.AnimationBlendTreeInput;

#elseif js

#error "flight.AnimationBlendTreeInput on js requires flight_esm."

#else

#error "flight.AnimationBlendTreeInput: no backend for this target."

#end
