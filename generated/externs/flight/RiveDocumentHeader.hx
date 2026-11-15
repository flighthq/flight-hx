package flight;

#if hl

typedef RiveDocumentHeader = flight._hl.RiveDocumentHeader;

#elseif cpp

typedef RiveDocumentHeader = flight._cpp.RiveDocumentHeader;

#elseif (js && flight_esm)

typedef RiveDocumentHeader = flight._js.RiveDocumentHeader;

#elseif js

#error "flight.RiveDocumentHeader on js requires flight_esm."

#else

#error "flight.RiveDocumentHeader: no backend for this target."

#end
