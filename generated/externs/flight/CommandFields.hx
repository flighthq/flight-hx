package flight;

#if hl

typedef CommandFields = flight._hl.CommandFields;

#elseif cpp

typedef CommandFields = flight._cpp.CommandFields;

#elseif (js && flight_esm)

typedef CommandFields = flight._js.CommandFields;

#elseif js

#error "flight.CommandFields on js requires flight_esm."

#else

#error "flight.CommandFields: no backend for this target."

#end
