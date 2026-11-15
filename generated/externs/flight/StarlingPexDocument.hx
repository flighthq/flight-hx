package flight;

#if hl

typedef StarlingPexDocument = flight._hl.StarlingPexDocument;

#elseif cpp

typedef StarlingPexDocument = flight._cpp.StarlingPexDocument;

#elseif (js && flight_esm)

typedef StarlingPexDocument = flight._js.StarlingPexDocument;

#elseif js

#error "flight.StarlingPexDocument on js requires flight_esm."

#else

#error "flight.StarlingPexDocument: no backend for this target."

#end
