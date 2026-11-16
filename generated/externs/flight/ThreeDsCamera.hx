package flight;

#if hl

typedef ThreeDsCamera = flight._hl.ThreeDsCamera;

#elseif cpp

typedef ThreeDsCamera = flight._cpp.ThreeDsCamera;

#elseif (js && flight_esm)

typedef ThreeDsCamera = flight._js.ThreeDsCamera;

#elseif js

#error "flight.ThreeDsCamera on js requires flight_esm."

#else

#error "flight.ThreeDsCamera: no backend for this target."

#end
