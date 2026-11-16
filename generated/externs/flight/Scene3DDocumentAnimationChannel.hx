package flight;

#if hl

typedef Scene3DDocumentAnimationChannel = flight._hl.Scene3DDocumentAnimationChannel;

#elseif cpp

typedef Scene3DDocumentAnimationChannel = flight._cpp.Scene3DDocumentAnimationChannel;

#elseif (js && flight_esm)

typedef Scene3DDocumentAnimationChannel = flight._js.Scene3DDocumentAnimationChannel;

#elseif js

#error "flight.Scene3DDocumentAnimationChannel on js requires flight_esm."

#else

#error "flight.Scene3DDocumentAnimationChannel: no backend for this target."

#end
