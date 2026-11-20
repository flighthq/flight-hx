package flight;

#if hl

typedef FileEntry = flight._hl.FileEntry;

#elseif cpp

typedef FileEntry = flight._cpp.FileEntry;

#elseif (js && flight_esm)

typedef FileEntry = flight._js.FileEntry;

#elseif js

#error "flight.FileEntry on js requires flight_esm."

#else

#error "flight.FileEntry: no backend for this target."

#end
