package flight;

#if hl

typedef NotificationLifecycleFailure = flight._hl.NotificationLifecycleFailure;

#elseif cpp

typedef NotificationLifecycleFailure = flight._cpp.NotificationLifecycleFailure;

#elseif (js && flight_esm)

typedef NotificationLifecycleFailure = flight._js.NotificationLifecycleFailure;

#elseif js

#error "flight.NotificationLifecycleFailure on js requires flight_esm."

#else

#error "flight.NotificationLifecycleFailure: no backend for this target."

#end
