package flight;

#if hl

typedef FileStat = flight._hl.FileStat;

#elseif cpp

typedef FileStat = flight._cpp.FileStat;

#elseif (js && flight_esm)

typedef FileStat = flight._js.FileStat;

#elseif js

#error "flight.FileStat on js requires flight_esm."

#else

#error "flight.FileStat: no backend for this target."

#end
