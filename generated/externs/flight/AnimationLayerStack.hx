package flight;

#if hl

typedef AnimationLayerStack = flight._hl.AnimationLayerStack;

#elseif cpp

typedef AnimationLayerStack = flight._cpp.AnimationLayerStack;

#elseif (js && flight_esm)

typedef AnimationLayerStack = flight._js.AnimationLayerStack;

#elseif js

#error "flight.AnimationLayerStack on js requires flight_esm."

#else

#error "flight.AnimationLayerStack: no backend for this target."

#end
