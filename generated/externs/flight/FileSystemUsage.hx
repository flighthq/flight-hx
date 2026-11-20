package flight;

#if hl

typedef FileSystemUsage = flight._hl.FileSystemUsage;

#elseif cpp

typedef FileSystemUsage = flight._cpp.FileSystemUsage;

#elseif (js && flight_esm)

typedef FileSystemUsage = flight._js.FileSystemUsage;

#elseif js

#error "flight.FileSystemUsage on js requires flight_esm."

#else

#error "flight.FileSystemUsage: no backend for this target."

#end
