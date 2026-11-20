package flight;

#if hl

typedef ScheduledNotification = flight._hl.ScheduledNotification;

#elseif cpp

typedef ScheduledNotification = flight._cpp.ScheduledNotification;

#elseif (js && flight_esm)

typedef ScheduledNotification = flight._js.ScheduledNotification;

#elseif js

#error "flight.ScheduledNotification on js requires flight_esm."

#else

#error "flight.ScheduledNotification: no backend for this target."

#end
