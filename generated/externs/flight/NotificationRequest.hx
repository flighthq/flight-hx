package flight;

#if hl

typedef NotificationRequest = flight._hl.NotificationRequest;

#elseif cpp

typedef NotificationRequest = flight._cpp.NotificationRequest;

#elseif (js && flight_esm)

typedef NotificationRequest = flight._js.NotificationRequest;

#elseif js

#error "flight.NotificationRequest on js requires flight_esm."

#else

#error "flight.NotificationRequest: no backend for this target."

#end
