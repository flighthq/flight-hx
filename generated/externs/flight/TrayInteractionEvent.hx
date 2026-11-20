package flight;

#if hl

typedef TrayInteractionEvent = flight._hl.TrayInteractionEvent;

#elseif cpp

typedef TrayInteractionEvent = flight._cpp.TrayInteractionEvent;

#elseif (js && flight_esm)

typedef TrayInteractionEvent = flight._js.TrayInteractionEvent;

#elseif js

#error "flight.TrayInteractionEvent on js requires flight_esm."

#else

#error "flight.TrayInteractionEvent: no backend for this target."

#end
