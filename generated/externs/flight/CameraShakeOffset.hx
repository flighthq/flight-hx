package flight;

#if hl

typedef CameraShakeOffset = flight._hl.CameraShakeOffset;

#elseif cpp

typedef CameraShakeOffset = flight._cpp.CameraShakeOffset;

#elseif (js && flight_esm)

typedef CameraShakeOffset = flight._js.CameraShakeOffset;

#elseif js

#error "flight.CameraShakeOffset on js requires flight_esm."

#else

#error "flight.CameraShakeOffset: no backend for this target."

#end
