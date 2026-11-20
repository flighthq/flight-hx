package flight;

#if hl

typedef TrayMenuSelectionEvent = flight._hl.TrayMenuSelectionEvent;

#elseif cpp

typedef TrayMenuSelectionEvent = flight._cpp.TrayMenuSelectionEvent;

#elseif (js && flight_esm)

typedef TrayMenuSelectionEvent = flight._js.TrayMenuSelectionEvent;

#elseif js

#error "flight.TrayMenuSelectionEvent on js requires flight_esm."

#else

#error "flight.TrayMenuSelectionEvent: no backend for this target."

#end
