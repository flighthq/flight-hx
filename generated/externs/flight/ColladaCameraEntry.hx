package flight;

#if hl

typedef ColladaCameraEntry = flight._hl.ColladaCameraEntry;

#elseif cpp

typedef ColladaCameraEntry = flight._cpp.ColladaCameraEntry;

#elseif (js && flight_esm)

typedef ColladaCameraEntry = flight._js.ColladaCameraEntry;

#elseif js

#error "flight.ColladaCameraEntry on js requires flight_esm."

#else

#error "flight.ColladaCameraEntry: no backend for this target."

#end
