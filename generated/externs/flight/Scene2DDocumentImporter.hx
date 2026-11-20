package flight;

#if hl

typedef Scene2DDocumentImporter = flight._hl.Scene2DDocumentImporter;

#elseif cpp

typedef Scene2DDocumentImporter = flight._cpp.Scene2DDocumentImporter;

#elseif (js && flight_esm)

typedef Scene2DDocumentImporter = flight._js.Scene2DDocumentImporter;

#elseif js

#error "flight.Scene2DDocumentImporter on js requires flight_esm."

#else

#error "flight.Scene2DDocumentImporter: no backend for this target."

#end
