package flight;

#if hl

typedef NotificationActionSubscription = flight._hl.NotificationActionSubscription;

#elseif cpp

typedef NotificationActionSubscription = flight._cpp.NotificationActionSubscription;

#elseif (js && flight_esm)

typedef NotificationActionSubscription = flight._js.NotificationActionSubscription;

#elseif js

#error "flight.NotificationActionSubscription on js requires flight_esm."

#else

#error "flight.NotificationActionSubscription: no backend for this target."

#end
