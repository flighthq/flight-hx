package flight;

#if hl

typedef AnimationLayer = flight._hl.AnimationLayer;

#elseif cpp

typedef AnimationLayer = flight._cpp.AnimationLayer;

#elseif (js && flight_esm)

typedef AnimationLayer = flight._js.AnimationLayer;

#elseif js

#error "flight.AnimationLayer on js requires flight_esm."

#else

#error "flight.AnimationLayer: no backend for this target."

#end
