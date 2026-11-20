package flight;

#if hl

typedef NotificationSchedule = flight._hl.NotificationSchedule;

#elseif cpp

typedef NotificationSchedule = flight._cpp.NotificationSchedule;

#elseif (js && flight_esm)

typedef NotificationSchedule = flight._js.NotificationSchedule;

#elseif js

#error "flight.NotificationSchedule on js requires flight_esm."

#else

#error "flight.NotificationSchedule: no backend for this target."

#end
