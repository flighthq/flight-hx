package flight;

#if hl

typedef NotificationReplySubscription = flight._hl.NotificationReplySubscription;

#elseif cpp

typedef NotificationReplySubscription = flight._cpp.NotificationReplySubscription;

#elseif (js && flight_esm)

typedef NotificationReplySubscription = flight._js.NotificationReplySubscription;

#elseif js

#error "flight.NotificationReplySubscription on js requires flight_esm."

#else

#error "flight.NotificationReplySubscription: no backend for this target."

#end
