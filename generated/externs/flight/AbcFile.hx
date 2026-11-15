package flight;

#if hl

typedef AbcFile = flight._hl.AbcFile;

#elseif cpp

typedef AbcFile = flight._cpp.AbcFile;

#elseif (js && flight_esm)

typedef AbcFile = flight._js.AbcFile;

#elseif js

#error "flight.AbcFile on js requires flight_esm."

#else

#error "flight.AbcFile: no backend for this target."

#end
