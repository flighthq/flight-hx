package flight;

#if hl

typedef RiveFieldType = flight._hl.RiveFieldType;

#elseif cpp

typedef RiveFieldType = flight._cpp.RiveFieldType;

#elseif (js && flight_esm)

typedef RiveFieldType = flight._js.RiveFieldType;

#elseif js

#error "flight.RiveFieldType on js requires flight_esm."

#else

#error "flight.RiveFieldType: no backend for this target."

#end
