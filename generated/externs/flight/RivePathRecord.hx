package flight;

#if hl

typedef RivePathRecord = flight._hl.RivePathRecord;

#elseif cpp

typedef RivePathRecord = flight._cpp.RivePathRecord;

#elseif (js && flight_esm)

typedef RivePathRecord = flight._js.RivePathRecord;

#elseif js

#error "flight.RivePathRecord on js requires flight_esm."

#else

#error "flight.RivePathRecord: no backend for this target."

#end
