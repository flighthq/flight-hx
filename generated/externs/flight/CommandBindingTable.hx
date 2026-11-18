package flight;

#if hl

typedef CommandBindingTable = flight._hl.CommandBindingTable;

#elseif cpp

typedef CommandBindingTable = flight._cpp.CommandBindingTable;

#elseif (js && flight_esm)

typedef CommandBindingTable = flight._js.CommandBindingTable;

#elseif js

#error "flight.CommandBindingTable on js requires flight_esm."

#else

#error "flight.CommandBindingTable: no backend for this target."

#end
