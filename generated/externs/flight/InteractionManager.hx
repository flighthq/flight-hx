package flight;

#if hl

typedef InteractionManager = flight._hl.InteractionManager;

#elseif cpp

typedef InteractionManager = flight._cpp.InteractionManager;

#elseif (js && flight_esm)

typedef InteractionManager = flight._js.InteractionManager;

#elseif js

#error "flight.InteractionManager on js requires flight_esm."

#else

#error "flight.InteractionManager: no backend for this target."

#end
