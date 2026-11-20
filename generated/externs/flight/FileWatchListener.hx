package flight;

#if hl

typedef FileWatchListener = flight._hl.FileWatchListener;

#elseif cpp

typedef FileWatchListener = flight._cpp.FileWatchListener;

#elseif (js && flight_esm)

typedef FileWatchListener = flight._js.FileWatchListener;

#elseif js

#error "flight.FileWatchListener on js requires flight_esm."

#else

#error "flight.FileWatchListener: no backend for this target."

#end
