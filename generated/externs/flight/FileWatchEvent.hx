package flight;

#if hl

typedef FileWatchEvent = flight._hl.FileWatchEvent;

#elseif cpp

typedef FileWatchEvent = flight._cpp.FileWatchEvent;

#elseif (js && flight_esm)

typedef FileWatchEvent = flight._js.FileWatchEvent;

#elseif js

#error "flight.FileWatchEvent on js requires flight_esm."

#else

#error "flight.FileWatchEvent: no backend for this target."

#end
