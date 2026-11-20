package flight;

#if hl

typedef TextInputEditRecord = flight._hl.TextInputEditRecord;

#elseif cpp

typedef TextInputEditRecord = flight._cpp.TextInputEditRecord;

#elseif (js && flight_esm)

typedef TextInputEditRecord = flight._js.TextInputEditRecord;

#elseif js

#error "flight.TextInputEditRecord on js requires flight_esm."

#else

#error "flight.TextInputEditRecord: no backend for this target."

#end
