package flight;

#if hl

typedef NotificationReceivedSubscription = flight._hl.NotificationReceivedSubscription;

#elseif cpp

typedef NotificationReceivedSubscription = flight._cpp.NotificationReceivedSubscription;

#elseif (js && flight_esm)

typedef NotificationReceivedSubscription = flight._js.NotificationReceivedSubscription;

#elseif js

#error "flight.NotificationReceivedSubscription on js requires flight_esm."

#else

#error "flight.NotificationReceivedSubscription: no backend for this target."

#end
