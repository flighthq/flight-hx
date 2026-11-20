package flight;

#if hl

typedef NotificationAction = flight._hl.NotificationAction;

#elseif cpp

typedef NotificationAction = flight._cpp.NotificationAction;

#elseif (js && flight_esm)

typedef NotificationAction = flight._js.NotificationAction;

#elseif js

#error "flight.NotificationAction on js requires flight_esm."

#else

#error "flight.NotificationAction: no backend for this target."

#end
