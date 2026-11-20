package flight;

#if hl

typedef Scene2DDocumentImporterMatcher = flight._hl.Scene2DDocumentImporterMatcher;

#elseif cpp

typedef Scene2DDocumentImporterMatcher = flight._cpp.Scene2DDocumentImporterMatcher;

#elseif (js && flight_esm)

typedef Scene2DDocumentImporterMatcher = flight._js.Scene2DDocumentImporterMatcher;

#elseif js

#error "flight.Scene2DDocumentImporterMatcher on js requires flight_esm."

#else

#error "flight.Scene2DDocumentImporterMatcher: no backend for this target."

#end
