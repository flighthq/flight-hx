package flight;

#if hl

typedef InteractionManagerOptions = flight._hl.InteractionManagerOptions;

#elseif cpp

typedef InteractionManagerOptions = flight._cpp.InteractionManagerOptions;

#elseif (js && flight_esm)

typedef InteractionManagerOptions = flight._js.InteractionManagerOptions;

#elseif js

#error "flight.InteractionManagerOptions on js requires flight_esm."

#else

#error "flight.InteractionManagerOptions: no backend for this target."

#end
