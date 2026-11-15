package flight;

#if hl

typedef StarlingDocument = flight._hl.StarlingDocument;

#elseif cpp

typedef StarlingDocument = flight._cpp.StarlingDocument;

#elseif (js && flight_esm)

typedef StarlingDocument = flight._js.StarlingDocument;

#elseif js

#error "flight.StarlingDocument on js requires flight_esm."

#else

#error "flight.StarlingDocument: no backend for this target."

#end
