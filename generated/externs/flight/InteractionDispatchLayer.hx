package flight;

#if hl

typedef InteractionDispatchLayer = flight._hl.InteractionDispatchLayer;

#elseif cpp

typedef InteractionDispatchLayer = flight._cpp.InteractionDispatchLayer;

#elseif (js && flight_esm)

typedef InteractionDispatchLayer = flight._js.InteractionDispatchLayer;

#elseif js

#error "flight.InteractionDispatchLayer on js requires flight_esm."

#else

#error "flight.InteractionDispatchLayer: no backend for this target."

#end
