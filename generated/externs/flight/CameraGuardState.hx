package flight;

#if hl

typedef CameraGuardState = flight._hl.CameraGuardState;

#elseif cpp

typedef CameraGuardState = flight._cpp.CameraGuardState;

#elseif (js && flight_esm)

typedef CameraGuardState = flight._js.CameraGuardState;

#elseif js

#error "flight.CameraGuardState on js requires flight_esm."

#else

#error "flight.CameraGuardState: no backend for this target."

#end
