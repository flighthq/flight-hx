package flight;

#if hl

typedef AnimationLayerOptions = flight._hl.AnimationLayerOptions;

#elseif cpp

typedef AnimationLayerOptions = flight._cpp.AnimationLayerOptions;

#elseif (js && flight_esm)

typedef AnimationLayerOptions = flight._js.AnimationLayerOptions;

#elseif js

#error "flight.AnimationLayerOptions on js requires flight_esm."

#else

#error "flight.AnimationLayerOptions: no backend for this target."

#end
