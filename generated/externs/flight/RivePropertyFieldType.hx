package flight;

#if hl

typedef RivePropertyFieldType = flight._hl.RivePropertyFieldType;

#elseif cpp

typedef RivePropertyFieldType = flight._cpp.RivePropertyFieldType;

#elseif (js && flight_esm)

typedef RivePropertyFieldType = flight._js.RivePropertyFieldType;

#elseif js

#error "flight.RivePropertyFieldType on js requires flight_esm."

#else

#error "flight.RivePropertyFieldType: no backend for this target."

#end
