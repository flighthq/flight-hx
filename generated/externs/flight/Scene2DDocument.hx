package flight;

#if hl

typedef Scene2DDocument = flight._hl.Scene2DDocument;

#elseif cpp

typedef Scene2DDocument = flight._cpp.Scene2DDocument;

#elseif (js && flight_esm)

typedef Scene2DDocument = flight._js.Scene2DDocument;

#elseif js

#error "flight.Scene2DDocument on js requires flight_esm."

#else

#error "flight.Scene2DDocument: no backend for this target."

#end
