package flight;

#if hl

typedef Scene2DDocumentImportContext = flight._hl.Scene2DDocumentImportContext;

#elseif cpp

typedef Scene2DDocumentImportContext = flight._cpp.Scene2DDocumentImportContext;

#elseif (js && flight_esm)

typedef Scene2DDocumentImportContext = flight._js.Scene2DDocumentImportContext;

#elseif js

#error "flight.Scene2DDocumentImportContext on js requires flight_esm."

#else

#error "flight.Scene2DDocumentImportContext: no backend for this target."

#end
