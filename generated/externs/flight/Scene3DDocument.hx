package flight;

#if hl

typedef Scene3DDocument = flight._hl.Scene3DDocument;

#elseif cpp

typedef Scene3DDocument = flight._cpp.Scene3DDocument;

#elseif (js && flight_esm)

typedef Scene3DDocument = flight._js.Scene3DDocument;

#elseif js

#error "flight.Scene3DDocument on js requires flight_esm."

#else

#error "flight.Scene3DDocument: no backend for this target."

#end
