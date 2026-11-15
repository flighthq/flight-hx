package flight;

#if hl

typedef Scene3DLights = flight._hl.Scene3DLights;

#elseif cpp

typedef Scene3DLights = flight._cpp.Scene3DLights;

#elseif (js && flight_esm)

typedef Scene3DLights = flight._js.Scene3DLights;

#elseif js

#error "flight.Scene3DLights on js requires flight_esm."

#else

#error "flight.Scene3DLights: no backend for this target."

#end
