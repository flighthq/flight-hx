package flight;

#if hl

typedef Scene2DDocumentImporterRegistry = flight._hl.Scene2DDocumentImporterRegistry;

#elseif cpp

typedef Scene2DDocumentImporterRegistry = flight._cpp.Scene2DDocumentImporterRegistry;

#elseif (js && flight_esm)

typedef Scene2DDocumentImporterRegistry = flight._js.Scene2DDocumentImporterRegistry;

#elseif js

#error "flight.Scene2DDocumentImporterRegistry on js requires flight_esm."

#else

#error "flight.Scene2DDocumentImporterRegistry: no backend for this target."

#end
