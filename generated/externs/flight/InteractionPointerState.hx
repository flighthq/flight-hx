package flight;

#if hl

typedef InteractionPointerState = flight._hl.InteractionPointerState;

#elseif cpp

typedef InteractionPointerState = flight._cpp.InteractionPointerState;

#elseif (js && flight_esm)

typedef InteractionPointerState = flight._js.InteractionPointerState;

#elseif js

#error "flight.InteractionPointerState on js requires flight_esm."

#else

#error "flight.InteractionPointerState: no backend for this target."

#end
