package flight;

#if hl

typedef InteractionDispatchLayerOptions = flight._hl.InteractionDispatchLayerOptions;

#elseif cpp

typedef InteractionDispatchLayerOptions = flight._cpp.InteractionDispatchLayerOptions;

#elseif (js && flight_esm)

typedef InteractionDispatchLayerOptions = flight._js.InteractionDispatchLayerOptions;

#elseif js

#error "flight.InteractionDispatchLayerOptions on js requires flight_esm."

#else

#error "flight.InteractionDispatchLayerOptions: no backend for this target."

#end
