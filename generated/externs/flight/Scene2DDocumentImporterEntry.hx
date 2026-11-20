package flight;

#if hl

typedef Scene2DDocumentImporterEntry = flight._hl.Scene2DDocumentImporterEntry;

#elseif cpp

typedef Scene2DDocumentImporterEntry = flight._cpp.Scene2DDocumentImporterEntry;

#elseif (js && flight_esm)

typedef Scene2DDocumentImporterEntry = flight._js.Scene2DDocumentImporterEntry;

#elseif js

#error "flight.Scene2DDocumentImporterEntry on js requires flight_esm."

#else

#error "flight.Scene2DDocumentImporterEntry: no backend for this target."

#end
