package flight;

#if hl

typedef Scene3DDocumentCamera = flight._hl.Scene3DDocumentCamera;

#elseif cpp

typedef Scene3DDocumentCamera = flight._cpp.Scene3DDocumentCamera;

#elseif (js && flight_esm)

typedef Scene3DDocumentCamera = flight._js.Scene3DDocumentCamera;

#elseif js

#error "flight.Scene3DDocumentCamera on js requires flight_esm."

#else

#error "flight.Scene3DDocumentCamera: no backend for this target."

#end
