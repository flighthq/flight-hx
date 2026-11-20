package flight;

#if hl

typedef Scene2DDocumentFetchProgress = flight._hl.Scene2DDocumentFetchProgress;

#elseif cpp

typedef Scene2DDocumentFetchProgress = flight._cpp.Scene2DDocumentFetchProgress;

#elseif (js && flight_esm)

typedef Scene2DDocumentFetchProgress = flight._js.Scene2DDocumentFetchProgress;

#elseif js

#error "flight.Scene2DDocumentFetchProgress on js requires flight_esm."

#else

#error "flight.Scene2DDocumentFetchProgress: no backend for this target."

#end
