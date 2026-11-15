package flight;

#if hl

typedef Scene3DLightBlock = flight._hl.Scene3DLightBlock;

#elseif cpp

typedef Scene3DLightBlock = flight._cpp.Scene3DLightBlock;

#elseif (js && flight_esm)

typedef Scene3DLightBlock = flight._js.Scene3DLightBlock;

#elseif js

#error "flight.Scene3DLightBlock on js requires flight_esm."

#else

#error "flight.Scene3DLightBlock: no backend for this target."

#end
