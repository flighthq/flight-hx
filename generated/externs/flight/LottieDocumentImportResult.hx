package flight;

#if hl

typedef LottieDocumentImportResult = flight._hl.LottieDocumentImportResult;

#elseif cpp

typedef LottieDocumentImportResult = flight._cpp.LottieDocumentImportResult;

#elseif (js && flight_esm)

typedef LottieDocumentImportResult = flight._js.LottieDocumentImportResult;

#elseif js

#error "flight.LottieDocumentImportResult on js requires flight_esm."

#else

#error "flight.LottieDocumentImportResult: no backend for this target."

#end
