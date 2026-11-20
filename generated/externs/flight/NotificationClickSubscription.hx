package flight;

#if hl

typedef NotificationClickSubscription = flight._hl.NotificationClickSubscription;

#elseif cpp

typedef NotificationClickSubscription = flight._cpp.NotificationClickSubscription;

#elseif (js && flight_esm)

typedef NotificationClickSubscription = flight._js.NotificationClickSubscription;

#elseif js

#error "flight.NotificationClickSubscription on js requires flight_esm."

#else

#error "flight.NotificationClickSubscription: no backend for this target."

#end
