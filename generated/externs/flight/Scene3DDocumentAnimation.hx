package flight;

#if hl

typedef Scene3DDocumentAnimation = flight._hl.Scene3DDocumentAnimation;

#elseif cpp

typedef Scene3DDocumentAnimation = flight._cpp.Scene3DDocumentAnimation;

#elseif (js && flight_esm)

typedef Scene3DDocumentAnimation = flight._js.Scene3DDocumentAnimation;

#elseif js

#error "flight.Scene3DDocumentAnimation on js requires flight_esm."

#else

#error "flight.Scene3DDocumentAnimation: no backend for this target."

#end
