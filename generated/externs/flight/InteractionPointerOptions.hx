package flight;

#if hl

typedef InteractionPointerOptions = flight._hl.InteractionPointerOptions;

#elseif cpp

typedef InteractionPointerOptions = flight._cpp.InteractionPointerOptions;

#elseif (js && flight_esm)

typedef InteractionPointerOptions = flight._js.InteractionPointerOptions;

#elseif js

#error "flight.InteractionPointerOptions on js requires flight_esm."

#else

#error "flight.InteractionPointerOptions: no backend for this target."

#end
