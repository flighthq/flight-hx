package flight;

#if hl

typedef NotificationDismissSubscription = flight._hl.NotificationDismissSubscription;

#elseif cpp

typedef NotificationDismissSubscription = flight._cpp.NotificationDismissSubscription;

#elseif (js && flight_esm)

typedef NotificationDismissSubscription = flight._js.NotificationDismissSubscription;

#elseif js

#error "flight.NotificationDismissSubscription on js requires flight_esm."

#else

#error "flight.NotificationDismissSubscription: no backend for this target."

#end
