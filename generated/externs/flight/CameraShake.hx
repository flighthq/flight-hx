package flight;

#if hl

typedef CameraShake = flight._hl.CameraShake;

#elseif cpp

typedef CameraShake = flight._cpp.CameraShake;

#elseif (js && flight_esm)

typedef CameraShake = flight._js.CameraShake;

#elseif js

#error "flight.CameraShake on js requires flight_esm."

#else

#error "flight.CameraShake: no backend for this target."

#end
