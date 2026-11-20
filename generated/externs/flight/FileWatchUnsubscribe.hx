package flight;

#if hl

typedef FileWatchUnsubscribe = flight._hl.FileWatchUnsubscribe;

#elseif cpp

typedef FileWatchUnsubscribe = flight._cpp.FileWatchUnsubscribe;

#elseif (js && flight_esm)

typedef FileWatchUnsubscribe = flight._js.FileWatchUnsubscribe;

#elseif js

#error "flight.FileWatchUnsubscribe on js requires flight_esm."

#else

#error "flight.FileWatchUnsubscribe: no backend for this target."

#end
